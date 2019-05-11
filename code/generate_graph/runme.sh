#!/bin/bash

# 1: participant label

mountdir=~/ace_mount/ace_shared/bkhundrakpam/For_Greg/${1}/ALL_VOLS/
outdir=~/ace_mount/ace_shared/gkiar/budha_analysis/${1}/

mkdir -p ${outdir}

docker run -ti \
           -v ${PWD}:${PWD} -w ${PWD} \
           -v ${mountdir}:/rundata/ \
           -v ${outdir}:/outdata/ \
           gkiar/deterministic_tracking \
           /rundata/dti_ec.nii.gz \
           /rundata/bvecs \
           /rundata/bvals \
           /rundata/whitematter_mask.nii.gz \
           /outdata/whitematter_boundary.nii.gz \
           /outdata/ \
           --labels /outdata/DK_in_DTI.nii.gz \
           --prune 3 \
           --verbose
