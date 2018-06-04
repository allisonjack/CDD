#!/bin/bash

STUDYDIR=/Users/allisonjack/Documents/CDD_R01/FIRST/SHAPE_ANALYSIS

WKDIR=$STUDYDIR/${LABEL}_results/
ROI=L_Thal
LABEL=your_label
SUFF=fstat1_thr95
IDLIST=$STUDYDIR/IDs_${LABEL}.txt

TEMPFILE=$WKDIR/${ROI}_${LABEL}_${SUFF}_vertex_tmp.txt

fslmeants -i $WKDIR/${ROI}_${LABEL}_MNI.nii.gz -m $WKDIR/${ROI}_${LABEL}_MNI_T2_tfce_corrp_${SUFF}.nii.gz -o $TEMPFILE

paste $IDLIST $TEMPFILE >> $WKDIR/${ROI}_${LABEL}_${SUFF}_vertex.txt; rm $TEMPFILE
