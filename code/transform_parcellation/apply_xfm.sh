#!/bin/bash

# 1: parcellation
# 2: mni 2mm to dwi xfm
# 3: parcellation in dwi space
# 4: eddy corrected dwi brain

flirt -applyxfm -in ${1} \
      -init ${2} -out ${3} \
      -ref ${4} -paddingsize 0.0 \
      -interp nearestneighbour
