CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/high_level/dqn_position.py \
    --train_data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/merge/BTCUSDT/2023-08-10-2023-10-13/train.feather --dataset_name BTCUSDT \
    >log/train/BTCUSDT/high_level/log.log 2>&1 &
