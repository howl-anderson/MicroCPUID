# MicroCPUID
MicroCPUID is a assembly language (GNU Assembly / GAS) toy project. It detect and display CPU information. Just like `cat /proc/cpuinfo`.

# Demo
## This is what `cat /proc/cpuinfo` do

    vendor_id       : GenuineIntel
    cpu family      : 6
    model           : 30
    model name      : Intel(R) Core(TM) CPU          Q 820  @ 1.73GHz
    stepping        : 5
    microcode       : 0x3
    cpu MHz         : 1728.931
    cache size      : 8192 KB
    physical id     : 0
    siblings        : 8
    core id         : 2
    cpu cores       : 4
    apicid          : 5
    initial apicid  : 5
    fpu             : yes
    fpu_exception   : yes
    cpuid level     : 11
    wp              : yes
    flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt lahf_lm tpr_shadow vnmi flexpriority ept vpid dtherm
    bugs            :
    bogomips        : 3457.86
    clflush size    : 64
    cache_alignment : 64
    address sizes   : 36 bits physical, 48 bits virtual
    power management:

## This is what MicroCPUID do

    vendor_id   : GenuineIntel
    cpu family  : 6
    model       : 30
    stepping    : 5
    model name  : Intel(R) Core(TM) CPU          Q 820  @ 1.73GHz

## Why MicroCPUID display so little information?
This is author's one-day work, don't have much functions :)
