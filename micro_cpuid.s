.section .data
vendor_id:
    .asciz "vendor_id   : %s\n"
cpu_family:
    .asciz "cpu family  : %u\n"
model:
    .asciz "model       : %u\n"
stepping:
    .asciz "stepping    : %u\n"
core_number:
    .asciz "cores       : %u\n"
apicid:
    .asciz "apid id     : %u\n"
brand:
    .asciz "model name  : %s\n"

.section .bss
    .lcomm buffer, 12
    .lcomm brand_str, 48
.section .text
.globl _start
_start:
    call call_with_zero
    call call_with_one
    call call_with_four
    call call_with_band_string
    # exit
    pushl $0
    call exit

call_with_zero:
    movl $0, %eax
    cpuid
    movl $buffer, %edi
    movl %ebx, (%edi)
    movl %edx, 4(%edi)
    movl %ecx, 8(%edi)
    pushl $buffer
    pushl $vendor_id
    call printf
    addl $8, %esp
    ret

call_with_one:
    movl $1, %eax
    cpuid

    call print_family
    call print_model
    call print_stepping
    #call print_apic
    ret

print_family:
    # cpu family
    movl %eax, %edi
    shl $20, %edi
    shr $28, %edi
    pushl %eax
    pushl %edi
    pushl $cpu_family
    call printf
    addl $8, %esp
    popl %eax
    ret

print_model:
    # cpu model
    movl %eax, %edi
    shl $20, %edi
    shr $28, %edi

    cmp $0x6, %edi
    je expand
    cmp $0xF, %edi
    je expand

    call low_model
    jmp output

expand:
    call low_model
    call high_model
    jmp output

low_model:
    movl %eax, %edi
    shl $24, %edi
    shr $28, %edi
    ret

high_model:
    movl %eax, %esi
    shl $12, %esi
    shr $28, %esi
    shl $4, %esi
    orl %esi, %edi
    ret

output:
    pushl %eax
    pushl %edi
    pushl $model
    call printf
    addl $8, %esp
    popl %eax
    ret

print_stepping:
    # cpu stepping
    movl %eax, %edi
    shl $28, %edi
    shr $28, %edi
    pushl %eax
    pushl %edi
    pushl $stepping
    call printf
    addl $8, %esp
    popl %eax
    ret

call_with_four:
    movl $0x4, %eax
    cpuid
    #call print_cores
    ret

# not finished
#print_cores:
#    # cpu cores number
#    movl %eax, %edi
#    shr $26, %edi
#    pushl %eax
#    pushl %edi
#    pushl $core_number
#    call printf
#    addl $8, %esp
#    popl %eax
#    ret

# not finished
#print_apic:
#    # cpu apic id
#    movl %ebx, %edi
#    shr $24, %edi
#    pushl %eax
#    pushl %edi
#    pushl $apicid
#    call printf
#    addl $8, %esp
#    popl %eax
#    ret

call_with_band_string:
    movl $0x80000002, %eax
    cpuid
    movl $brand_str, %edi
    movl %eax, (%edi)
    movl %ebx, 4(%edi)
    movl %ecx, 8(%edi)
    movl %edx, 12(%edi)

    movl $0x80000003, %eax
    cpuid
    movl $brand_str, %edi
    movl %eax, 16(%edi)
    movl %ebx, 20(%edi)
    movl %ecx, 24(%edi)
    movl %edx, 28(%edi)

    movl $0x80000004, %eax
    cpuid
    movl $brand_str, %edi
    movl %eax, 32(%edi)
    movl %ebx, 36(%edi)
    movl %ecx, 40(%edi)
    movl %edx, 44(%edi)

    pushl %eax
    pushl %edi
    pushl $brand
    call printf
    addl $8, %esp
    popl %eax
    ret
