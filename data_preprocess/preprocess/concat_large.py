import pandas as pd
import numpy as np
import os
import sys

def concat_result(df_name, data_path_list, save_path):
    if not os.path.exists(save_path):
        os.makedirs(save_path)
    df_list = []
    for df_path in data_path_list:
        df = pd.read_feather(os.path.join(df_path, df_name))
        df_list.append(df)
    all_df = pd.concat(df_list, axis=0)
    all_df.sort_values(by='timestamp', inplace=True)
    all_df.reset_index(drop=True, inplace=True)
    all_df.to_feather(os.path.join(save_path, df_name))
    return all_df

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python concat_and_save.py <symbols> <start_date> <end_date>")
        sys.exit(1)
    
    symbols = sys.argv[1]
    start_date = sys.argv[2]
    end_date = sys.argv[3]
    
    base_path = f"/mnt/sda1/novis/Projects/EarnHFT/data_preprocess/preprocess/concat_clean/{symbols}"
    dates_list = os.listdir(base_path)
    dates_list.sort()
    dates_list = [os.path.join(base_path, dates) for dates in dates_list if start_date <= dates <= end_date]
    
    save_path = f"preprocess/concat_clean/{symbols}/{start_date}-{end_date}"
    
    concat_result(df_name="orderbook.feather", data_path_list=dates_list, save_path=save_path)
    concat_result(df_name="trade_minitue.feather", data_path_list=dates_list, save_path=save_path)
    concat_result(df_name="trade_second.feather", data_path_list=dates_list, save_path=save_path)
