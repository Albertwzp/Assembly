# !/bin/sh
as maximum.s -o maximum.o
ld maximum.o -o maximum
./maximum
echo $?
