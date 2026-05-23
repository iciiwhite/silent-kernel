// © 2026 Icii Digital. This software is provided 'as is', without warranty of any kind, express or implied. In no event shall Icii Digital be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

package main

func selfdestruct() {
	memset(0x100000, 0, 0x10000000)
	poweroff()
}

func poweroff() {
	outw(0x604, 0x2000)
	for {
	}
}

func enclave() {
	consolePrintString("ENCLAVE EXECUTED\n")
}

func memset
func outw