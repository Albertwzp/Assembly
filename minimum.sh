# !/bin/sh
as minimum.s -o minimum.o
ld minimum.o -o minimum
./minimum
echo $?
