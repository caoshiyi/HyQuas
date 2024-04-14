#!/bin/bash
case $(hostname -s) in
  nico*)
    echo "[CLUSTER] nico"
    source /opt/spack/share/spack/setup-env.sh
    spack load cuda@10.2.89 /v5oqq5n
    spack load openmpi@4.0.5 /h5eun6a
    export NCCL_ROOT=/home/heheda/tools/nccl/build
    export CPATH=$NCCL_ROOT/include:$CPATH
    export LIBRARY_PATH=$NCCL_ROOT/lib:$LIBRARY_PATH
    export LD_LIBRARY_PATH=$NCCL_ROOT/lib:$LD_LIBRARY_PATH
    ;;
  gorgon*)
    echo "[CLUSTER] gorgon"
    source /usr/local/Modules/init/bash
    module load cuda-10.2/cuda
    module load cmake-3.12.3
    module load openmpi-3.0.0
    ;;
  i*)
    echo "[CLUSTER] scc"
    source /opt/spack/share/spack/setup-env.sh
    spack load cuda@10.2.89 /tlfcinz
    spack load openmpi@3.1.6 /5aaect6
    ;;
  hanzo)
    echo "[CLUSTER] hanzo"
    source /opt/spack/share/spack/setup-env.sh
    export PATH=$HOME/package/cmake-3.19.2-Linux-x86_64/bin:/usr/mpi/gcc/openmpi-4.1.0rc5/bin:$PATH
    # use system mpi
    export CPATH=/usr/mpi/gcc/openmpi-4.1.0rc5/include:${CPATH-}
    spack load gcc@8.3.0 /liymwyb
    spack load cuda@10.2.89 /tlfcinz
    ;;
  nova)
    echo "[CLUSTER] nova"
    source /opt/spack/share/spack/setup-env.sh
    spack load cuda@11 /njgeoec
    spack load openmpi /dfes7hw
    ;;
  nid*)
    echo "[CLUSTER] Perlmutter"
    module load cudatoolkit/11.7
    module load nccl/2.15.5
    module load gcc/11.2.0
    module load cray-mpich/8.1.25
    export NCCL_ROOT=/global/common/software/nersc/pm-2022q4/sw/nccl-2.15.5-ofi-r4
    export LD_LIBRARY_PATH=$NCCL_ROOT/lib:$LD_LIBRARY_PATH
esac

$@