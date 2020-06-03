module dllvm.disassembler;

// Source: https://llvm.org/doxygen/group__LLVMCDisassembler.html

import dllvm.disassemblerTypes;

extern(C)
{
    /++
     + Create a disassembler for the `tripleName`
     +
     + Symbolic disassembly is supported by passing a block of information in the
     + `disInfo` parameter and specifying the `tagType` and callback functions as described above.
     + These can all be passed as `null`. If successful, this returns a disassembler context.
     + If not, it returns `null`. This function is equivalent to calling `LLVMCreateDisasmCPUFeatures()`
     + with an empty CPU name and feature set
     +/
    LLVMDisasmContextRef LLVMCreateDisasm(const(char)* tripleName, void* disInfo, int tagType, LLVMOpInfoCallback getOpInfo, LLVMSymbolLookupCallback symbolLookUp);

    /++
     + Create a disassembler for the `tripleName` and a specific CPU
     +
     + Symbolic disassembly is supported by passing a block of information in the
     + `disInfo` parameter and specifying the `tagType` and callback functions as described above.
     + These can all be passed * as `null`. If successful, this returns a disassembler context.
     + If not, it returns `null`. This function is equivalent to calling `LLVMCreateDisasmCPUFeatures()`
     + with an empty feature set
     +/
    LLVMDisasmContextRef LLVMCreateDisasmCPU(const(char)* tripleName, const(char)* cpu, void* disInfo, int tagType, LLVMOpInfoCallback getOpInfo, LLVMSymbolLookupCallback symbolLookUp);

    /++
     + Create a disassembler for the `tripleName`, a specific CPU and specific feature string
     +
     + Symbolic disassembly is supported by passing a block of information in the
     + `disInfo` parameter and specifying the `tagType` and callback functions as described above.
     + These can all be passed * as `null`. If successful, this returns a disassembler context.
     + If not, it returns `null`
     +/
    LLVMDisasmContextRef LLVMCreateDisasmCPUFeatures(const(char)* tripleName, const(char)* cpu, const(char)* features, void* disInfo, int tagType, LLVMOpInfoCallback getOpInfo, LLVMSymbolLookupCallback symbolLookUp);

    /++
     + Set the disassembler's options
     +
     + Returns: 1 if it can set the Options and 0 otherwise
     +/
    int LLVMSetDisasmOptions (LLVMDisasmContextRef ctx, ulong options);

    /++
     + Dispose of a disassembler context
     +/
    void LLVMDisasmDispose(LLVMDisasmContextRef ctx);

    /++
     + Disassemble a single instruction using the disassembler context specified in the parameter `ctx`
     +
     + The bytes of the instruction are specified in the parameter `bytes`,
     + and contains at least `bytesSize` number of bytes.
     + The instruction is at the address specified by the `pc` parameter.
     + If a valid instruction can be disassembled, its string is returned indirectly
     + in `outString` whose size is specified in the parameter `outStringSize`.
     + This function returns the number of bytes in the instruction or zero if there was no valid instruction
     +/
    size_t LLVMDisasmInstruction(LLVMDisasmContextRef ctx, ubyte* bytes, ulong bytesSize, ulong pc, char* outString, size_t outStringSize);
}