module dllvm.optimization;

// Source: https://llvm.org/doxygen/group__LLVMCLinkTimeOptimizer.html

/++
 + This provides a C-visible enumerator to manage status codes
 +
 + This should map exactly onto the C++ enumerator `LTOStatus`
 +/
alias llvm_lto_status = int;
enum : llvm_lto_status
{
    LLVM_LTO_UNKNOWN,
    LLVM_LTO_OPT_SUCCESS,
    LLVM_LTO_READ_SUCCESS,
    LLVM_LTO_READ_FAILURE,
    LLVM_LTO_WRITE_FAILURE,
    LLVM_LTO_NO_TARGET,
    LLVM_LTO_NO_WORK,
    LLVM_LTO_MODULE_MERGE_FAILURE,
    LLVM_LTO_ASM_FAILURE,
    LLVM_LTO_NULL_OBJECT
}

/++
 + This provides a dummy type for pointers to the LTO object
 +/
alias llvm_lto_t = void*;

/++
 + This provides a C-visible enumerator to manage status codes
 +
 + This should map exactly onto the C++ enumerator `LTOStatus`
 +/
alias llvm_lto_status_t = llvm_lto_status;

extern(C)
{
    /++
     + This provides C interface to initialize link time optimizer
     +
     + This allows linker to use `dlopen()` interface to dynamically load LinkTimeOptimizer.
     + extern "C" helps, because `dlopen()` interface uses name to find the symbol
     +/
    llvm_lto_t llvm_create_optimizer();
    
    void llvm_destroy_optimizer(llvm_lto_t lto);

    llvm_lto_status_t llvm_read_object_file(llvm_lto_t lto, const(char)* inputFilename);

    llvm_lto_status_t llvm_optimize_modules(llvm_lto_t lto, const(char)* outputFilename);
}