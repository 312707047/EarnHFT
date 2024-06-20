#!/bin/bash

# 設定起始日期和終止日期
start_date="2023-08-10"
end_date="2023-10-13"
step=2 # 每次處理的天數間隔
symbols="BTCUSDT" # 可以在這裡設定你需要的 symbols

# 將日期轉換為秒數
start_seconds=$(date -d "$start_date" +%s)
end_seconds=$(date -d "$end_date" +%s)
step_seconds=$(( step * 24 * 60 * 60 ))

current_seconds=$start_seconds

while [ $current_seconds -le $end_seconds ]
do
  next_seconds=$(( current_seconds + step_seconds - 1 ))
  if [ $next_seconds -gt $end_seconds ]; then
    next_seconds=$end_seconds
  fi
  
  current_date=$(date -d @$current_seconds +%Y-%m-%d)
  next_date=$(date -d @$next_seconds +%Y-%m-%d)
  
  echo "Executing: python preprocess/concat_clean.py --data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/download_from_tardis --symbols $symbols --start_date $current_date --end_date $next_date"
  
  python preprocess/concat_clean.py \
    --data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/download_from_tardis \
    --symbols $symbols \
    --start_date $current_date \
    --end_date $next_date
  
  current_seconds=$(( next_seconds + 1 ))
done

# 執行 Python 腳本
echo "Executing: python concat_and_save.py $symbols $start_date $end_date"
python concat_and_save.py $symbols $start_date $end_date