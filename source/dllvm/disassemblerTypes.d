module dllvm.disassemblerTypes;

// TODO: Should the correct naming be used here or not?
struct LLVMOpInfoSymbol1
{
    ulong present;
    const(char)* name;
    ulong value;
}

struct LLVMOpInfo1
{
    LLVMOpInfoSymbol1 addSymbol;
    LLVMOpInfoSymbol1 subtractSymbol;
    ulong value;
    ulong variantKind;
}

alias LLVMDisasmContextRef = void*;
alias LLVMOpInfoCallback = extern(C) int function(void* disInfo, ulong pc, ulong offset, ulong size, int tagType, void* tagBuf);
alias LLVMSymbolLookupCallback = extern(C) const(char)* function(void* disInfo, ulong referenceValue, ulong* referenceType, ulong referencePc, const(char)** referenceName);