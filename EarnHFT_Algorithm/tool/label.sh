# nohup python tool/slice_model.py --data_path data/BTCUSDT/valid.feather \
#     >log/data/split_valid/BTCUSDT.log 2>&1 &

# nohup python tool/slice_model.py --data_path data/ETHUSDT/valid.feather \
#     >log/data/split_valid/ETHUSDT.log 2>&1 &

# nohup python tool/slice_model.py --data_path data/GALAUSDT/valid.feather \
#     >log/data/split_valid/GALAUSDT.log 2>&1 &

nohup python tool/slice_model.py --data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/merge/BTCUSDT/2023-08-10-2023-10-13/valid.feather \
    >log/data/split_valid/BTCTUSD.log 2>&1 &