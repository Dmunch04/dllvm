module dllvm.memory;

// Source: https://llvm.org/doxygen/group__LLVMCCoreMemoryBuffers.html

import dllvm.ctypes;

extern(C)
{
    LLVMBool LLVMCreateMemoryBufferWithContentsOfFile(const(char)* path, LLVMMemoryBufferRef* outMemBuf, char** outMessage);

    LLVMBool LLVMCreateMemoryBufferWithSTDIN(LLVMMemoryBufferRef* outMemBuf, char** outMessage);

    LLVMMemoryBufferRef LLVMCreateMemoryBufferWithMemoryRange(const(char)* inputData, size_t inputDataLength, const(char)* bufferName, LLVMBool requiresNullTerminator);

    LLVMMemoryBufferRef LLVMCreateMemoryBufferWithMemoryRangeCopy(const(char)* inputData, size_t inputDataLength, const(char)* bufferName);

    const(char)* LLVMGetBufferStart(LLVMMemoryBufferRef memBuf);

    size_t LLVMGetBufferSize(LLVMMemoryBufferRef memBuf);

    void LLVMDisposeMemoryBuffer(LLVMMemoryBufferRef memBuf);
}