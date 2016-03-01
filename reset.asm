; Copyright 2016 Wink Saville
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.

global reset_32
global reset_64

; Derived from [The easiest way to reset i386/x86_64 system]
; (http://www.pagetable.com/?p=140).

section .text
bits 32
reset_32:
    cli                 ; Turn off interrupts
    lidt [null_idtr]    ; Load idt with a null
    int 3               ; Issue interrupt which causes triple fault and resets cpu
.halt:
    hlt
    jmp .halt

bits 64
reset_64:
    cli                 ; Turn off interrupts
    lidt [null_idtr]    ; Load idt with a null
    int 3               ; Issue interrupt which causes triple fault and resets cpu
.halt:
    hlt
    jmp .halt


section .rodata
null_idtr:
    dw 0 ; zero entry
    dq 0 ; zero entry
