
################################################################################
#
# Build script for project
#
################################################################################

EXECUTABLE	:= p3mstandalone
# CUDA source files (compiled with cudacc)
CUFILES		:= 
# CUDA dependency files
CU_DEPS		:=

# C/C++ source files (compiled with gcc / c++)
CFILES		:= main.c charge-assign.c error.c ewald.c interpol.c io.c p3m-common.c p3m-ik.c p3m-ad.c p3m-ik-i.c p3m-ad-i.c realpart.c common.c

ROOTBINDIR := bin

# LIBS = -lefence

################################################################################
# Rules and targets
#CUDACCFLAGS=--maxrregcount=40
CUDACCFLAGS=--ptxas-options=-v -g -G
ROOTDIR=/auto.anoa/home/dominic/NVIDIA_GPU_Computing_SDK_2_3/C/src
include $(ROOTDIR)/../common/common.mk

CFLAGS=-std=gnu99 -g -Wall -DHAVE_OMP -fopenmp
LIB+=-lfftw3 -lm -fopenmp

