#!/bin/bash

mkdir -p log
cp *.py *.sh log

gpu=2

# for temp in 0.05 0.5; do
for rate in 0.1 0.15 0.2 0.25; do
for thresh in 0 0.3 0.6; do
    confname="Contrast_thresh${thresh}_rate${rate}"
    mkdir -p configs/Contrast
    confpath=configs/Contrast/${confname}.yaml
    cp Contrast_temp.yaml $confpath
    # sed -i "s/__data__/$data/g" $confpath
    sed -i "s/__thresh__/$thresh/g" $confpath
    sed -i "s/__rate__/$rate/g" $confpath
    param="tools/tjx_train.py --cfg_file $confpath"
    nohup bash run_one.sh $gpu "$param" 1 1 2>&1 1>log/log.$confname &
    gpu=`expr $gpu + 1`
    if [ $gpu -eq 4 ]; then
        gpu=2
        wait
    fi  
done
done