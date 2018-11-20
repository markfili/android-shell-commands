#!/bin/sh

# execute any command on multiple hosts in parallel
# requires "parallel-ssh" linux package to be installed

USAGE="Usage: parallel.sh HOSTS_FILE [OUT_DIR_NAME] [NUM_OF_PARALLEL]"

if [ $# -eq 0 ]; then
    #statements
    echo "${USAGE}"
    exit
fi

if [ ! $1 ]; then
    echo "hosts file not set"
    exit
fi

OUTPUT=../result
ERRORS=../errors
PARALLEL=10

if [ $2 ]; then
    OUTPUT=$OUTPUT/$2
    ERRORS=$ERRORS/$2
fi
if [ $3 ]; then
    PARALLEL=$3
fi

HOSTS=$1

echo "reading from ${HOSTS}"
echo "writing output to ${OUTPUT}"
echo "writing errors to ${ERRORS}"

parallel-ssh -h $HOSTS -o $OUTPUT -e $ERRORS -O "StrictHostKeyChecking no" -t 20 -l root "whoami;"
