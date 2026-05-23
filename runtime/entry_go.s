// © 2026 Icii Digital. This software is provided 'as is', without warranty of any kind, express or implied. In no event shall Icii Digital be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

#include "textflag.h"

TEXT _start_go(SB), NOSPLIT, $0
	LEAQ	runtime·g0(SB), AX
	MOVQ	AX, g(AX)
	MOVQ	AX, CX
	MOVQ	$0xc0000100, DX
	MOVL	$0, AX
	WRMSR
	CALL	main·kernelEntry(SB)
	INT	$3