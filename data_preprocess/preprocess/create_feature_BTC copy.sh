symbol = "ETHUSDT"
start_date = "2023-08-10"
end_date = "2023-10-13"

nohup python preprocess/create_feature.py \
--data_path preprocess/concat_clean/$symbol/$start_date-$end_date &