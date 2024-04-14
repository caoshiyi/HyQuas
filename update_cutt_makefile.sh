#!/bin/bash

# Path to the Makefile
MAKEFILE="${HYQUAS_ROOT}/third-party/cutt/Makefile"

# Backup the original Makefile
cp $MAKEFILE $MAKEFILE.bak

# Adding GENCODE_SM80
awk '/GENCODE_SM70  :=/ { print; print "GENCODE_SM80  := -gencode arch=compute_80,code=sm_80"; next }1' $MAKEFILE.bak > $MAKEFILE.tmp

# Update GENCODE_FLAGS to use GENCODE_SM80
sed 's/GENCODE_FLAGS := $(GENCODE_SM70)/GENCODE_FLAGS := $(GENCODE_SM80)/' $MAKEFILE.tmp > $MAKEFILE

# Clean up temporary file
rm $MAKEFILE.tmp
rm $MAKEFILE.bak

echo "Makefile updated successfully."
