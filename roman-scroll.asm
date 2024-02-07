; ROMAN-SCROLL (64 BYTES)
; PRINTS ROMAN NUMERALS 1-255 SCROLLING UP THE PAGE
; BY KEITH JENKINS (KGJENKINS)
; FOR LOVEBYTE 2024, 64 BYTE OLDSCHOOL INTRO COMPETITION

COUT                EQU  $FDED

                    ORG  $300

MAIN                LDY  #0
                    LDX  #8
:1                  TYA
                    SEC
                    SBC  ROMANVALUE,X
                    BCC  :2
                    TAY
                    LDA  ROMANCHAR,X
                    JSR  COUT
                    TXA
                    LSR
                    BCC  :1
                    LDA  ROMANCHAR+1,X
                    JSR  COUT
                    INX
:2                  DEX
                    BPL  :1
:3                  LDA  #$A0                    ; SPACE
                    JSR  COUT
                    DEX
                    BNE  :3
                    INC  MAIN+1
                    BNE  MAIN
                    RTS

ROMANVALUE          DFB  1,4,5,9,10,40,50,90,100
ROMANCHAR           ASC  "IIVIXXLXC"

