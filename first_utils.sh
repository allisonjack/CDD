#!/bin/bash

HOME=/Users/allisonjack/Documents/CDD_R01/FIRST
MAIN=$HOME/SHAPE_ANALYSIS

for ROI in L_Thal R_Thal L_Amyg R_Amyg L_Caud R_Caud L_Hipp R_Hipp; do 

  first_utils --vertexAnalysis --usebvars -i $MAIN/${ROI}_onset2_CDD_ASDR.bvars -d $MAIN/onset2_CDD_ASDR.mat -o $MAIN/${ROI}_onset2_CDD_ASDR_MNI --useReconMNI 

done
