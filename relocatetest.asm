        .set ENTRY, 0xD000        ; final destination address

        ; -------------------------
        ; NABU-friendly entry
        ; -------------------------
        jp start                   ; first instruction executed by loader

        nop                        ; optional padding

start:
        ; -------------------------
        ; Setup safe stack
        ; -------------------------
        ld sp, 0xFFFE              ; safe high RAM stack

        ; -------------------------
        ; Capture runtime PC without touching $0000
        ; -------------------------
        call get_pc
get_pc:
        pop hl                     ; HL = address after CALL

        ; -------------------------
        ; Adjust HL to point to code_start
        ; -------------------------
        ld de, code_start - here
        add hl, de                 ; HL = runtime address of code_start

        ; -------------------------
        ; Copy code to ENTRY
        ; -------------------------
        ld de, ENTRY
        ld bc, code_length
        ldir

        ; -------------------------
        ; Jump to relocated entry
        ; -------------------------
        ld hl, ENTRY + (entry - code_start)
        jp (hl)

here:
code_start:

entry:
        call main
        halt

main:
        ret

code_end:

        .set code_length, code_end - code_start
