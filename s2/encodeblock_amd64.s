// Code generated by command: go run gen.go -out encodeblock_amd64.s -stubs encodeblock_amd64.go. DO NOT EDIT.

// +build !appengine
// +build !noasm
// +build gc

#include "textflag.h"

// func encodeBlockAsm(dst []byte, src []byte) int
TEXT ·encodeBlockAsm(SB), NOSPLIT, $65656-56
	MOVQ $0x00000200, AX
	LEAQ 120(SP), CX
	PXOR X0, X0

zero_loop_encodeBlockAsm:
	MOVOU X0, (CX)
	MOVOU X0, 16(CX)
	MOVOU X0, 32(CX)
	MOVOU X0, 48(CX)
	MOVOU X0, 64(CX)
	MOVOU X0, 80(CX)
	MOVOU X0, 96(CX)
	MOVOU X0, 112(CX)
	ADDQ  $0x80, CX
	DECQ  AX
	JNZ   zero_loop_encodeBlockAsm
	MOVL  AX, 68(SP)
	MOVQ  src_len+32(FP), DX
	LEAQ  -5(DX), BX
	LEAQ  -8(DX), BP
	SHRQ  $0x05, DX
	SUBL  BX, DX
	MOVL  BP, 64(SP)
	LEAQ  dst_base+0(FP)(DX*1), DX
	MOVQ  DX, 56(SP)
	MOVB  $0x01, SI
	MOVL  SI, 72(SP)
	MOVQ  src_base+24(FP), AX

search_loop_encodeBlockAsm:
	MOVQ  (AX)(SI*1), DX
	MOVL  68(SP), R8
	SUBL  SI, R8
	SHRL  $0x06, R8
	LEAQ  4(SI)(R8*1), DI
	MOVL  DI, 76(SP)
	MOVQ  $0x0000cf1bbcdcbf9b, BX
	MOVQ  DX, BP
	MOVQ  DX, R15
	SHRQ  $0x08, R15
	SHLQ  $0x10, BP
	IMULQ BX, BP
	SHRQ  $0x30, BP
	SHLQ  $0x10, R15
	IMULQ BX, R15
	SHRQ  $0x30, R15
	MOVL  120(SP)(BP*1), CX
	MOVL  120(SP)(R15*1), CX
	MOVL  SI, 120(SP)(BP*1)
	MOVQ  SI, R9
	DECQ  R9
	MOVL  R9, 120(SP)(R15*1)
	MOVQ  DX, CX
	SHRQ  $0x10, CX
	SHLQ  $0x10, CX
	IMULQ BX, CX
	SHRQ  $0x30, CX
	MOVL  72(SP), R11
	MOVQ  SI, CX
	SUBQ  CX, R11
	MOVL  1(AX), CX
	MOVQ  DX, R10
	SHLQ  $0x08, R10
	CMPL  R10, CX
	JNE   no_repeat_found_encodeBlockAsm
	LEAQ  1(SI), R12
	MOVL  68(SP), CX
	TESTQ R11, R11
	JZ    repeat_extend_back_end_encodeBlockAsm

repeat_extend_back_loop_encodeBlockAsm:
	CMPL R12, CX
	JG   repeat_extend_back_end_encodeBlockAsm
	MOVB -1(AX)(R11*1), DL
	MOVB -1(AX)(R12*1), BL
	CMPB DL, BL
	JNE  repeat_extend_back_end_encodeBlockAsm
	LEAQ -1(R12), R12
	DECQ R11
	JZ   repeat_extend_back_end_encodeBlockAsm
	JMP  repeat_extend_back_loop_encodeBlockAsm

repeat_extend_back_end_encodeBlockAsm:
	MOVQ 68(SP), DX
	MOVQ R12, CX
	LEAQ (AX)(DX*1), BX
	SUBQ CX, DX
	MOVQ dst_base+0(FP), BP
	XORQ CX, CX
	MOVQ R12, 68(SP)
	MOVQ DX, CX
	MOVQ DX, R13
	SUBL $0x01, R13
	JC   emit_literal_done_repeat_emit_encodeBlockAsm
	CMPL R13, $0x3c
	JLT  one_byte_repeat_emit_encodeBlockAsm
	CMPL R13, $0x00000100
	JLT  two_bytes_repeat_emit_encodeBlockAsm
	CMPL R13, $0x00010000
	JLT  three_bytes_repeat_emit_encodeBlockAsm
	CMPL R13, $0x01000000
	JLT  four_bytes_repeat_emit_encodeBlockAsm
	MOVB $0xfc, (BP)
	MOVL R13, 1(BP)
	ADDQ $0x05, CX
	ADDQ $0x05, BP
	JMP  memmove_repeat_emit_encodeBlockAsm

four_bytes_repeat_emit_encodeBlockAsm:
	MOVQ R13, R14
	SHRL $0x10, R14
	MOVB $0xf8, (BP)
	MOVW R13, 1(BP)
	MOVB R14, 3(BP)
	ADDQ $0x04, CX
	ADDQ $0x04, BP
	JMP  memmove_repeat_emit_encodeBlockAsm

three_bytes_repeat_emit_encodeBlockAsm:
	MOVB $0xf4, (BP)
	MOVW R13, 1(BP)
	ADDQ $0x03, CX
	ADDQ $0x03, BP
	JMP  memmove_repeat_emit_encodeBlockAsm

two_bytes_repeat_emit_encodeBlockAsm:
	MOVB $0xf0, (BP)
	MOVB R13, 1(BP)
	ADDQ $0x02, CX
	ADDQ $0x02, BP
	JMP  memmove_repeat_emit_encodeBlockAsm

one_byte_repeat_emit_encodeBlockAsm:
	SHLB $0x02, R13
	MOVB R13, (BP)
	ADDQ $0x01, CX
	ADDQ $0x01, BP

memmove_repeat_emit_encodeBlockAsm:
	MOVQ  DX, CX
	SHRQ  $0x07, CX
	TESTQ CX, CX
	JZ    done_128_emit_lit_memmove_repeat_emit_encodeBlockAsm

loop_128_emit_lit_memmove_repeat_emit_encodeBlockAsm:
	MOVOU (BX), X0
	MOVOU 16(BX), X1
	MOVOU 32(BX), X2
	MOVOU 48(BX), X3
	MOVOU 64(BX), X4
	MOVOU 80(BX), X5
	MOVOU 96(BX), X6
	MOVOU 112(BX), X7
	MOVOU X0, (BP)
	MOVOU X1, 16(BP)
	MOVOU X2, 32(BP)
	MOVOU X3, 48(BP)
	MOVOU X4, 64(BP)
	MOVOU X5, 80(BP)
	MOVOU X6, 96(BP)
	MOVOU X7, 112(BP)
	LEAQ  128(BX), BX
	LEAQ  128(BP), BP
	LEAQ  -128(DX), DX
	DECQ  CX
	JNZ   loop_128_emit_lit_memmove_repeat_emit_encodeBlockAsm

done_128_emit_lit_memmove_repeat_emit_encodeBlockAsm:
	MOVQ  DX, CX
	SHRQ  $0x04, CX
	TESTQ CX, CX
	JZ    done_16_emit_lit_memmove_repeat_emit_encodeBlockAsm

loop_16_emit_lit_memmove_repeat_emit_encodeBlockAsm:
	MOVOU (BX), X0
	MOVOU X0, (BP)
	LEAQ  16(BX), BX
	LEAQ  16(BP), BP
	LEAQ  -16(DX), DX
	DECQ  CX
	JNZ   loop_16_emit_lit_memmove_repeat_emit_encodeBlockAsm

done_16_emit_lit_memmove_repeat_emit_encodeBlockAsm:
	TESTQ DX, DX
	JZ    emit_literal_done_repeat_emit_encodeBlockAsm

loop_1_emit_lit_memmove_repeat_emit_encodeBlockAsm:
	MOVB (BX), CL
	MOVB CL, (BP)
	LEAQ 1(BX), BX
	LEAQ 1(BP), BP
	DECQ DX
	JNZ  loop_1_emit_lit_memmove_repeat_emit_encodeBlockAsm

emit_literal_done_repeat_emit_encodeBlockAsm:
	MOVQ BP, dst_base+0(FP)
	LEAQ 5(SI), SI
	MOVL 72(SP), CX
	SUBL SI, CX
	MOVQ SI, CX
	SUBQ 64(SP), CX
	XORQ BX, BX
	CMPQ CX, $0x08
	JL   matchlen_single_repeat_extend

matchlen_loopback_repeat_extend:
	MOVQ  (AX)(BX*1), DX
	XORQ  (AX)(BX*1), DX
	TESTQ DX, DX
	JZ    matchlen_loop_repeat_extend
	BSFQ  DX, DX
	SARQ  $0x03, DX
	LEAQ  (BX)(DX*1), BX
	JMP   repeat_extend_forward_end_encodeBlockAsm

matchlen_loop_repeat_extend:
	LEAQ -8(CX), CX
	LEAQ 8(BX), BX
	CMPQ CX, $0x08
	JGE  matchlen_loopback_repeat_extend

matchlen_single_repeat_extend:
	TESTQ CX, CX
	JZ    repeat_extend_forward_end_encodeBlockAsm

matchlen_single_loopback_repeat_extend:
	MOVB (AX)(BX*1), DL
	CMPB (AX)(BX*1), DL
	JNE  repeat_extend_forward_end_encodeBlockAsm
	LEAQ 1(BX), BX
	DECQ CX
	JNZ  matchlen_single_loopback_repeat_extend

repeat_extend_forward_end_encodeBlockAsm:
	ADDQ BX, SI
	JMP  search_loop_encodeBlockAsm

no_repeat_found_encodeBlockAsm:
	NOP
	NOP
	MOVQ 68(SP), AX
	SUBQ SI, AX
	LEAQ dst_base+0(FP)(AX*1), AX
	CMPQ AX, 56(SP)
	JL   match_dst_size_check_encodeBlockAsm
	XORQ AX, AX
	MOVQ AX, ret+48(FP)
	RET

match_dst_size_check_encodeBlockAsm:
	NOP
	NOP
	NOP
	MOVQ src_len+32(FP), AX
	XORQ AX, AX
	MOVQ AX, ret+48(FP)
	RET

// func emitLiteral(dst []byte, lit []byte) int
TEXT ·emitLiteral(SB), NOSPLIT, $0-56
	MOVQ dst_base+0(FP), AX
	MOVQ lit_base+24(FP), CX
	MOVQ lit_len+32(FP), DX
	MOVQ DX, BX
	MOVQ DX, BP
	SUBL $0x01, BP
	JC   emit_literal_end_standalone
	CMPL BP, $0x3c
	JLT  one_byte_standalone
	CMPL BP, $0x00000100
	JLT  two_bytes_standalone
	CMPL BP, $0x00010000
	JLT  three_bytes_standalone
	CMPL BP, $0x01000000
	JLT  four_bytes_standalone
	MOVB $0xfc, (AX)
	MOVL BP, 1(AX)
	ADDQ $0x05, BX
	ADDQ $0x05, AX
	JMP  memmove_standalone

four_bytes_standalone:
	MOVQ BP, SI
	SHRL $0x10, SI
	MOVB $0xf8, (AX)
	MOVW BP, 1(AX)
	MOVB SI, 3(AX)
	ADDQ $0x04, BX
	ADDQ $0x04, AX
	JMP  memmove_standalone

three_bytes_standalone:
	MOVB $0xf4, (AX)
	MOVW BP, 1(AX)
	ADDQ $0x03, BX
	ADDQ $0x03, AX
	JMP  memmove_standalone

two_bytes_standalone:
	MOVB $0xf0, (AX)
	MOVB BP, 1(AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX
	JMP  memmove_standalone

one_byte_standalone:
	SHLB $0x02, BP
	MOVB BP, (AX)
	ADDQ $0x01, BX
	ADDQ $0x01, AX

memmove_standalone:
	MOVQ  DX, BP
	SHRQ  $0x07, BP
	TESTQ BP, BP
	JZ    done_128_emit_lit_memmove_standalone

loop_128_emit_lit_memmove_standalone:
	MOVOU (CX), X0
	MOVOU 16(CX), X1
	MOVOU 32(CX), X2
	MOVOU 48(CX), X3
	MOVOU 64(CX), X4
	MOVOU 80(CX), X5
	MOVOU 96(CX), X6
	MOVOU 112(CX), X7
	MOVOU X0, (AX)
	MOVOU X1, 16(AX)
	MOVOU X2, 32(AX)
	MOVOU X3, 48(AX)
	MOVOU X4, 64(AX)
	MOVOU X5, 80(AX)
	MOVOU X6, 96(AX)
	MOVOU X7, 112(AX)
	LEAQ  128(CX), CX
	LEAQ  128(AX), AX
	LEAQ  -128(DX), DX
	DECQ  BP
	JNZ   loop_128_emit_lit_memmove_standalone

done_128_emit_lit_memmove_standalone:
	MOVQ  DX, BP
	SHRQ  $0x04, BP
	TESTQ BP, BP
	JZ    done_16_emit_lit_memmove_standalone

loop_16_emit_lit_memmove_standalone:
	MOVOU (CX), X0
	MOVOU X0, (AX)
	LEAQ  16(CX), CX
	LEAQ  16(AX), AX
	LEAQ  -16(DX), DX
	DECQ  BP
	JNZ   loop_16_emit_lit_memmove_standalone

done_16_emit_lit_memmove_standalone:
	TESTQ DX, DX
	JZ    emit_literal_end_standalone

loop_1_emit_lit_memmove_standalone:
	MOVB (CX), BP
	MOVB BP, (AX)
	LEAQ 1(CX), CX
	LEAQ 1(AX), AX
	DECQ DX
	JNZ  loop_1_emit_lit_memmove_standalone

emit_literal_end_standalone:
	MOVQ BX, ret+48(FP)
	RET

// func emitRepeat(dst []byte, offset int, length int) int
TEXT ·emitRepeat(SB), NOSPLIT, $0-48
	XORQ BX, BX
	MOVQ dst_base+0(FP), AX
	MOVQ offset+24(FP), CX
	MOVQ length+32(FP), DX

emit_repeat_again_standalone:
	MOVQ DX, BP
	LEAQ -4(DX), DX
	CMPL BP, $0x08
	JLE  repeat_two_standalone
	CMPL BP, $0x0c
	JGE  cant_repeat_two_offset_standalone
	CMPL CX, $0x00000800
	JLT  repeat_two_offset_standalone

cant_repeat_two_offset_standalone:
	CMPL DX, $0x00000104
	JLT  repeat_three_standalone
	CMPL DX, $0x00010100
	JLT  repeat_four_standalone
	CMPL DX, $0x0100ffff
	JLT  repeat_five_standalone
	LEAQ -16842747(DX), DX
	MOVW $0x001d, (AX)
	MOVW $0xfffb, 2(AX)
	MOVB $0xff, 4(AX)
	ADDQ $0x05, AX
	ADDQ $0x05, BX
	JMP  emit_repeat_again_standalone

repeat_five_standalone:
	LEAQ -65536(DX), DX
	MOVQ DX, CX
	MOVW $0x001d, (AX)
	MOVW DX, 2(AX)
	SARQ $0x10, CX
	MOVB CL, 4(AX)
	ADDQ $0x05, BX
	ADDQ $0x05, AX
	JMP  gen_emit_repeat_end

repeat_four_standalone:
	LEAQ -256(DX), DX
	MOVW $0x0019, (AX)
	MOVW DX, 2(AX)
	ADDQ $0x04, BX
	ADDQ $0x04, AX
	JMP  gen_emit_repeat_end

repeat_three_standalone:
	LEAQ -4(DX), DX
	MOVW $0x0015, (AX)
	MOVB DL, 2(AX)
	ADDQ $0x03, BX
	ADDQ $0x03, AX
	JMP  gen_emit_repeat_end

repeat_two_standalone:
	SHLL $0x02, DX
	ORL  $0x01, DX
	MOVW DX, (AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX
	JMP  gen_emit_repeat_end

repeat_two_offset_standalone:
	XORQ BP, BP
	LEAQ 1(BP)(DX*4), DX
	MOVB CL, 1(AX)
	SARL $0x08, CX
	SHLL $0x05, CX
	ORL  CX, DX
	MOVB DL, (AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX

gen_emit_repeat_end:
	MOVQ BX, ret+40(FP)
	RET

// func emitCopy(dst []byte, offset int, length int) int
TEXT ·emitCopy(SB), NOSPLIT, $0-48
	XORQ BX, BX
	MOVQ dst_base+0(FP), AX
	MOVQ offset+24(FP), CX
	MOVQ length+32(FP), DX
	CMPL CX, $0x00010000
	JL   two_byte_offset_standalone
	CMPL DX, $0x40
	JLE  four_bytes_remain_standalone
	MOVB $0xff, (AX)
	MOVD CX, 1(AX)
	LEAQ -64(DX), DX
	ADDQ $0x05, BX
	ADDQ $0x05, AX
	CMPL DX, $0x04
	JL   four_bytes_remain_standalone

emit_repeat_again_standalone_emit_copy:
	MOVQ DX, BP
	LEAQ -4(DX), DX
	CMPL BP, $0x08
	JLE  repeat_two_standalone_emit_copy
	CMPL BP, $0x0c
	JGE  cant_repeat_two_offset_standalone_emit_copy
	CMPL CX, $0x00000800
	JLT  repeat_two_offset_standalone_emit_copy

cant_repeat_two_offset_standalone_emit_copy:
	CMPL DX, $0x00000104
	JLT  repeat_three_standalone_emit_copy
	CMPL DX, $0x00010100
	JLT  repeat_four_standalone_emit_copy
	CMPL DX, $0x0100ffff
	JLT  repeat_five_standalone_emit_copy
	LEAQ -16842747(DX), DX
	MOVW $0x001d, (AX)
	MOVW $0xfffb, 2(AX)
	MOVB $0xff, 4(AX)
	ADDQ $0x05, AX
	ADDQ $0x05, BX
	JMP  emit_repeat_again_standalone_emit_copy

repeat_five_standalone_emit_copy:
	LEAQ -65536(DX), DX
	MOVQ DX, CX
	MOVW $0x001d, (AX)
	MOVW DX, 2(AX)
	SARQ $0x10, CX
	MOVB CL, 4(AX)
	ADDQ $0x05, BX
	ADDQ $0x05, AX
	JMP  gen_emit_copy_end

repeat_four_standalone_emit_copy:
	LEAQ -256(DX), DX
	MOVW $0x0019, (AX)
	MOVW DX, 2(AX)
	ADDQ $0x04, BX
	ADDQ $0x04, AX
	JMP  gen_emit_copy_end

repeat_three_standalone_emit_copy:
	LEAQ -4(DX), DX
	MOVW $0x0015, (AX)
	MOVB DL, 2(AX)
	ADDQ $0x03, BX
	ADDQ $0x03, AX
	JMP  gen_emit_copy_end

repeat_two_standalone_emit_copy:
	SHLL $0x02, DX
	ORL  $0x01, DX
	MOVW DX, (AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX
	JMP  gen_emit_copy_end

repeat_two_offset_standalone_emit_copy:
	XORQ BP, BP
	LEAQ 1(BP)(DX*4), DX
	MOVB CL, 1(AX)
	SARL $0x08, CX
	SHLL $0x05, CX
	ORL  CX, DX
	MOVB DL, (AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX
	JMP  gen_emit_copy_end

four_bytes_remain_standalone:
	JZ   gen_emit_copy_end
	MOVB $0x03, BP
	LEAQ -4(BP)(DX*4), DX
	MOVB DL, (AX)
	MOVD CX, 1(AX)
	ADDQ $0x05, BX
	ADDQ $0x05, AX
	JMP  gen_emit_copy_end

two_byte_offset_standalone:
	CMPL DX, $0x40
	JLE  two_byte_offset_short_standalone
	MOVB $0xee, (AX)
	MOVW CX, 1(AX)
	LEAQ -60(DX), DX
	ADDQ $0x03, AX
	ADDQ $0x03, BX

emit_repeat_again_standalone_emit_copy_short:
	MOVQ DX, BP
	LEAQ -4(DX), DX
	CMPL BP, $0x08
	JLE  repeat_two_standalone_emit_copy_short
	CMPL BP, $0x0c
	JGE  cant_repeat_two_offset_standalone_emit_copy_short
	CMPL CX, $0x00000800
	JLT  repeat_two_offset_standalone_emit_copy_short

cant_repeat_two_offset_standalone_emit_copy_short:
	CMPL DX, $0x00000104
	JLT  repeat_three_standalone_emit_copy_short
	CMPL DX, $0x00010100
	JLT  repeat_four_standalone_emit_copy_short
	CMPL DX, $0x0100ffff
	JLT  repeat_five_standalone_emit_copy_short
	LEAQ -16842747(DX), DX
	MOVW $0x001d, (AX)
	MOVW $0xfffb, 2(AX)
	MOVB $0xff, 4(AX)
	ADDQ $0x05, AX
	ADDQ $0x05, BX
	JMP  emit_repeat_again_standalone_emit_copy_short

repeat_five_standalone_emit_copy_short:
	LEAQ -65536(DX), DX
	MOVQ DX, CX
	MOVW $0x001d, (AX)
	MOVW DX, 2(AX)
	SARQ $0x10, CX
	MOVB CL, 4(AX)
	ADDQ $0x05, BX
	ADDQ $0x05, AX
	JMP  gen_emit_copy_end

repeat_four_standalone_emit_copy_short:
	LEAQ -256(DX), DX
	MOVW $0x0019, (AX)
	MOVW DX, 2(AX)
	ADDQ $0x04, BX
	ADDQ $0x04, AX
	JMP  gen_emit_copy_end

repeat_three_standalone_emit_copy_short:
	LEAQ -4(DX), DX
	MOVW $0x0015, (AX)
	MOVB DL, 2(AX)
	ADDQ $0x03, BX
	ADDQ $0x03, AX
	JMP  gen_emit_copy_end

repeat_two_standalone_emit_copy_short:
	SHLL $0x02, DX
	ORL  $0x01, DX
	MOVW DX, (AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX
	JMP  gen_emit_copy_end

repeat_two_offset_standalone_emit_copy_short:
	XORQ BP, BP
	LEAQ 1(BP)(DX*4), DX
	MOVB CL, 1(AX)
	SARL $0x08, CX
	SHLL $0x05, CX
	ORL  CX, DX
	MOVB DL, (AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX
	JMP  gen_emit_copy_end

two_byte_offset_short_standalone:
	CMPL DX, $0x0c
	JGE  emit_copy_three_standalone
	CMPL CX, $0x00000800
	JGE  emit_copy_three_standalone
	MOVB $0x01, BP
	LEAQ -16(BP)(DX*4), DX
	MOVB CL, 1(AX)
	SARL $0x08, CX
	SHLL $0x05, CX
	ORL  CX, DX
	MOVB DL, (AX)
	ADDQ $0x02, BX
	ADDQ $0x02, AX
	JMP  gen_emit_copy_end

emit_copy_three_standalone:
	MOVB $0x02, BP
	LEAQ -4(BP)(DX*4), DX
	MOVB DL, (AX)
	MOVW CX, 1(AX)
	ADDQ $0x03, BX
	ADDQ $0x03, AX

gen_emit_copy_end:
	MOVQ BX, ret+40(FP)
	RET

// func matchLen(a []byte, b []byte) int
TEXT ·matchLen(SB), NOSPLIT, $0-56
	MOVQ a_base+0(FP), AX
	MOVQ b_base+24(FP), CX
	MOVQ a_len+8(FP), DX
	XORQ BP, BP
	CMPQ DX, $0x08
	JL   matchlen_single_standalone

matchlen_loopback_standalone:
	MOVQ  (AX)(BP*1), BX
	XORQ  (CX)(BP*1), BX
	TESTQ BX, BX
	JZ    matchlen_loop_standalone
	BSFQ  BX, BX
	SARQ  $0x03, BX
	LEAQ  (BP)(BX*1), BP
	JMP   gen_match_len_end

matchlen_loop_standalone:
	LEAQ -8(DX), DX
	LEAQ 8(BP), BP
	CMPQ DX, $0x08
	JGE  matchlen_loopback_standalone

matchlen_single_standalone:
	TESTQ DX, DX
	JZ    gen_match_len_end

matchlen_single_loopback_standalone:
	MOVB (AX)(BP*1), BL
	CMPB (CX)(BP*1), BL
	JNE  gen_match_len_end
	LEAQ 1(BP), BP
	DECQ DX
	JNZ  matchlen_single_loopback_standalone

gen_match_len_end:
	MOVQ BP, ret+48(FP)
	RET
