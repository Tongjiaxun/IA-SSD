for((i=0;i<$3;i++));do
    CUDA_VISIBLE_DEVICES=$1 python $2
done
