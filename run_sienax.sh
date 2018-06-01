#!/bin/bash

export FSLDIR="/usr/local/fsl-5.0.8"
. /usr/local/fsl-5.0.8/etc/fslconf/fsl.sh

usage()
{
cat << EOF
usage: $0 options

OPTIONS:
   -h  Show this message
   -I  Input T1-weighted image 
   -O  Output
EOF
}

while getopts "hI:O:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    I)
      INPUT=$OPTARG
      ;;
    O)
      OUTPUT=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

/usr/local/fsl-5.0.8/bin/sienax $INPUT -B "-f 0.3 -B" -o $OUTPUT
