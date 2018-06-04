#!/bin/bash

LABEL=n40_MS

cat ../ROIs.txt | while read ROI || [ -n "$ROI" ]; do
        for FSTAT in {1..5}; do
                RANGE=$(fslstats ${ROI}_${LABEL}_MNI_T2_tfce_corrp_fstat${FSTAT} -R)
                echo $ROI fstat${FSTAT} $RANGE
        done
done
