# MicroCPUID
MicroCPUID是一个汇编语言(GNU Assembly / GAS)的玩具项目. 它能够检测和显示CPU的信息. 功能类似于Linux命令`cat /proc/cpuinfo`.

# 演示 
## 这是`cat /proc/cpuinfo`的显示结果

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

## 这是MicroCPUID的显示结果

    vendor_id   : GenuineIntel
    cpu family  : 6
    model       : 30
    stepping    : 5
    model name  : Intel(R) Core(TM) CPU          Q 820  @ 1.73GHz

## 为什么MicroCPUID显示如此少的信息?
这个项目只是作者一天的工作成果, 还没有太多功能 :)
