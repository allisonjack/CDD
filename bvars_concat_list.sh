#!/bin/bash

HOME=/Users/allisonjack/Documents/CDD_R01
LABEL=your_label
IDLIST=$HOME/FIRST/SHAPE_ANALYSIS/IDs_${LABEL}.txt

for ROI in L_Thal R_Thal L_Amyg R_Amyg L_Caud R_Caud L_Hipp R_Hipp; do

      while read -r ID GRP || [[ -n "$ID" ]]; do

        INPUT=$HOME/FIRST/${ID}-${ROI}_first.bvars
        printf "$INPUT " >> bvarsin_${ROI}_tmp.txt

      done < $IDLIST

  BVARSIN=$(cat bvarsin_${ROI}_tmp.txt)

  OUTDIR=$HOME/FIRST/SHAPE_ANALYSIS
  mkdir -p $OUTDIR

  concat_bvars $OUTDIR/${ROI}_${LABEL}.bvars $BVARSIN

  rm *tmp*
done
