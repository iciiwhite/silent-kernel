// © 2026 Icii Digital. This software is provided 'as is', without warranty of any kind, express or implied. In no event shall Icii Digital be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

#include "textflag.h"

TEXT memset(SB), NOSPLIT, $0
	MOVQ	ptr+0(FP), DI
	MOVB	val+8(FP), AL
	MOVQ	n+16(FP), CX
	REP
	STOSB
	RET