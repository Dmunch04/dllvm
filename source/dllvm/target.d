module dllvm.target;

// Source: https://llvm.org/doxygen/group__LLVMCTarget.html

struct LLVMOpaqueTargetData;
alias LLVMTargetDataRef = LLVMOpaqueTargetData*;

struct LLVMOpaqueTargetLibraryInfotData;
alias LLVMTargetLibraryInfoRef = LLVMOpaqueTargetLibraryInfotData*;

alias LLVMByteOrdering = int;
enum : LLVMByteOrdering
{
    LLVMBigEndian,
    LLVMLittleEndian
}

// TODO: Make this. See fx
// https://github.com/MoritzMaxeiner/llvm-d/blob/8fe9dc37959629d8de5aa1e8fec2ed76456e0311/source/llvm/functions/package.d