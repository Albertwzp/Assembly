#!/bin/bash
read -p "Input %eax: " eax
read -p "Input %ebx: " ebx
sed -ri "6s/[+-]?[[:digit:]]{1,}/${eax}/" exit.s
sed -ri "7s/[+-]?[[:digit:]]{1,}/${ebx}/" exit.s
as exit.s -o exit.o
ld exit.o -o exit
./exit; echo $?
