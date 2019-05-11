#!/bin/bash

# 1: participant label

mountdir=~/ace_mount/ace_shared/bkhundrakpam/For_Greg/${1}/ALL_VOLS/
outdir=~/ace_mount/ace_shared/gkiar/budha_analysis/${1}/

mkdir -p ${outdir}

docker run -ti \
           -v ${PWD}:${PWD} -w ${PWD} \
           -v ${mountdir}:/rundata/ \
           -v ${outdir}:/outdata/ \
           gkiar/mask2boundary \
           /rundata/whitematter_mask.nii.gz \
           /outdata/whitematter_boundary.nii.gz \
           --width 3
