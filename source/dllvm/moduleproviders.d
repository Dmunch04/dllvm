module dllvm.moduleproviders;

// Source: https://llvm.org/doxygen/group__LLVMCCoreModuleProvider.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Changes the type of `mod` so it can be passed to `FunctionPassManagers` and the JIT
     +
     + They take ModuleProviders for historical reasons
     +/
    LLVMModuleProviderRef LLVMCreateModuleProviderForExistingModule(LLVMModuleRef mod);

    /++
     + Destroys the module `mod`
     +/
    void LLVMDisposeModuleProvider(LLVMModuleProviderRef mod);
}