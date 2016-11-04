# Goal: search min value in array
#
# Variables: register has the following purposes
#
# %edi - Saving the data detection index entries
# %ebx - Save the minimal value current
# %eax - The current data item
#
# Use the following memory location
#
# data_items - Contains the data items
#  0 express end location
#

 .section .data

data_items:  #Its data items
 .long  67, 54, 89, 100, 24, 5, 7, 91, 234, 13, 222, 33, 0
 
 .section .text

 .globl _start
_start:
 movl $0, %edi   # moving 0 to the index register
 movl data_items(, %edi, 4), %eax #load data_items's first byte to %eax
 movl %eax, %ebx   #set %ebx the initial minimum

start_loop:
 incl %edi   #load next value
 movl data_items(, %edi, 4), %eax
 cmpl $0, %eax   #check wether reach at the end of data
 je loop_exit
 cmpl %ebx, %eax   #comparing values
 jge start_loop   #if new data item less than
     #minimum value, goto start_loop
 movl %eax, %ebx   #moving new data into min reg

 jmp start_loop   #goto start loop

loop_exit:
# %ebx is system_call exit code had saved 
 movl $1, %eax
 int $0x80
