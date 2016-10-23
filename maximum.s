# Goal: search max value in array
#
# Variables: register has the following purposes
#
# %edi - Saving the data detection index entries
# %ebx - Save the maximal value current
# %eax - The current data item
#
# Use the following memory location
#
# data_items - Contains the data items
#  0 express end location
#

 .section .data

data_items:  #Its data items
 .long 3, 67, 54, 89, 100, 24, 3, 7, 91, 23, 13, 222, 33, 0
 
 .section .text

 .globl _start
_start:
 movl $0, %edi   # moving 0 to the index register
 movl data_items(, %edi, 4), %eax #load data_items's first byte to %eax
 movl %eax, %ebx   #set %ebx the initial maximum

start_loop:
 cmpl $0, %eax   #check wether reach at the end of data
 je loop_exit
 incl %edi   #load next value
 movl data_items(, %edi, 4), %eax
 cmpl %ebx, %eax   #comparing values
 jle start_loop   #if new data item less than
     #maximum value, goto start_loop
 movl %eax, %ebx   #moving new data into max reg

 jmp start_loop   #goto start loop

loop_exit:
# %ebx is system_call exit code had saved maximum
 movl $1, %eax
 int $0x80
