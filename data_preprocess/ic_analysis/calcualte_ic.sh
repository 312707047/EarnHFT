#!/bin/bash

# 設定資料目錄和日誌檔案目錄
DATA_DIR="preprocess/merge/BTCUSDT"
LOG_DIR="ic_analysis/log"
SCRIPT="ic_analysis/calculate_ic.py"

# 建立日誌檔案目錄（若尚未存在）
mkdir -p $LOG_DIR

# 遍歷資料目錄下的所有子目錄
for SUBDIR in $DATA_DIR/*; do
    # 確認子目錄存在 df.feather 檔案
    if [ -f "$SUBDIR/df.feather" ]; then
        # 提取子目錄名稱以用於日誌檔案名稱
        DIR_NAME=$(basename $SUBDIR)
        
        # 執行 Python 腳本並將輸出重定向到相應的日誌檔案
        nohup python $SCRIPT --data_path "$SUBDIR/df.feather" > "$LOG_DIR/BTCUSDT_${DIR_NAME}.log" 2>&1 &
    fi
done
