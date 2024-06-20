import pandas as pd
import os
from hftbacktest import HftBacktest, FeedLatency, Linear
from datetime import datetime
from concurrent.futures import ThreadPoolExecutor, as_completed

# 設定資料的根目錄和輸出目錄
data_dir = '/mnt/sda1/novis/SideProject/history/hft'
output_base_dir = './data_preprocess/download_code/download_from_tardis/'
data_types = 'book_snapshot_5'

# 確保輸出目錄存在
os.makedirs(output_base_dir, exist_ok=True)

def convert_to_dataframe(hbt, exchange, symbol):
    data = []
    ask_depth = hbt.ask_depth
    bid_depth = hbt.bid_depth
    tick_size = hbt.tick_size

    while hbt.run:
        if not hbt.elapse(60 * 1e6):
            break

        current_timestamp = hbt.current_timestamp
        row = {
            'exchange': exchange,
            'symbol': symbol,
            'timestamp': current_timestamp,
            'local_timestamp': current_timestamp,
        }

        # 處理 ask 深度
        for i in range(5):
            tick_price = hbt.best_ask_tick + i
            if tick_price in ask_depth:
                row[f'asks[{i}].price'] = round(tick_price * tick_size, 5)
                row[f'asks[{i}].amount'] = ask_depth[tick_price]
            else:
                row[f'asks[{i}].price'] = 0
                row[f'asks[{i}].amount'] = 0

        # 處理 bid 深度
        for i in range(5):
            tick_price = hbt.best_bid_tick - i
            if tick_price in bid_depth:
                row[f'bids[{i}].price'] = round(tick_price * tick_size, 5)
                row[f'bids[{i}].amount'] = bid_depth[tick_price]
            else:
                row[f'bids[{i}].price'] = 0
                row[f'bids[{i}].amount'] = 0

        data.append(row)

    df = pd.DataFrame(data)
    return df

def process_file(symbol, data_file, snapshot_file):
    data_path = os.path.join(data_dir, data_file)
    snapshot_path = os.path.join(data_dir, snapshot_file)

    # 確保日期匹配
    data_date = data_file.split('_')[1].split('.')[0]
    snapshot_date = snapshot_file.split('_')[1].split('.')[0]

    if data_date != snapshot_date:
        print(f"警告: {symbol} 的 {data_file} 和 {snapshot_file} 日期不匹配。跳過這些檔案。")
        return

    # 取得日期
    date = datetime.strptime(data_date, '%Y%m%d').strftime('%Y-%m-%d')

    # 設定輸出檔案路徑和名稱
    output_dir = os.path.join(output_base_dir, symbol, data_types)
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f"binance_{data_types}_{date}_{symbol}.csv")

    # 檢查目的地檔案是否已存在
    if os.path.exists(output_path):
        print(f"檔案已存在，跳過: {output_path}")
        return

    # 載入資料
    data = pd.read_parquet(data_path)
    snapshot = pd.read_parquet(snapshot_path)

    # 初始化 HftBacktest
    hbt = HftBacktest(
        data,
        tick_size=0.1,
        lot_size=0.001,
        maker_fee=0.0002,
        taker_fee=0.0007,
        order_latency=FeedLatency(),
        asset_type=Linear,
        snapshot=snapshot
    )

    # 轉換資料並加入 exchange 和 symbol 欄位
    df = convert_to_dataframe(hbt, exchange='binance', symbol=symbol)

    # 儲存為 csv 檔案
    df.to_csv(output_path, index=False)

# 將所有資料檔案按幣對分類
files = os.listdir(data_dir)
data_files = sorted([f for f in files if not f.endswith('.snapshot.pqt')])
snapshot_files = sorted([f for f in files if f.endswith('.snapshot.pqt')])

symbols = set([os.path.basename(f).split('_')[0].upper() for f in data_files])

# 使用 ThreadPoolExecutor 進行平行處理
with ThreadPoolExecutor(max_workers=4) as executor:
    futures = []
    for symbol in symbols:
        symbol_data_files = sorted([f for f in data_files if symbol.lower() in f])
        symbol_snapshot_files = sorted([f for f in snapshot_files if symbol.lower() in f])

        # 檢查資料檔案和快照檔案數量是否一致
        if len(symbol_data_files) != len(symbol_snapshot_files):
            print(f"警告: {symbol} 的資料檔案和快照檔案數量不一致。跳過這些檔案。")
            continue

        for data_file, snapshot_file in zip(symbol_data_files, symbol_snapshot_files):
            futures.append(executor.submit(process_file, symbol, data_file, snapshot_file))

    for future in as_completed(futures):
        future.result()

print("所有資料處理完成。")
