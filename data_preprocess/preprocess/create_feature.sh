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

nohup python preprocess/create_feature.py \
--data_path preprocess/concat_clean/$symbol/$start_date-$end_date \
> $log_dir/${symbol}_create.log 2>&1 &
