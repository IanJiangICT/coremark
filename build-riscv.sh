#!/bin/bash

# Note:
# - Use Linux cross-compiler
# - Use clock_gettime() rather than clock(), i.e. define HAS_TIME_H not define USE_CLOCK

CROSS_COMPILE=riscv64-unknown-elf
CROSS_COMPILE=riscv64-unknown-linux-gnu
CC=$CROSS_COMPILE-gcc
$CC -O2 -Ilinux64 -I. -DFLAGS_STR=\""-O2 -DPERFORMANCE_RUN=1"\" \
	-DITERATIONS=0 -static -DPERFORMANCE_RUN=1 \
	-DHAS_TIME_H \
	core_list_join.c core_main.c core_matrix.c core_state.c core_util.c linux64/core_portme.c \
	-o ./coremark.exe

