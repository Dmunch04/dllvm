module dllvm.managers;

// Source: https://llvm.org/doxygen/group__LLVMCCorePassManagers.html

import dllvm.ctypes;

extern(C)
{
    /++
     + Constructs a new whole-module pass pipeline
     +
     + This type of pipeline is suitable for link-time optimization and whole-module transformations
     +/
    LLVMPassManagerRef LLVMCreatePassManager();

    /++
     + Constructs a new function-by-function pass pipeline over the module provider
     +
     + It does not take ownership of the module provider.
     + This type of pipeline is suitable for code generation and JIT compilation tasks
     +/
    LLVMPassManagerRef LLVMCreateFunctionPassManagerForModule(LLVMModuleRef mod);

    /++
     + Deprecated: Use `LLVMCreateFunctionPassManagerForModule` instead
     +/
    deprecated LLVMPassManagerRef LLVMCreateFunctionPassManager(LLVMModuleProviderRef modProvider);

    /++
     + Initializes, executes on the provided module, and finalizes all of the passes scheduled in the pass manager.
     +
     + Returns: 1 if any of the passes modified the module, 0 otherwise
     +/
    LLVMBool LLVMRunPassManager(LLVMPassManagerRef passManager, LLVMModuleRef mod);

    /++
     + Initializes all of the function passes scheduled in the function pass manager
     +
     + Returns: 1 if any of the passes modified the module, 0 otherwise
     +/
    LLVMBool LLVMInitializeFunctionPassManager(LLVMPassManagerRef passManager);

    /++
     + Executes all of the function passes scheduled in the function pass manager on the provided function.
     +
     + Returns: 1 if any of the passes modified the function, false otherwise
     +/
    LLVMBool LLVMRunFunctionPassManager(LLVMPassManagerRef passManager, LLVMValueRef f);

    /++
     + Finalizes all of the function passes scheduled in the function pass manager
     +
     + Returns: 1 if any of the passes modified the module, 0 otherwise
     +/
    LLVMBool LLVMFinalizeFunctionPassManager(LLVMPassManagerRef passManager);

    /++
     + Frees the memory of a pass pipeline
     +
     + For function pipelines, does not free the module provider
     +/
    void LLVMDisposePassManager(LLVMPassManagerRef passManager);
}