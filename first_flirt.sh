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
EOF
}

#Read arguments entered by user
while getopts "hF:I:" OPTION
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
    ?)
      usage
      exit
      ;;
  esac
done

/usr/local/fsl-5.0.8/bin/first_flirt $FIRSTDIR/${ID}_anat.nii.gz $FIRSTDIR/${ID}_to_std_sub
~                                                                                                   
