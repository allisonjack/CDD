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
EOF
}

#Read arguments entered by user
while getopts "hF:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    F)
      FIRSTDIR=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

/usr/local/fsl-5.0.8/bin/first_roi_slicesdir $FIRSTDIR/*_anat.nii.gz $FIRSTDIR/*_all_fast_firstseg.nii.gz
