#!/bin/bash -e

# Medium Run with very little accuracy
# python train.py config/train_shakespeare_char.py --compile=False --eval_iters=20 --log_interval=1 --block_size=256 \
# --batch_size=64 --n_layer=4 --n_head=4 --n_embd=768 --max_iters=5000 --lr_decay_iters=200 --dropout=0.2

# Better Run with more little accuracy

option=$1
export TORCH_USE_CUDA_DSA=1
export CUDA_LAUNCH_BLOCKING=1

#case $option in
#	-s|--start)  torchrun train.py config/train_shakespeare_char.py --compile=False --eval_iters=20 --log_interval=1 --batch_size=12 \
#	--n_layer=6 --n_head=6 --n_embd=840 --max_iters=5000 \
#	--lr_decay_iters=5000 --dropout=0.1
#	;;
#	-k|--kill) for i in {0..9}; do sudo kill -9 $(pgrep torchrun); printf "iter: $i\n"; done;;
#esac

case $option in
	-s|--start)  CUDA_VISIBLE_DEVICES=0,1 torchrun train.py config/train_shakespeare_char.py --compile=False --eval_iters=20 --log_interval=1 --batch_size=12 \
	--n_layer=6 --n_head=6 --n_embd=840 --max_iters=5000 \
	--lr_decay_iters=5000 --dropout=0.1
	;;
	-k|--kill) for i in {0..9}; do sudo kill -9 $(pgrep torchrun); printf "iter: $i\n"; done;;
esac


