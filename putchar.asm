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

global putchar_32
global putchar_64

%define COM1_BASE 3F8h
%define COM2_BASE 2F8h
%define COM3_BASE 3E8h
%define COM4_BASE 2E8h

%define COM1_IRQ 4
%define COM2_IRQ 3
%define COM3_IRQ 4
%define COM4_IRQ 3

%define RX_FIFO 0
%define TX_FIFO 0

%define COM_TX_FIFO COM1_BASE+TX_FIFO

section .text
bits 32
putchar_32:
    push edx
    push eax
    mov dx, COM_TX_FIFO
    out dx, al
    cmp al, 0xA
    jne .done
    mov al, 0xD
    out dx, al
.done:
    pop eax
    pop edx
    ret

bits 64
putchar_64:
    push rdx
    push rax
    mov dx, COM_TX_FIFO
    out dx, al
    cmp al, 0xA
    jne .done
    mov al, 0xD
    out dx, al
.done:
    pop rax
    pop rdx
    ret
