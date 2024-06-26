CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/low_level/ddqn_pes_risk_aware.py \
    --beta 100 --train_data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/merge/BTCUSDT/2023-08-10-2023-10-13/train --dataset_name BTCUSDT   \
    >log/train/BTCUSDT/low_level/beta_100.log 2>&1 &


CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/low_level/ddqn_pes_risk_aware.py \
    --beta -10 --train_data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/merge/BTCUSDT/2023-08-10-2023-10-13/train --dataset_name BTCUSDT \
    >log/train/BTCUSDT/low_level/beta_-10.log 2>&1 &


CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/low_level/ddqn_pes_risk_aware.py \
    --beta -90 --train_data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/merge/BTCUSDT/2023-08-10-2023-10-13/train --dataset_name BTCUSDT \
    >log/train/BTCUSDT/low_level/beta_-90.log 2>&1 &


CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/low_level/ddqn_pes_risk_aware.py \
    --beta 30 --train_data_path /mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/merge/BTCUSDT/2023-08-10-2023-10-13/train --dataset_name BTCUSDT \
    >log/train/BTCUSDT/low_level/beta_30.log 2>&1 &



