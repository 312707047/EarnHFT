import pandas as pd
import os
import gc
from datetime import datetime
from concurrent.futures import ThreadPoolExecutor, as_completed

# 設定資料的根目錄和輸出目錄
data_dir = '/mnt/sda1/novis/SideProject/history/hft'
output_base_dir = './data_preprocess/download_code/download_from_tardis/'
data_types = 'trades'

# 確保輸出目錄存在
os.makedirs(output_base_dir, exist_ok=True)

def process_file(data_file):
    symbol = os.path.basename(data_file).split('_')[0].upper()
    date_str = data_file.split('_')[1].split('.')[0]
    date = datetime.strptime(date_str, '%Y%m%d').strftime('%Y-%m-%d')
    output_dir = os.path.join(output_base_dir, symbol, data_types)
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f"binance_{data_types}_{date}_{symbol}.csv")
    
    # 檢查輸出檔案是否已存在
    if os.path.exists(output_path):
        print(f"檔案已存在，跳過: {output_path}")
        return

    data_path = os.path.join(data_dir, data_file)

    # 載入資料
    df = pd.read_parquet(data_path)
    
    # 重新命名欄位
    df = df.rename(columns={
        'exch_timestamp': 'timestamp',
        'qty': 'amount',
    })
    
    # 刪除 event 欄位
    df = df.drop(columns=['event'])
    
    # 將 side 從 1 和 -1 轉換為 buy 和 sell
    df['side'] = df['side'].map({1: 'buy', -1: 'sell'})
    
    # 新增 exchange 和 symbol 欄位
    df['exchange'] = 'binance'
    df['symbol'] = symbol
    
    # 儲存為 csv 檔案
    df.to_csv(output_path, index=False)
    
    # 清理記憶體
    del df
    gc.collect()

# 將所有資料檔案按幣對分類
files = os.listdir(data_dir)
data_files = sorted([f for f in files if not f.endswith('.snapshot.pqt')])

# 使用 ThreadPoolExecutor 進行多執行緒處理，限制同時進行的任務數量
max_workers = 4  # 根據你的系統內存調整
with ThreadPoolExecutor(max_workers=max_workers) as executor:
    futures = []
    for data_file in data_files:
        futures.append(executor.submit(process_file, data_file))

    for future in as_completed(futures):
        future.result()

print("所有資料處理完成。")
