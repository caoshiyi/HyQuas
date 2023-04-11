#!/bin/bash
source ../scripts/init.sh -DBACKEND=mix -DSHOW_SUMMARY=on -DSHOW_SCHEDULE=off -DMICRO_BENCH=on -DUSE_DOUBLE=on -DDISABLE_ASSERT=off -DENABLE_OVERLAP=on -DMEASURE_STAGE=off -DEVALUATOR_PREPROCESS=on -DUSE_MPI=on -DMAT=7
`which mpirun` -host nico1:2,nico2:2 -x GPUPerRank=4 ../scripts/env.sh ../scripts/gpu-bind.sh ./main ../tests/input/qft_28.qasm
# CUDA_VISIBLE_DEVICES=0,1,2,3 ./main ../tests/input/qft_28.qasm