#!/bin/bash

#output from SUIT normalization

#wsuit_mGM_prob.nii

#merge individual GM probability images in the -t dimension, take mean across -t dim, thresh
#above 0 and binarize to create a merged 4D mask

STUDYDIR=/Users/allisonjack/Documents/CDD_R01/SUIT

cat $STUDYDIR/SUIT_IDs.txt | while read ID || [ -n "$ID" ]; do

	INPUT=$STUDYDIR/$ID/wcmGM_prob.nii
	printf "$INPUT " >> $STUDYDIR/gm_merg_tmp.txt

done

GMIN=$(cat $STUDYDIR/gm_merg_tmp.txt)

fslmerge -t GM_merg $GMIN

fslmaths GM_merg -Tmean -nan -thr 0.01 -bin GM_mask -odt char

#smooth with FWHM kernel of 4mm
# to get sigma: 4/2.3548 = 1.698658

fslmaths GM_merg -s 1.698658 GM_merg_FWHM_4mm

rm $STUDYDIR/gm_merg_tmp.txt
