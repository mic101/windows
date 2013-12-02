EXTERN __imp__KeRaiseIrqlToSynchLevel@0:dword
EXTERN _KeNumberNodes:dword
EXTERN _KeNumberProcessors:byte
EXTERN _KiProcessorBlock:dword
EXTERN __imp_@KfLowerIrql@4:dword
EXTERN @KiFindReadyThread@8:abs
EXTERN _KiMask32Array:dword
EXTERN _KiIdleSummary:dword
EXTERN _KiIdleSMTSummary:dword

public @KiIdleSchedule@4

.686p

_TEXT$00   SEGMENT DWORD PUBLIC 'CODE'
        ASSUME  DS:FLAT, ES:FLAT, SS:NOTHING, FS:NOTHING, GS:NOTHING


; __fastcall KiIdleSchedule(x)
@KiIdleSchedule@4 proc near             ; CODE XREF: KiIdleLoop()+DE.p

var_14          = dword ptr -14h
var_10          = dword ptr -10h
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
var_4           = dword ptr -4

; FUNCTION CHUNK AT .text:00417A78 SIZE 00000042 BYTES
; FUNCTION CHUNK AT .text:004197B0 SIZE 000000B5 BYTES
; FUNCTION CHUNK AT .text:0045C0DC SIZE 00000072 BYTES
; FUNCTION CHUNK AT .text:0045C153 SIZE 00000044 BYTES

                mov     edi, edi
                push    ebp
                mov     ebp, esp
                sub     esp, 14h
                push    esi
                push    edi
                mov     esi, ecx
                call    ds:__imp__KeRaiseIrqlToSynchLevel@0 ; KeRaiseIrqlToSynchLevel()
                lea     edx, [esi+95Ch]
                mov     [ebp+var_4], edx

loc_41B208:                             ; CODE XREF: KiIdleSchedule(x)-3755.j
                xor     eax, eax
                inc     eax
                xchg    eax, [edx]
                test    eax, eax
                jnz     loc_417A93
                mov     [esi+983h], al
                mov     eax, [esi+8]
                cmp     eax, [esi+0Ch]
                jz      loc_45C0DC

loc_41B227:                             ; CODE XREF: KiIdleSchedule(x)+40EF3.j
                mov     edi, [esi+8]
                xor     ecx, ecx
                cmp     edi, ecx
                push    ebx
                jnz     loc_45C0E5
                mov     eax, [esi+9E8h]
                cmp     eax, ecx
                mov     [ebp+var_14], eax
                jnz     loc_45C0F4

loc_41B246:                             ; CODE XREF: KiIdleSchedule(x)+40F21.j
                                        ; KiIdleSchedule(x)+40F34.j
                test    ecx, ecx
                mov     edi, ecx
                jnz     loc_45C126
                xor     eax, eax
                lock and [edx], eax
                cmp     _KeNumberNodes, 1
                movsx   eax, byte ptr [esi+10h]
                mov     [ebp+var_14], eax
                mov     [ebp+var_8], eax
                ja      loc_45C136

loc_41B26C:                             ; CODE XREF: KiIdleSchedule(x)+40F5C.j
                movsx   eax, _KeNumberProcessors
                dec     eax
                mov     [ebp+var_10], eax
                mov     [ebp+var_C], eax

loc_41B27A:                             ; CODE XREF: KiIdleSchedule(x)+B4.j
                mov     ecx, [ebp+var_8]
                mov     ebx, _KiProcessorBlock[ecx*4]
                cmp     esi, ebx
                jz      short loc_41B295
                cmp     dword ptr [ebx+9E8h], 0
                jnz     loc_4197B0

loc_41B295:                             ; CODE XREF: KiIdleSchedule(x)-375F.j
                                        ; KiIdleSchedule(x)+99.j
                dec     [ebp+var_8]
                js      short loc_41B2BA

loc_41B29A:                             ; CODE XREF: KiIdleSchedule(x)+D0.j
                dec     [ebp+var_C]

loc_41B29D:                             ; CODE XREF: KiIdleSchedule(x)+40F8B.j
                cmp     [ebp+var_C], 0
                jge     short loc_41B27A

loc_41B2A3:                             ; CODE XREF: KiIdleSchedule(x)-199E.j
                                        ; KiIdleSchedule(x)+40F02.j ...
                test    edi, edi
                pop     ebx
                jnz     loc_419854
                mov     cl, 2
                call    ds:__imp_@KfLowerIrql@4 ; KfLowerIrql(x)

loc_41B2B4:                             ; CODE XREF: KiIdleSchedule(x)-198D.j
                                        ; .text:0045C197.j
                mov     eax, edi
                pop     edi
                pop     esi
                leave
                retn
; ---------------------------------------------------------------------------

loc_41B2BA:                             ; CODE XREF: KiIdleSchedule(x)+AB.j
                mov     [ebp+var_8], eax
                jmp     short loc_41B29A




; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR @KiIdleSchedule@4

loc_417A78:                             ; CODE XREF: KiIdleSchedule(x)-19F4.j
                                        ; KiIdleSchedule(x)-19E0.j
                mov     ecx, [ebp+var_4]
                xor     eax, eax
                lock and [ecx], eax
                add     ebx, 95Ch
                lock and [ebx], eax
                mov     eax, [ebp+var_10]
                mov     edx, ecx
                jmp     loc_41B295
; ---------------------------------------------------------------------------

loc_417A93:                             ; CODE XREF: KiIdleSchedule(x)-374F.j
                                        ; KiIdleSchedule(x)+22.j
;                pause
	db 0f3h, 90h
                cmp     dword ptr [edx], 0
                jz      loc_41B208
                jmp     short loc_417A93
; ---------------------------------------------------------------------------

loc_417AA0:                             ; CODE XREF: KiIdleSchedule(x)-3742.j
                                        ; KiIdleSchedule(x)-1A24.j
;                pause
	db 0f3h, 90h
                cmp     dword ptr [eax], 0
                jz      loc_4197C2
                jmp     short loc_417AA0
; ---------------------------------------------------------------------------

loc_417AAD:                             ; CODE XREF: KiIdleSchedule(x)-3735.j
                                        ; KiIdleSchedule(x)-1A0D.j
;                pause
	db 0f3h, 90h
                cmp     dword ptr [eax], 0
                jz      loc_4197D9
                jmp     short loc_417AAD
; END OF FUNCTION CHUNK FOR @KiIdleSchedule@4



; START OF FUNCTION CHUNK FOR @KiIdleSchedule@4

loc_4197B0:                             ; CODE XREF: KiIdleSchedule(x)+A2.j
                cmp     esi, ebx
                mov     edi, esi
                mov     edx, ebx
                jbe     short loc_4197BC
                mov     edi, ebx
                mov     edx, esi

loc_4197BC:                             ; CODE XREF: KiIdleSchedule(x)-1A37.j
                lea     eax, [edi+95Ch]

loc_4197C2:                             ; CODE XREF: KiIdleSchedule(x)-3748.j
                xor     ecx, ecx
                inc     ecx
                xchg    ecx, [eax]
                test    ecx, ecx
                jnz     loc_417AA0
                cmp     edi, edx
                jz      short loc_4197E6
                lea     eax, [edx+95Ch]

loc_4197D9:                             ; CODE XREF: KiIdleSchedule(x)-373B.j
                xor     ecx, ecx
                inc     ecx
                xchg    ecx, [eax]
                test    ecx, ecx
                jnz     loc_417AAD

loc_4197E6:                             ; CODE XREF: KiIdleSchedule(x)-1A1C.j
                mov     edi, [esi+8]
                xor     eax, eax
                cmp     edi, eax
                jnz     loc_45C153
                cmp     [ebx+9E8h], eax
                jz      loc_417A78
                mov     ecx, [ebp+var_14]
                mov     edx, ebx
;                call    @KiFindReadyThread@8 ; KiFindReadyThread(x,x)
                mov     edi, eax
                test    edi, edi
                jz      loc_417A78
                mov     byte ptr [edi+4Ch], 2
                xor     eax, eax
                add     ebx, 95Ch
                lock and [ebx], eax
                and     [esi+8], eax
                mov     eax, [ebp+var_14]
                mov     [esi+4], edi
                mov     eax, ds:_KiMask32Array[eax*4]
                not     eax
                mov     ecx, offset _KiIdleSummary
                lock and [ecx], eax
                mov     eax, [esi+550h]
                not     eax
                mov     ecx, offset _KiIdleSMTSummary
                lock and [ecx], eax

loc_41984C:                             ; CODE XREF: KiIdleSchedule(x)+40FA5.j
                mov     edx, [ebp+var_4]
                jmp     loc_41B2A3
; ---------------------------------------------------------------------------

loc_419854:                             ; CODE XREF: KiIdleSchedule(x)+B9.j
                mov     eax, [esi+0Ch]
                mov     byte ptr [eax+5Dh], 1
                xor     eax, eax
                lock and [edx], eax
                jmp     loc_41B2B4
; END OF FUNCTION CHUNK FOR @KiIdleSchedule@4





; START OF FUNCTION CHUNK FOR @KiIdleSchedule@4

loc_45C0DC:                             ; CODE XREF: KiIdleSchedule(x)+34.j
                and     dword ptr [esi+8], 0
                jmp     loc_41B227
; ---------------------------------------------------------------------------

loc_45C0E5:                             ; CODE XREF: KiIdleSchedule(x)+42.j
                mov     [esi+8], ecx
                mov     [esi+4], edi
                mov     byte ptr [edi+4Ch], 2
                jmp     loc_41B2A3
; ---------------------------------------------------------------------------

loc_45C0F4:                             ; CODE XREF: KiIdleSchedule(x)+53.j
                bsr     eax, [ebp+var_14]
                mov     ecx, [esi+eax*8+9F0h]
                mov     edi, [ecx]
                mov     ebx, [ecx+4]
                sub     ecx, 60h
                cmp     edi, ebx
                mov     [ebx], edi
                mov     [edi+4], ebx
                jnz     loc_41B246
                mov     eax, ds:_KiMask32Array[eax*4]
                xor     [esi+9E8h], eax
                jmp     loc_41B246
; ---------------------------------------------------------------------------

loc_45C126:                             ; CODE XREF: KiIdleSchedule(x)+5D.j
                and     dword ptr [esi+8], 0
                mov     [esi+4], ecx
                mov     byte ptr [ecx+4Ch], 2
                jmp     loc_41B2A3
; ---------------------------------------------------------------------------

loc_45C136:                             ; CODE XREF: KiIdleSchedule(x)+79.j
                mov     eax, [esi+54Ch]
                mov     eax, [eax+10h]
                mov     [ebp+var_10], eax
                bsr     eax, [ebp+var_10]
                mov     [ebp+var_8], eax
                jmp     loc_41B26C
; END OF FUNCTION CHUNK FOR @KiIdleSchedule@4
; ---------------------------------------------------------------------------
                jmp     loc_41B2A3
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR @KiIdleSchedule@4

loc_45C153:                             ; CODE XREF: KiIdleSchedule(x)-1A00.j
                cmp     edi, [esi+0Ch]
                jnz     short loc_45C17D
                mov     ecx, [ebp+var_4]
                mov     [esi+8], eax
                mov     byte ptr [esi+983h], 0
                xor     eax, eax
                lock and [ecx], eax
                add     ebx, 95Ch
                lock and [ebx], eax
                mov     eax, [ebp+var_10]
                mov     edx, ecx
                jmp     loc_41B29D
; ---------------------------------------------------------------------------

loc_45C17D:                             ; CODE XREF: KiIdleSchedule(x)+40F69.j
                mov     byte ptr [edi+4Ch], 2
                xor     ecx, ecx
                add     ebx, 95Ch
                lock and [ebx], ecx
                mov     [esi+8], eax
                mov     [esi+4], edi
                jmp     loc_41984C
; END OF FUNCTION CHUNK FOR @KiIdleSchedule@4



@KiIdleSchedule@4 endp



_TEXT$00   ends
        end

