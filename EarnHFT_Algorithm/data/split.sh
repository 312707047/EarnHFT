# nohup python data/split_data.py --data_path data/BTCUSDT \
#     >log/data/split/BTCUSDT.log 2>&1 &

# nohup python data/split_data.py --data_path data/ETHUSDT \
#     >log/data/split/ETHUSDT.log 2>&1 &

# nohup python data/split_data.py --data_path data/GALAUSDT \
#     >log/data/split/GALAUSDT.log 2>&1 &


nohup python data/split_data.py --data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/merge/ETHUSDT/2023-08-10-2023-08-12 \
    >log/data/split/ETHUSDT.log 2>&1 &
