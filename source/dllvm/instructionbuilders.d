module dllvm.instructionbuilders;

import dllvm.ctypes;
import dllvm.core.enums;

extern(C)
{
    LLVMBuilderRef LLVMCreateBuilderInContext(LLVMContextRef ctx);

    LLVMBuilderRef LLVMCreateBuilder();

    void LLVMPositionBuilder(LLVMBuilderRef builder, LLVMBasicBlockRef block, LLVMValueRef instruction);

    void LLVMPositionBuilderBefore(LLVMBuilderRef builder, LLVMValueRef instruction);

    void LLVMPositionBuilderAtEnd(LLVMBuilderRef builder, LLVMBasicBlockRef block);

    LLVMBasicBlockRef LLVMGetInsertBlock(LLVMBuilderRef builder);

    void LLVMClearInsertionPosition(LLVMBuilderRef builder);

    void LLVMInsertIntoBuilder(LLVMBuilderRef builder, LLVMValueRef instruction);

    void LLVMInsertIntoBuilderWithName(LLVMBuilderRef builder, LLVMValueRef instruction, const(char)* name);

    void LLVMDisposeBuilder(LLVMBuilderRef builder);

    /++
     + Get location information used by debugging information
     +/
    LLVMMetadataRef LLVMGetCurrentDebugLocation2(LLVMBuilderRef builder);

    /++
     + Set location information used by debugging information
     +
     + To clear the location metadata of the given instruction, pass `null` to `location`
     +/
    void LLVMSetCurrentDebugLocation2(LLVMBuilderRef builder, LLVMMetadataRef location);

    /++
     + Attempts to set the debug location for the given instruction using the current debug location for the given builder
     +
     + If the builder has no current debug location, this function is a no-op
     +/
    void LLVMSetInstDebugLocation(LLVMBuilderRef builder, LLVMValueRef instruction);

    LLVMMetadataRef LLVMBuilderGetDefaultFPMathTag(LLVMBuilderRef builder);

    void LLVMBuilderSetDefaultFPMathTag(LLVMBuilderRef builder, LLVMMetadataRef fpMathTag);

    /++
     + Deprecated: Passing the `null` location will crash. Use `LLVMSetCurrentDebugLocation2` instead
     +/
    deprecated void LLVMSetCurrentDebugLocation(LLVMBuilderRef builder, LLVMValueRef l);

    /++
     + Deprecated: Returning the `null` location will crash. Use `LLVMGetCurrentDebugLocation2` instead
     +/
    deprecated LLVMValueRef LLVMGetCurrentDebugLocation(LLVMBuilderRef builder);

    LLVMValueRef LLVMBuildRetVoid(LLVMBuilderRef builder);

    LLVMValueRef LLVMBuildRet(LLVMBuilderRef builder, LLVMValueRef value);

    LLVMValueRef LLVMBuildAggregateRet(LLVMBuilderRef builder, LLVMValueRef* retVals, uint n);

    LLVMValueRef LLVMBuildBr(LLVMBuilderRef builder, LLVMBasicBlockRef destination);

    LLVMValueRef LLVMBuildCondBr (LLVMBuilderRef builder, LLVMValueRef ifValue, LLVMBasicBlockRef thenBlock, LLVMBasicBlockRef elseBlock);

    LLVMValueRef LLVMBuildSwitch(LLVMBuilderRef builder, LLVMValueRef value, LLVMBasicBlockRef elseBlock, uint casesCount);

    LLVMValueRef LLVMBuildIndirectBr(LLVMBuilderRef builder, LLVMValueRef addr, uint destinationCount);

    LLVMValueRef LLVMBuildInvoke(LLVMBuilderRef builder, LLVMValueRef fn, LLVMValueRef* args, uint argsCount, LLVMBasicBlockRef thenBlock, LLVMBasicBlockRef catchBlock, const(char)* name);

    LLVMValueRef LLVMBuildInvoke2(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef fn, LLVMValueRef* args, uint argsCount, LLVMBasicBlockRef thenBlock, LLVMBasicBlockRef catchBlock, const(char)* name);

    LLVMValueRef LLVMBuildUnreachable(LLVMBuilderRef builder);

    LLVMValueRef LLVMBuildResume(LLVMBuilderRef builder, LLVMValueRef exn);

    LLVMValueRef LLVMBuildLandingPad(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef persFn, uint clausesCount, const(char)* name);

    LLVMValueRef LLVMBuildCleanupRet(LLVMBuilderRef builder, LLVMValueRef catchPad, LLVMBasicBlockRef block);

    LLVMValueRef LLVMBuildCatchRet(LLVMBuilderRef builder, LLVMValueRef catchPad, LLVMBasicBlockRef block);

    LLVMValueRef LLVMBuildCatchPad (LLVMBuilderRef builder, LLVMValueRef parentPad, LLVMValueRef* args, uint argsCount, const(char)* name);

    LLVMValueRef LLVMBuildCleanupPad (LLVMBuilderRef builder, LLVMValueRef parentPad, LLVMValueRef* args, uint argsCount, const(char)* name);

    LLVMValueRef LLVMBuildCatchSwitch (LLVMBuilderRef builder, LLVMValueRef parentPad, LLVMBasicBlockRef unwindBlock, uint handlersCount, const(char)* name);

    void LLVMAddCase(LLVMValueRef switchValue, LLVMValueRef onValue, LLVMBasicBlockRef destination);

    void LLVMAddDestination(LLVMValueRef indirectBr, LLVMBasicBlockRef destination);

    uint LLVMGetNumClauses(LLVMValueRef landingPad);

    LLVMValueRef LLVMGetClause(LLVMValueRef landingPad, uint index);

    void LLVMAddClause(LLVMValueRef landingPad, LLVMValueRef clauseValue);

    LLVMBool LLVMIsCleanup(LLVMValueRef landingPad);

    void LLVMSetCleanup(LLVMValueRef landingPad, LLVMBool value);

    void LLVMAddHandler(LLVMValueRef catchSwitch, LLVMBasicBlockRef destination);

    uint LLVMGetNumHandlers(LLVMValueRef catchSwitch);

    void LLVMGetHandlers(LLVMValueRef catchSwitch, LLVMBasicBlockRef* handlers);

    LLVMValueRef LLVMGetArgOperand(LLVMValueRef funclet, uint index);

    void LLVMSetArgOperand(LLVMValueRef funclet, uint index, LLVMValueRef value);

    LLVMValueRef LLVMGetParentCatchSwitch(LLVMValueRef catchPad);

    /++
     + Set the parent catchswitch instruction of a catchpad instruction
     +
     + This only works on `llvm::CatchPadInst` instructions
     +/
    void LLVMSetParentCatchSwitch(LLVMValueRef catchPad, LLVMValueRef catchSwitch);

    LLVMValueRef LLVMBuildAdd(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildNSWAdd(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildNUWAdd(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildFAdd(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildSub(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildNSWSub(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildNUWSub(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildFSub(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildMul(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildNSWMul(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildNUWMul(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildFMul(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildUDiv(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildExactUDiv(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildSDiv(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildExactSDiv(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildFDiv(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildURem(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildSRem(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildFRem(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildShl(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildLShr(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildAShr(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildAnd(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildOr(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildXor(LLVMBuilderRef builder, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildBinOp(LLVMBuilderRef builder, LLVMOpcode op, LLVMValueRef left, LLVMValueRef right, const(char)* name);

    LLVMValueRef LLVMBuildNeg(LLVMBuilderRef builder, LLVMValueRef value, const(char)* name);

    LLVMValueRef LLVMBuildNSWNeg(LLVMBuilderRef builder, LLVMValueRef value, const(char)* name);

    LLVMValueRef LLVMBuildNUWNeg(LLVMBuilderRef builder, LLVMValueRef value, const(char)* name);

    LLVMValueRef LLVMBuildFNeg(LLVMBuilderRef builder, LLVMValueRef value, const(char)* name);

    LLVMValueRef LLVMBuildNot(LLVMBuilderRef builder, LLVMValueRef value, const(char)* name);

    LLVMValueRef LLVMBuildMalloc(LLVMBuilderRef builder, LLVMTypeRef ty, const(char)* name);

    LLVMValueRef LLVMBuildArrayMalloc(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef value, const(char)* name);

    LLVMValueRef LLVMBuildMemSet(LLVMBuilderRef builder, LLVMValueRef pointer, LLVMValueRef value, LLVMValueRef length, uint alignment);

    LLVMValueRef LLVMBuildMemCpy(LLVMBuilderRef builder, LLVMValueRef destination, uint destinationAlignment, LLVMValueRef source, uint sourceAlignment, LLVMValueRef size);

    LLVMValueRef LLVMBuildMemMove(LLVMBuilderRef builder, LLVMValueRef destination, uint destinationAlignment, LLVMValueRef source, uint sourceAlignment, LLVMValueRef size);

    LLVMValueRef LLVMBuildAlloca(LLVMBuilderRef builder, LLVMTypeRef ty, const(char)* name);

    LLVMValueRef LLVMBuildArrayAlloca(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef value, const(char)* name);

    LLVMValueRef LLVMBuildFree(LLVMBuilderRef builder, LLVMValueRef pointer);

    LLVMValueRef LLVMBuildLoad(LLVMBuilderRef builder, LLVMValueRef pointer, const(char)* name);

    LLVMValueRef LLVMBuildLoad2(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef pointer, const(char)* name);

    LLVMValueRef LLVMBuildStore(LLVMBuilderRef builder, LLVMValueRef value, LLVMValueRef pointer);

    LLVMValueRef LLVMBuildGEP(LLVMBuilderRef builder, LLVMValueRef pointer, LLVMValueRef* indices, uint indicesCount, const(char)* name);

    LLVMValueRef LLVMBuildInBoundsGEP(LLVMBuilderRef builder, LLVMValueRef pointer, LLVMValueRef* indices, uint indicesCount, const(char)* name);

    LLVMValueRef LLVMBuildStructGEP(LLVMBuilderRef builder, LLVMValueRef pointer, uint index, const(char)* name);

    LLVMValueRef LLVMBuildGEP2(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef pointer, LLVMValueRef* indices, uint indicesCount, const(char)* name);

    LLVMValueRef LLVMBuildInBoundsGEP2(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef pointer, LLVMValueRef* indices, uint indicesCount, const(char)* name);

    LLVMValueRef LLVMBuildStructGEP2(LLVMBuilderRef builder, LLVMTypeRef ty, LLVMValueRef pointer, uint index, const(char)* name);

    LLVMValueRef LLVMBuildGlobalString(LLVMBuilderRef builder, const(char)* str, const(char)* name);

    LLVMValueRef LLVMBuildGlobalStringPtr(LLVMBuilderRef builder, const(char)* str, const(char)* name);

    LLVMBool LLVMGetVolatile(LLVMValueRef memoryAccessInstance);

    void LLVMSetVolatile(LLVMValueRef memoryAccessInstance, LLVMBool isVolatile);

    LLVMBool LLVMGetWeak(LLVMValueRef cmpXchgInstance);

    void LLVMSetWeak(LLVMValueRef cmpXchgInstance, LLVMBool isWeak);

    LLVMAtomicOrdering LLVMGetOrdering(LLVMValueRef memoryAccessInstance);

    void LLVMSetOrdering (LLVMValueRef memoryAccessInstance, LLVMAtomicOrdering ordering);

    LLVMAtomicRMWBinOp LLVMGetAtomicRMWBinOp(LLVMValueRef atomicRMWInstance);

    void LLVMSetAtomicRMWBinOp(LLVMValueRef atomicRMWInstance, LLVMAtomicRMWBinOp binOp);
}