// © 2026 Icii Digital. This software is provided 'as is', without warranty of any kind, express or implied. In no event shall Icii Digital be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

#include "textflag.h"

TEXT consolePrintString(SB), NOSPLIT, $0
	MOVQ	str+0(FP), SI
	MOVQ	len+8(FP), CX
loop:
	LODSB
	CMPB	AL, $0
	JE	done
	MOVW	$0x3f8, DX
	OUTB	AL, DX
	LOOP	loop
done:
	RET