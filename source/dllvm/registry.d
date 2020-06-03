module dllvm.registry;

// Source: https://llvm.org/doxygen/group__LLVMCCorePassRegistry.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Returns: The global pass registry, for use with initialization functions
     +/
    LLVMPassRegistryRef LLVMGetGlobalPassRegistry();
}