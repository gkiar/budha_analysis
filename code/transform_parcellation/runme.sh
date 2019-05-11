#!/bin/bash

# 1: participant label

mountdir=~/ace_mount/ace_shared/bkhundrakpam/For_Greg/${1}/ALL_VOLS/
outdir=~/ace_mount/ace_shared/gkiar/budha_analysis/${1}/

mkdir -p ${outdir}

docker run -ti \
           -v ${PWD}:${PWD} -w ${PWD} \
           -v ${mountdir}:/rundata/ \
           -v ${outdir}:/outdata/ \
           --entrypoint ${PWD}/apply_xfm.sh \
           gkiar/dwipreproc_fsl-5.0.11_minified \
           ${PWD}/DK_res-2x2x2.nii.gz \
           /rundata/MNI_2mm_to_DTI.mat \
           /outdata/DK_in_DTI.nii.gz \
           /rundata/dti_ec_brain.nii.gz
