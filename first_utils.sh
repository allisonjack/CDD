#!/bin/bash

HOME=/Users/allisonjack/Documents/CDD_R01/FIRST
LABEL=your_label
MAIN=$HOME/SHAPE_ANALYSIS

for ROI in L_Thal R_Thal L_Amyg R_Amyg L_Caud R_Caud L_Hipp R_Hipp; do 

  first_utils --vertexAnalysis --usebvars -i $MAIN/${ROI}_${LABEL}.bvars -d $MAIN/${LABEL}.mat -o $MAIN/${ROI}_${LABEL}_MNI --useReconMNI 

done
