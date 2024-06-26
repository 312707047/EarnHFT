#!/bin/bash

symbol=$1
start_date=$2
end_date=$3

if [ -z "$symbol" ] || [ -z "$start_date" ] || [ -z "$end_date" ]; then
  echo "Usage: $0 <symbol> <start_date> <end_date>"
  exit 1
fi

log_dir="preprocess/log"
mkdir -p $log_dir

nohup python preprocess/merge_new.py \
--data_path preprocess/create_features/$symbol/$start_date-$end_date/beatrate_0.0001 \
> $log_dir/${symbol}_merge.log 2>&1 &