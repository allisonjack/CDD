#!/bin/bash 
export FSLDIR="/usr/local/fsl-5.0.8"
. /usr/local/fsl-5.0.8/etc/fslconf/fsl.sh

usage()
{
cat << EOF
usage: $0 options

OPTIONS:
   -h  Show this message
   -I  .nii.gz input file prepared by first_utils
   -M  Mask file prepared by first_utils
   -O  Base name for output
   -D  Base name for design files
   
EOF
}

while getopts "hI:M:O:R:D:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    I)
      INPUT=$OPTARG
      ;;
    M)
      MASK=$OPTARG
      ;;
    O)
      OUTPUT=$OPTARG
      ;;
    R)
      ROOTDIR=$OPTARG
      ;;
    D)
      DESIGN=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

/usr/local/fsl-5.0.8/bin/randomise -i $INPUT -m $MASK -o ${ROOTDIR}/$OUTPUT -d $ROOTDIR/${DESIGN}.mat -t $ROOTDIR/${DESIGN}.con -f $ROOTDIR/${DESIGN}.fts -D --T2 --uncorrp >> /ifshome/ajack/REGRESS/STDOUT/${OUTPUT}_stdout.txt
