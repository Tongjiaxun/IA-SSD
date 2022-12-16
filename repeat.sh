#!/bin/bash

mkdir -p log
cp *.sh log/

gpu=0
for round in $(seq 1 3); do
    confname="B2PE_round_${round}"
    mkdir -p configs/B2PE
    confpath=configs/B2PE/${confname}.yaml
    cp tools/cfgs/kitti_models/B2PE.yaml $confpath
    param="tools/tjx_train.py --cfg_file $confpath"
    nohup bash run_one.sh $gpu "$param" 1 1 2>&1 1>log/log.$confname.r$round &
    gpu=`expr $gpu + 1`
	if [ $gpu -eq 1 ]; then
	   gpu=0
	   wait
    fi
done