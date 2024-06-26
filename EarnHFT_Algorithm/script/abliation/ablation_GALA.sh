CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_6.feather --dataset_name GALAUSDT_df_6 --ada_init 0 --ada_min 0 --perfect_trans True \
    >log/ablation/df_6_ada_0_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_6.feather --dataset_name GALAUSDT_df_6 --ada_init 256 --perfect_trans True \
    >log/ablation/df_6_ada_256_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=2 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_6.feather --dataset_name GALAUSDT_df_6 --ada_init 0 --ada_min 0 \
    >log/ablation/df_6_ada_0_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=3 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_6.feather --dataset_name GALAUSDT_df_6 --ada_init 256 \
    >log/ablation/df_6_ada_256_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_9.feather --dataset_name GALAUSDT_df_9 --ada_init 0 --ada_min 0 --perfect_trans True \
    >log/ablation/df_9_ada_0_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_9.feather --dataset_name GALAUSDT_df_9 --ada_init 256 --perfect_trans True \
    >log/ablation/df_9_ada_256_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=2 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_9.feather --dataset_name GALAUSDT_df_9 --ada_init 0 --ada_min 0 \
    >log/ablation/df_9_ada_0_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=3 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_9.feather --dataset_name GALAUSDT_df_9 --ada_init 256 \
    >log/ablation/df_9_ada_256_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_12.feather --dataset_name GALAUSDT_df_12 --ada_init 0 --ada_min 0 --perfect_trans True \
    >log/ablation/df_12_ada_0_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_12.feather --dataset_name GALAUSDT_df_12 --ada_init 256 --perfect_trans True \
    >log/ablation/df_12_ada_256_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=2 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_12.feather --dataset_name GALAUSDT_df_12 --ada_init 0 --ada_min 0 \
    >log/ablation/df_12_ada_0_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=3 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_12.feather --dataset_name GALAUSDT_df_12 --ada_init 256 \
    >log/ablation/df_12_ada_256_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_15.feather --dataset_name GALAUSDT_df_15 --ada_init 0 --ada_min 0 --perfect_trans True \
    >log/ablation/df_15_ada_0_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_15.feather --dataset_name GALAUSDT_df_15 --ada_init 256 --perfect_trans True \
    >log/ablation/df_15_ada_256_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=2 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_15.feather --dataset_name GALAUSDT_df_15 --ada_init 0 --ada_min 0 \
    >log/ablation/df_15_ada_0_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=3 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_15.feather --dataset_name GALAUSDT_df_15 --ada_init 256 \
    >log/ablation/df_15_ada_256_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_18.feather --dataset_name GALAUSDT_df_18 --ada_init 0 --ada_min 0 --perfect_trans True \
    >log/ablation/df_18_ada_0_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_18.feather --dataset_name GALAUSDT_df_18 --ada_init 256 --perfect_trans True \
    >log/ablation/df_18_ada_256_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=2 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_18.feather --dataset_name GALAUSDT_df_18 --ada_init 0 --ada_min 0 \
    >log/ablation/df_18_ada_0_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=3 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_18.feather --dataset_name GALAUSDT_df_18 --ada_init 256 \
    >log/ablation/df_18_ada_256_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_21.feather --dataset_name GALAUSDT_df_21 --ada_init 0 --ada_min 0 --perfect_trans True \
    >log/ablation/df_21_ada_0_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_21.feather --dataset_name GALAUSDT_df_21 --ada_init 256 --perfect_trans True \
    >log/ablation/df_21_ada_256_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=2 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_21.feather --dataset_name GALAUSDT_df_21 --ada_init 0 --ada_min 0 \
    >log/ablation/df_21_ada_0_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=3 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_21.feather --dataset_name GALAUSDT_df_21 --ada_init 256 \
    >log/ablation/df_21_ada_256_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=0 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_24.feather --dataset_name GALAUSDT_df_24 --ada_init 0 --ada_min 0 --perfect_trans True \
    >log/ablation/df_24_ada_0_trans_true.log 2>&1 &

CUDA_VISIBLE_DEVICES=1 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_24.feather --dataset_name GALAUSDT_df_24 --ada_init 256 --perfect_trans True \
    >log/ablation/df_24_ada_256_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=2 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_24.feather --dataset_name GALAUSDT_df_24 --ada_init 0 --ada_min 0 \
    >log/ablation/df_24_ada_0_trans_none.log 2>&1 &

CUDA_VISIBLE_DEVICES=3 nohup python RL/agent/ablation/dqn.py \
    --train_data_path data/GALAUSDT/train/df_24.feather --dataset_name GALAUSDT_df_24 --ada_init 256 \
    >log/ablation/df_24_ada_256_trans_true.log 2>&1 &
