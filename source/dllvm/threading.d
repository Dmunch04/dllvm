module dllvm.threading;

// Source: https://llvm.org/doxygen/group__LLVMCCoreThreading.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Deprecated: Multi-threading can only be enabled/disabled with the compile time define `LLVM_ENABLE_THREADS`
     + 
     + This function always returns `LLVMIsMultithreaded()`
     +/
    deprecated LLVMBool LLVMStartMultithreaded();

    /++
     + Deprecated: Multi-threading can only be enabled/disabled with the compile time define `LLVM_ENABLE_THREADS`
     +/
    deprecated void LLVMStopMultithreaded();

    /++
     + Check whether LLVM is executing in thread-safe mode or not
     +/
    LLVMBool LLVMIsMultithreaded();
}