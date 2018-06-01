#!/bin/bash

export FSLDIR="/usr/local/fsl-5.0.8"
 . /usr/local/fsl-5.0.8/etc/fslconf/fsl.sh

usage()
{
cat << EOF
usage: $0 options

OPTIONS:
  -h    Show this message
  -F    Full path to FIRST root directory
  -I    Participant ID
  -R    Structure (one of L_Accu L_Amyg L_Caud L_Hipp L_Pall L_Puta L_Thal R_Accu R_Amyg R_Caud R_Hipp R_Pall R_Puta R_Thal BrStem)
  -B    Boundary correction method, one of fast, thresh, none (See annotation for empirically determined best values for each structure)
EOF
}

#Read arguments entered by user
while getopts "hF:I:R:B:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    F)
      FIRSTDIR=$OPTARG
      ;;
    I)
      ID=$OPTARG
      ;;
    R)
      ROI=$OPTARG
      ;;
    B)
      METHOD=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

/usr/local/fsl-5.0.8/bin/first_boundary_corr -s $FIRSTDIR/${ID}_${ROI}.nii.gz -i $FIRSTDIR/${ID}_anat.nii.gz -b $METHOD -o $FIRSTDIR/${ID}_${ROI}_corr
