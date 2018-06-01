#!bin/bash

WKDIR=/Users/allisonjack/Documents/CDD_R01/FIRST
OUTDIR=/Users/allisonjack/Documents/CDD_R01/R
IDLIST=$WKDIR/SHAPE_ANALYSIS/IDs_all_n43.txt
ROILIST=$WKDIR/ROIs_bounds.txt

OUTPUT=$OUTDIR/all_n43_volume_first.txt

printf "ID\tROI\tVol_mm\n" >> $OUTPUT

cat $IDLIST | while read ID || [ -n "$ID" ]; do
	cat $ROILIST | while read ROI LW UP || [ -n "$UP" ]; do
		VOL=$(fslstats ${ID}_all_fast_firstseg -l $LW -u $UP -V | awk '{print $2}')
		printf "${ID}\t${ROI}\t${VOL}\n" >> $OUTPUT
	done
done
