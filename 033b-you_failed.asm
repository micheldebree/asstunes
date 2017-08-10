.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)
//---------------------------------------
//jeroen tel double speed player...
//---------------------------------------
         .pc= $2000
player:
         jsr l1006
         jsr l1000
         sei
         lda #$01
         sta $d01a
         lda #$7f
         sta $dc0d
         lda #$1b
         sta $d011
         lda #<irq
         sta $0314
         lda #>irq
         sta $0315
         lda #$33
         sta $d012
         cli
stop:     jmp stop
//---------------------------------------
irq:
         lda $dc01
         and #4
         bne dim
         jmp $9000
dim:      jsr l1000
         lda #$70
ir1:      cmp $d012
         bne ir1
         jsr l1000
         jsr meters
         inc $d019
         jmp $ea81
//--------------------l0900+15-----------
//l0900 : plaats in block
//l0900 + 15 : noot
//l0900 + 9  : wachtlus
//l0900 + 6  : wachttijden

//---------------------------------------
smoot:    .byte 32,97,116,234

meters:   lda #$00
         sta $fb
         lda #$04
         sta $fc
         lda l0900+15
         jsr meter
         lda #$28
         sta $fb
         lda l0900+16
         jsr meter
         lda #$50
         sta $fb
         lda l0900+17
         jsr meter
         lda #$50+40
         sta $fb
         lda l0900+9
         jsr meter
         lda #$50+80
         sta $fb
         lda l0900+10
         jsr meter
         lda #$50+120
         sta $fb
         lda l0900+11
         jsr meter
         lda #$50+160
         sta $fb
         lda l0900+6
         jsr meter
         lda #$18
         sta $fb
         lda #$05
         sta $fc
         lda l0900+7
         jsr meter
         lda #$18+40
         sta $fb
         lda l0900+8
         jsr meter

         rts




meter:
         ldx #$00
         stx m1+1
         clc
         lsr
         rol m1+1
         lsr
         rol m1+1
         sta n1+1

         ldy #$00
         lda #$a0
n1:       cpy #0
         beq m1
         sta ($fb),y
         iny
         jmp n1

m1:       ldx #0
         lda smoot,x
         sta ($fb),y
         iny

         lda #45
n2:       cpy #30
         beq m2
         sta ($fb),y
         iny
         jmp n2
m2:
         rts


//---------------------------------------
         .pc= $1000
         //
l1000:    jmp l0a19
l1003:    jmp l0a0a
l1006:    //
l0878:    .byte $ea
         //
//---------------------------------------
//init
//---------------------------------------
l0879:    lda #$00
         ldx #$14
l087d:    sta $d400,x
         dex
         bpl l087d
         sta l0a1a
l0886:    lda #$0f
         sta l1008
         lda #$00
         ldx #$27
l088f:    sta l08ea,x
         dex
         bne l088f
         ldx #$1f
l0897:    sta $9f,x
         dex
         bpl l0897
         sta l0878
         stx l0a1a
         rts
//---------------------------------------
//registers
//---------------------------------------
l08a3:    .byte $00,$07,$0e
l08a6:    .byte $00
l08a7:    .byte $87
l08a8:    .byte $ff,$ff,$ff
l08ab:    .byte $68,$68,$18
l08ae:    .byte $18,$18,$09
l08b1:    .byte $18,$18,$09
l08b4:    .byte $00,$04,$03
l08b7:    .byte $00,$00,$00
l08ba:    .byte $16,$16,$08
l08bd:    .byte $08
l08be:    .byte $04,$04,$04
l08c1:    .byte $00,$00,$00
l08c4:    .byte $18,$18,$18
l08c7:    .byte $a0,$a0,$a1
l08ca:    .byte $01,$01,$00
l08cd:    .byte $0f,$10,$40
l08d0:    .byte $00,$00,$00
l08d3:    .byte $0f,$10,$02
l08d6:    .byte $00,$00,$00
l08d9:    .byte $0d,$03,$00
l08dc:    .byte $00,$00,$00
l08df:    .byte $07,$00,$00
l08e2:    .byte $00,$00,$00
l08e5:    .byte $04,$04,$08
l08e8:    .byte $00,$00
l08ea:    .byte $00
l08eb:    .byte $00
l08ec:    .byte $00
l08ed:    .byte $00,$00,$00
l08f0:    .byte $00
l08f1:    .byte $00,$00,$00
l08f4:    .byte $00,$00,$00
l08f7:    .byte $00,$00,$00
l08fa:    .byte $00,$00,$00
l08fd:    .byte $00,$00,$00
l0900:    .byte $00,$00,$00
l0903:    .byte $00,$00,$00
l0906:    .byte $00,$00,$00
l0909:    .byte $00,$00,$00,$00,$00,$00
l090f:    .byte $00,$00
l0911:    .byte $00
l0912:    .byte $1c,$ff,$3f,$52,$66,$7b
         .byte $92,$aa,$c3,$de,$fa,$18
         .byte $38,$5a,$7e,$a3,$cc,$f6
         .byte $23,$53,$86,$bb,$f4,$30
         .byte $70,$b4,$fb,$47,$97,$ec
         .byte $47,$a6,$0b,$77,$e8,$60
         .byte $e0,$67,$f6,$8e,$2f,$d9
         .byte $8d,$4c,$17,$ed,$d0,$c1
         .byte $c0,$ce,$ec,$1c,$5d,$b2
         .byte $1a,$98,$2d,$da,$a0,$82
         .byte $80,$9c,$d9,$38,$ba,$63
         .byte $34,$31,$5a,$b4,$41,$04
         .byte $00,$39,$b2,$6f,$74,$c6
         .byte $69,$61,$b5,$68,$82,$08
         .byte $00,$72,$64,$de,$e9,$8c
         .byte $d1,$c2,$69,$d1
l0970:    .byte $04
l0971:    .byte $01,$fc,$01,$01,$01,$01
         .byte $01,$01,$01,$01,$01,$02
         .byte $02,$02,$02,$02,$02,$02
         .byte $03,$03,$03,$03,$03,$04
         .byte $04,$04,$04,$05,$05,$05
         .byte $06,$06,$07,$07,$07,$08
         .byte $08,$09,$09,$0a,$0b,$0b
         .byte $0c,$0d,$0e,$0e,$0f,$10
         .byte $11,$12,$13,$15,$16,$17
         .byte $19,$1a,$1c,$1d,$1f,$21
         .byte $23,$25,$27,$2a,$2c,$2f
         .byte $32,$35,$38,$3b,$3f,$43
         .byte $47,$4b,$4f,$54,$59,$5e
         .byte $64,$6a,$70,$77,$7e,$86
         .byte $8e,$96,$9f,$a8,$b2,$bd
         .byte $c8,$d4,$e1,$ee,$fd
l09d0:    .byte <end
l09d1:    .byte >end,<s0,>s0,<s1,>s1,<s2
         .byte >s2,<s3,>s3,<s4,>s4,<s5
         .byte >s5,<s6,>s6,<s7,>s7,<s8
         .byte >s8,<s9,>s9,<sa,>sa,<sb
         .byte >sb,<sc,>sc,<sd,>sd,<se
         .byte >se,<sf,>sf,<s10,>s10
         .byte <s11,>s11,<s12,>s12
         .byte <s13,>s13,<s14,>s14
         .byte <s15,>s15,<s16,>s16
         .byte <s17,>s17,<s18,>s18
         .byte <v0,>v0,<v1,>v1,<v2,>v2
//---------------------------------------
//player
//---------------------------------------
l0a0a:    lda #$00
l0a0c:    sta $d404
         sta $d40b
         sta $d412
         sta l0a1a
         rts
.label l0a1a    = *+1
l0a19:    lda #$ff
         bmi l0a1e
         rts
l0a1e:    lda l0878
         beq l0a36
         dec l08f0
         bpl l0a36
         sta l0909
         lda l1008
         bne l0a33
         jmp l0886
l0a33:    dec l1008
l0a36:    ldx #$02
.label l0a3a    = *+2
         dec l08ec
         bpl l0a44
         lda #$00
         sta l08ec
         bne l0a4e
l0a44:    dec l08eb
         bpl l0a4e
         lda #$05
         sta l08eb
l0a4e:    stx l08a6
         lda #$05
         cmp l08eb
         beq l0a5b
         jmp l0c3e
l0a5b:    dec l0909,x
         bmi l0a63
         jmp l0c18
l0a63:    txa
         asl
         adc l08e8,x
         tax
         lda l1014,x
         sta l0a7c
         lda l1015,x
.label l0a73    = *+1
         sta l0a7d
         ldx l08a6
l0a78:    ldy l08f4,x
.label l0a7c    = *+1
.label l0a7d    = *+2
         lda l11c6,y
         cmp #$fe
         beq l0a0a
         cmp #$ff
         bne l0a94
         lda #$00
         sta l0909,x
         sta l0900,x
         sta l08f4,x
         jmp l0a63
l0a94:    cmp #$6f
         bcc l0ab1
         cmp #$80
         bcc l0aa6
         sbc #$80
         sta l08f7,x
         inc l08f4,x
         bne l0a78
l0aa6:    sec
         sbc #$70
         sta l08fd,x
         inc l08f4,x
         bne l0a78
l0ab1:    asl
         tay
         lda l09d0,y
         sta $a0
         lda l09d1,y
         sta $a1
l0abd:    lda #$00
         sta l08dc,x
         sta l08ca,x
         ldy l0900,x
         lda ($a0),y
         sta l08a7
         cmp #$60
         bcs l0ad4
         jmp l0b98
l0ad4:    cmp #$ff
         bne l0af0
         lda #$00
         sta l0900,x
         lda l08fd,x
         beq l0ae7
         dec l08fd,x
         bpl l0aed
l0ae7:    inc l08f4,x
         jmp l0a78
l0aed:    jmp l0abd
l0af0:    cmp #$fd
         bne l0b0d
l0af4:    iny
         lda ($a0),y
         sta l08dc,x
         iny
         lda ($a0),y
         sta l08a7
         iny
         lda ($a0),y
         clc
         adc l08f7,x
         sta l08d9,x
         jmp l0b98
l0b0d:    lda #$00
         sta l08dc,x
         lda l08a7
         cmp #$fc
         bne l0b25
         iny
         lda ($a0),y
         sta l0878
         iny
         lda ($a0),y
         sta l08a7
l0b25:    lda l08a7
         cmp #$e0
         bcc l0b47
         sbc #$e1
         sta l0909,x
         lda #$00
         sta l08ed,x
         sta $ae,x
         sta $b1,x
         lda #$01
         sta l08ca,x
         iny
         tya
         sta l0900,x
         jmp l0fd4
l0b47:    lda l08a7
         cmp #$c0
         bcc l0b64
         sbc #$c0
         clc
         adc l08fa,x
         sta l0903,x
         iny
         lda ($a0),y
         cmp #$fd
         bne l0b61
         jmp l0af4
l0b61:    sta l08a7
l0b64:    cmp #$80
         bcc l0b89
         sbc #$81
         sta l0906,x
l0b6d:    iny
         lda ($a0),y
         cmp #$fd
         bne l0b77
         jmp l0af4
l0b77:    cmp #$80
         bcc l0b86
         sbc #$80
         clc
         adc l0906,x
         sta l0906,x
         bne l0b6d
l0b86:    sta l08a7
l0b89:    cmp #$60
         bcc l0b98
         sbc #$60
         sta l08b4,x
         iny
         lda ($a0),y
         sta l08a7
l0b98:    lda l0906,x
         sta l0909,x
         lda #$00
         sta l08ae,x
         sta $b8,x
         sta $bb,x
         sta l08d0,x
         iny
         tya
         sta l0900,x
         lda l08a7
         clc
         adc l08f7,x
         sta l090f,x
         tay
         lda l0912,y
         sta $a2,x
         lda l0971,y
         sta $a5,x
         sta l08cd,x
         sta l08d3,x
         inc l08ae,x
         lda #$ff
         sta l08a8,x
         lda l0903,x
         asl
         asl
         asl
         sta l08ab,x
         tay
         lda l1140,y
         sta $ae,x
         lda l1141,y
         sta $b1,x
         lda l08f1,x
         bmi l0bf9
         lda l113e,y
         and #$0f
         sta $ab,x
         lda l113e,y
         and #$f0
         sta $a8,x
l0bf9:    lda l1142,y
         and #$08
         bne l0c0f
.label l0c01    = *+1
         lda l1145,y
         and #$f0
         beq l0c0f
         lda #$01
l0c09:    sta l08ed,x
         jmp l0fd4
l0c0f:    lda l113f,y
         sta l08ed,x
         jmp l0fd4
l0c18:    lda l0909,x
         beq l0c39
         cmp l0906,x
         beq l0c35
         ldy l08ab,x
         lda l1142,y
         lsr
         lsr
         lsr
         lsr
         cmp #$0f
.label l0c2f    = *+1
         beq l0c39
         cmp l0909,x
         bcs l0c39
l0c35:    lda #$ff
         bne l0c3b
l0c39:    lda #$fe
l0c3b:    sta l08a8,x
l0c3e:    lda l08ca,x
         beq l0c46
         jmp l0fd4
l0c46:    inc l08ae,x
         lda l08ae,x
         cmp #$03
         bcs l0c52
         lda #$00
l0c52:    sta l08b1,x
         ldy l08ab,x
         lda l1142,y
         sta $b4
         lda l1143,y
         sta $b5
         lda l1144,y
         sta $b6
         lda l1145,y
         sta $b7
         and #$08
         beq l0c7e
         lda l0909,x
         bne l0c7e
         lda l08eb
         cmp #$01
         bne l0c7e
         sta $b1,x
l0c7e:    lda l08dc,x
         bne l0c86
         jmp l0cfb
l0c86:    ldy l08d9,x
.label l0c8a    = *+1
         lda l0912,y
         sta $a0
         lda l0971,y
         sta $a1
         lda #$00
         sta l08a7
         lda #$07
         ldy l08dc,x
         dey
l0c9e:    dey
         bmi l0ca8
         asl
         rol l08a7
         jmp l0c9e
l0ca8:    sta l08df
         lda l090f,x
         cmp l08d9,x
         bcc l0cdf
         lda $a2,x
         sbc l08df
         sta $a2,x
         lda $a5,x
         sbc l08a7
         sta $a5,x
         lda $a2,x
         sec
         sbc $a0
         lda $a5,x
         sbc $a1
         bcs l0cfb
l0ccc:    lda #$00
         sta l08dc,x
         lda $a0
         sta $a2,x
         lda $a1
         sta $a5,x
         sta l08cd,x
         jmp l0cfb
l0cdf:    lda $a2,x
         adc l08df
         sta $a2,x
         lda $a5,x
         adc l08a7
         sta $a5,x
         lda $a0
         sec
         sbc $a2,x
         lda $a1
         sbc $a5,x
         bcs l0cfb
         jmp l0ccc
l0cfb:    lda $b4
         and #$08
         beq l0d12
         lda $b7
         lsr
         lsr
         lsr
         lsr
         tay
         dey
l0d09:    lda l11be,y
         clc
l0d0d:    adc #$14
         tay
         bne l0d1b
l0d12:    lda $b7
         and #$04
         beq l0d90
         ldy l08b4,x
l0d1b:    lda l1024,y
         sta $a0
         lda l103c,y
         sta $a1
         lda l08b1,x
         bne l0d30
         sta l08ba,x
         sta l08b7,x
l0d30:    ldy #$00
         lda ($a0),y
         sta l08a7
         dec l08b7,x
         bpl l0d90
         lsr
         lsr
         lsr
         lsr
         and #$07
         sta l08b7,x
l0d45:    inc l08ba,x
         ldy l08ba,x
         lda ($a0),y
         cmp #$ff
         bne l0d5d
         ldy #$00
         lda ($a0),y
         and #$0f
         sta l08ba,x
         jmp l0d45
l0d5d:    cmp #$fe
         bne l0d67
         dec l08ba,x
         jmp l0d90
l0d67:    ldy l08dc,x
         bne l0d90
         bit l08a7
         bpl l0d78
         sta $a5,x
         sta $a2,x
         jmp l0d8d
l0d78:    cmp #$00
         bmi l0d80
         clc
         adc l090f,x
l0d80:    and #$7f
         tay
         lda l0912,y
         sta $a2,x
         lda l0971,y
         sta $a5,x
l0d8d:    sta l08cd,x
l0d90:    lda $b5
         bne l0d97
l0d94:    jmp l0e30
l0d97:    lda l08b1,x
         bne l0db2
         lda #$00
         sta $bb,x
         sta $b8,x
         sta l08e2,x
         lda $b5
         and #$07
         lsr
         adc #$00
         sta l08d0,x
         jmp l0e30
l0db2:    lda l08dc,x
         bne l0d94
         ldy l090f,x
         lda l0912,y
         sec
         sbc l0911,y
         sta $a0
         lda l0971,y
         sbc l0970,y
         sta $a1
         lda $b5
         and #$70
         lsr
         lsr
         lsr
         lsr
         tay
l0dd4:    dey
         bmi l0dde
         lsr $a1
         ror $a0
         jmp l0dd4
l0dde:    lda $b6
         lsr
         lsr
         lsr
         lsr
         sta l0def
         lda l0906,x
         sec
         sbc l0909,x
.label l0def    = *+1
         cmp #$00
         bcc l0e30
         dec l08d0,x
         bpl l0e0e
         inc l08d0,x
         dec $b8,x
         bpl l0e0a
         lda $b5
         and #$07
         sta $b8,x
         lda $bb,x
         eor #$01
         sta $bb,x
l0e0a:    lda $bb,x
         bne l0e1f
l0e0e:    lda $a2,x
         clc
         adc $a0
         sta $a2,x
.label l0e16    = *+1
         lda l08cd,x
         adc $a1
         sta $a5,x
         jmp l0e2d
l0e1f:    lda $a2,x
         sec
         sbc $a0
         sta $a2,x
         lda l08cd,x
         sbc $a1
         sta $a5,x
l0e2d:    sta l08cd,x
l0e30:    ldx l08a6
         lda $b4
         and #$07
         bne l0e3c
         jmp l0e83
l0e3c:    stx l0e84
         lda l08b1,x
         bne l0e57
         ldy #$00
         sty l0e58
         lda #$02
         sta l08bd
         iny
         sty $bf
         lda l1077,y
         jmp l0e8c
.label l0e58    = *+1
l0e57:    lda #$ff
         bmi l0e91
         dec $bf
         bne l0e7b
         ldy l08bd
         lda l1077,y
         cmp #$ff
         bne l0e6e
         sta l0e58
         bne l0e91
l0e6e:    sta $bf
         iny
         lda l1077,y
         sta l0e7f
         iny
         sty l08bd
l0e7b:    lda $be
         clc
.label l0e7f    = *+1
         adc #$10
         jmp l0e8c
.label l0e84    = *+1
l0e83:    lda #$00
         cmp l08a6
         bne l0e91
         lda #$ff
l0e8c:    sta $be
         sta $d416
l0e91:    ldx l08a6
         lda $b6
         and #$0f
         bne l0e9d
         jmp l0f48
l0e9d:    tay
         dey
         lda l101a,y
         sta $a0
         lda l101f,y
         sta $a1
         ldy #$00
         lda ($a0),y
         and #$0f
         sta l0f2a
         lda ($a0),y
         lsr
         lsr
         lsr
         lsr
         sta l0f42
         lda l08b1,x
         bne l0edc
         iny
         lda ($a0),y
         sta l08f1,x
         bmi l0ecf
         lda ($a0),y
         and #$7f
         sta l08c7,x
l0ecf:    lda #$02
         sta l08be,x
         lda #$01
         sta l08c1,x
         jmp l0f48
l0edc:    lda l08c7,x
         bmi l0f15
         dec l08c1,x
         bne l0f15
         ldy l08be,x
         lda ($a0),y
         cmp #$ff
         bne l0efa
         lda l08c7,x
         eor #$a0
         sta l08c7,x
         jmp l0f15
l0efa:    cmp #$fe
         bne l0f07
         lda #$0c
         sta $ab,x
         sta $a8,x
         iny
         lda ($a0),y
l0f07:    sta l08c1,x
         iny
         lda ($a0),y
.label l0f0e    = *+1
         sta l08c4,x
         iny
         tya
         sta l08be,x
l0f15:    lda l08c7,x
         lsr
         bcc l0f33
         lda $a8,x
         clc
         adc l08c4,x
         sta $a8,x
         lda $ab,x
         adc #$00
         sta $ab,x
.label l0f2a    = *+1
         cmp #$0e
         bcc l0f48
         dec l08c7,x
         jmp l0f48
l0f33:    lda $a8,x
         sec
         sbc l08c4,x
         sta $a8,x
         lda $ab,x
         sbc #$00
         sta $ab,x
.label l0f42    = *+1
         cmp #$02
         bcs l0f48
         inc l08c7,x
l0f48:    lda $b4
         and #$08
         bne l0f8b
         lda $b7
         and #$f0
         beq l0f8b
         lsr
         lsr
         lsr
         lsr
         tay
         dey
         lda l11b6,y
         cmp l08ae,x
         bcc l0f75
         lda #$01
         sta l08d6,x
         lda l11be,y
         bpl l0f72
         lda #$48
         sta $a5,x
         lda #$81
l0f72:    jmp l0f88
l0f75:    lda l08d6,x
         beq l0f8b
         dec l08d6,x
         lda l08cd,x
         sta $a5,x
         ldy l08ab,x
         lda l113f,y
l0f88:    sta l08ed,x
l0f8b:    lda $b4
         and #$08
         beq l0fd4
         lda $b7
         lsr
         lsr
         lsr
         lsr
         tay
         dey
         lda l11b6,y
         tay
         lda l1054,y
         sta $a0
         lda l1058,y
         sta $a1
         lda l08b1,x
         bne l0faf
         sta l08e5,x
l0faf:    inc l08e5,x
         ldy l08e5,x
         lda ($a0),y
         cmp #$ff
         bne l0fc7
         ldy #$00
         lda ($a0),y
         and #$0f
         sta l08e5,x
         jmp l0faf
l0fc7:    cmp #$fe
         bne l0fd1
         dec l08e5,x
         jmp l0fd4
l0fd1:    sta l08ed,x
l0fd4:    ldx l08a6
         ldy l08a3,x
         lda $b1,x
         sta $d406,y
         lda $ae,x
         sta $d405,y
l0fe4:    lda l08ed,x
         and l08a8,x
         sta $d404,y
         lda $ab,x
         sta $d403,y
         lda $a8,x
         sta $d402,y
         lda $a2,x
         sta $d400,y
         lda $a5,x
         sta $d401,y
         dex
         bmi l1007
         jmp l0a4e
.label l1008    = *+1
l1007:    lda #$0f
         ora #$10
         sta $d418
         lda #$f1
l1010:    sta $d417
         rts
//---------------------------------------
//indirect addresses
//---------------------------------------
l1014:    .byte <q1
l1015:    .byte >q1,<q2,>q2,<q3,>q3
         //
l101a:    .byte <a0,<a1,<a2,<a3,<a4
l101f:    .byte >a0,>a1,>a2,>a3,>a4
         //
l1024:    .byte <b0,<b1,<b2,<b3,<b4,<b5
         .byte <b6,<b7,<b8,<b9,<ba,<bb
         .byte <bc,<bd,<be,<bf,<b10
         .byte <b11,<b12,<b13,<b14
         .byte <b15,<b16,<b17
         //
l103c:    .byte >b0,>b1,>b2,>b3,>b4,>b5
         .byte >b6,>b7,>b8,>b9,>ba,>bb
         .byte >bc,>bd,>be,>bf,>b10
         .byte >b11,>b12,>b13,>b14
         .byte >b15,>b16,>b17
         //
l1054:    .byte <c0,<c1,<c2,<c3
l1058:    .byte >c0,>c1,>c2,>c3
//---------------------------------------
//datas
//---------------------------------------
a0:       .byte $26,$01,$01,$20,$ff
a1:       .byte $3d,$00,$01,$40,$ff
a2:       .byte $2e,$01,$01,$18,$ff
a3:       .byte $2e,$81,$10,$50,$01,$30
         .byte $ff
a4:       .byte $4c,$01,$01,$08,$ff
         //
l1077:    .byte $10,$c0,$0b,$f0,$01,$f8
         .byte $ff
         //
b0:       .byte $10,$00,$03,$07,$ff
b1:       .byte $10,$00,$04,$07,$ff
b2:       .byte $10,$00,$05,$08,$ff
b3:       .byte $10,$00,$05,$09,$ff
b4:       .byte $10,$00,$03,$08,$ff
b5:       .byte $10,$00,$04,$09,$ff
b6:       .byte $10,$00,$02,$07,$ff
b7:       .byte $10,$00,$02,$06,$ff
b8:       .byte $10,$00,$05,$07,$ff
b9:       .byte $10,$00,$05,$0a,$ff
ba:       .byte $50,$0c,$00,$fe
bb:       .byte $10,$00,$03,$0a,$ff
bc:       .byte $50,$00,$03,$07,$ff
bd:       .byte $50,$00,$04,$07,$ff
be:       .byte $50,$00,$05,$08,$ff
bf:       .byte $50,$00,$05,$09,$ff
b10:      .byte $50,$00,$03,$08,$ff
b11:      .byte $50,$00,$04,$09,$ff
b12:      .byte $20,$00,$05,$09,$ff
b13:      .byte $20,$00,$03,$08,$ff
c0:       .byte $80,$09,$09,$81,$11,$11
         .byte $11,$11,$11,$10,$fe
b14:      .byte $80,$00,$00,$fc,$10,$0d
         .byte $0a,$08,$07,$07,$06,$06
         .byte $05,$05,$04,$fe
c1:       .byte $87,$09,$09,$81,$11,$41
         .byte $41,$41,$80,$50,$ff
b15:      .byte $87,$00,$00,$60,$14,$10
         .byte $0e,$0c,$40,$30,$ff
c2:       .byte $80,$09,$09,$81,$11,$80
         .byte $fe
b16:      .byte $80,$00,$00,$fc,$24,$fc
         .byte $fe
c3:       .byte $80,$09,$09,$11,$10,$fe
b17:      .byte $00,$00,$00,$06,$0a,$0e
         .byte $0c,$0a,$07,$05,$04,$03
         .byte $03,$02,$02,$02,$02,$01
         .byte $01,$01,$01,$01,$00,$fe
//---------------------------------------
//                 SOUNDS
//---------------------------------------
l113e:          //?,scherpte
.label l113f    = *+1 //waveform
.label l1140    = *+2 //sustain, release
.label l1141    = *+3 //vol,sustain
.label l1142    = *+4 //sustain,filter
.label l1143    = *+5 //
.label l1144    = *+6 //klank
.label l1145    = *+7 //tic,fx

         .byte $04,$41,$00,$a8 //sound 0
         .byte $13,$34,$42,$50 //bass

         .byte $08,$81,$cb,$0a //sound 1
         .byte $c0,$00,$01,$40 //

         .byte $08,$19,$00,$a6 //sound 2
         .byte $08,$00,$00,$10 //base

         .byte $08,$19,$00,$98 //sound 3
         .byte $08,$00,$00,$20 //snare

         .byte $08,$15,$00,$69 //sound 4
         .byte $f0,$05,$00,$80 //

         .byte $05,$41,$01,$59 //sound 5
         .byte $f0,$00,$01,$84 //

         .byte $03,$21,$00,$59 //sound 6
         .byte $00,$00,$03,$04 //

         .byte $08,$19,$01,$83 //sound 7
         .byte $18,$00,$00,$30 //

         .byte $09,$41,$01,$48 //sound 8
         .byte $10,$37,$f2,$80 //

         .byte $07,$41,$ba,$aa //sound 9
         .byte $a0,$37,$03,$00 //

         .byte $08,$43,$ba,$aa //sound a
         .byte $a0,$00,$04,$00 //

         .byte $08,$41,$00,$3f //sound b
         .byte $f0,$37,$85,$00 //

         .byte $09,$41,$01,$48 //sound c
         .byte $10,$2f,$02,$80 //

         .byte $08,$19,$01,$c6 //sound d
         .byte $08,$00,$00,$40 //

         .byte $08,$41,$01,$38 //sound e
         .byte $f0,$00,$00,$54 //

l11b6:    .byte $00,$01,$02,$03
         .byte $04,$04,$04,$04

l11be:    .byte $00,$01,$02,$03
         .byte $81,$41,$04,$11
//---------------------------------------
l11c6:
//---------------------------------------
//               TRACK 1
//---------------------------------------
q1:
         .byte $8c,$03,$87,$03,$ff
         .byte $8a,$03,$85,$03,$ff


         .byte $8a,$03,$03
         .byte $85,$03,$03
         .byte $87,$03,$03
         .byte $83,$03,$85,$0b

         .byte $8a,$03,$03
         .byte $85,$03,$03
         .byte $87,$03,$03
         .byte $83,$03,$85,$03

         .byte $8a,$03,$03
         .byte $85,$03,$03
         .byte $87,$03,$03
         .byte $83,$03,$85,$03

         .byte $8f,$03,$91,$03
         .byte $93,$03,$03
         .byte $8f,$03,$91,$03
         .byte $93,$03,$06

         .byte $8c,$03,$03
         .byte $87,$03,$03
         .byte $89,$03,$03
         .byte $85,$03,$87,$03



         .byte $ff

//---------------------------------------
//               TRACK 2
//---------------------------------------
q2:

         .byte $90,$01,$8b,$01,$ff,$01
         .byte $89,$01,$ff


         .byte $8a,$01,$01
         .byte $85,$01,$08
         .byte $87,$05,$05
         .byte $83,$01,$85,$0c

         .byte $8a,$01,$01
         .byte $85,$01,$08
         .byte $87,$05,$05
         .byte $83,$01,$85,$07
         .byte $8a,$01,$01
         .byte $85,$01,$08
         .byte $87,$05,$05
         .byte $83,$01,$85,$07

         .byte $83,$01,$85,$01
         .byte $87,$05,$05
         .byte $83,$01,$85,$01
         .byte $87,$05,$08

         .byte $8c,$01,$01
         .byte $87,$01,$08
         .byte $89,$05,$05
         .byte $85,$01,$87,$07



         .byte $ff
//---------------------------------------
//               TRACK 3
//---------------------------------------
q3:
         .byte $8c,$04,$ff

         .byte $8c,$04,$04
         .byte $09,$09
         .byte $8e,$04,$ff
//---------------------------------------
//               BLOCKS
// 60+x = chord x
// 80+x = speed x
// c0+x = sound x
// e0+x = wait  x

//-----------------DRUM------------------

s0:       .byte $c2,$86,$20
         .byte $c5,$84,$61,$20,$82,$66
         .byte $20
         .byte $c4,$84,$24,$c5,$82,$61
         .byte $20,$84,$66
         .byte $20,$82,$61,$20

         .byte $c2,$86,$20
         .byte $c5,$84,$66,$20,$82,$61
         .byte $20
         .byte $c4,$84,$24,$c5,$82,$63
         .byte $20,$84,$61
         .byte $20,$c7,$81,$10,$10
         .byte $ff

//-----------------EMPTY-----------------

s1:       .byte $f0,$f0,$f0,$f0
         .byte $ff

//-----------------BASS------------------

s2:       .byte $c0,$86,$0c,$84,$18,$82
         .byte $0c
         .byte $c3,$84,$10
         .byte $c0,$82,$0c,$84,$0c,$82
         .byte $0c,$86,$0c,$84,$18,$82
         .byte $0c,$c3,$84,$10,$c0,$07
         .byte $0c,$ff
         .byte $ff

//-----------------SOLO------------------

s3:       .byte $c8,$92,$24,$86,$2b,$2c
         .byte $84,$2b,$88,$29,$86,$29
         .byte $86,$2b,$2e,$2c,$2b,$86
         .byte $2c,$84,$2b,$88,$27,$86
         .byte $29

         .byte $92,$24,$86,$2b,$2c
         .byte $84,$2b,$88,$30,$86,$30
         .byte $86,$33,$32,$30,$32,$86
         .byte $2b,$84,$2b,$88,$2c,$86
         .byte $2e,$ff

//----------------DRUM-3-----------------
s4:
         .byte $c2,$84,$20
         .byte $c5,$82,$60,$30
         .byte $c2,$82,$20
         .byte $c3,$82,$20
         .byte $c5,$82,$64,$30
         .byte $c2,$82,$20
         .byte $c5,$60,$30
         .byte $c2,$82,$20
         .byte $c7,$20,$c5,$60,$30
         .byte $c2,$82,$20
         .byte $c3,$82,$20
         .byte $c5,$82,$68,$30
         .byte $c2,$82,$20
         .byte $c3,$20
         .byte $ff

//----------------EMPTY------------------
s5:       .byte $f0,$f0,$ff
//-----------------DRUM-2----------------
s6:
         .byte $c2,$82,$20
         .byte $c7,$20,$20
         .byte $c2,$82,$20
         .byte $c3,$82,$20
         .byte $c7,$81,$20,$20
         .byte $c2,$82,$20
         .byte $c7,$20
         .byte $c3,$82,$20
         .byte $c7,$20,$20
         .byte $c3,$82,$20
         .byte $c3,$82,$20
         .byte $c3,$81,$20,$20
         .byte $c3,$82,$20
         .byte $c3,$20
         .byte $ff
//------------DRUM-SOLO------------------
s7:       .byte $c2,$82,$0c
         .byte $c7,$0c,$0c
         .byte $c2,$82,$0c
         .byte $c3,$82,$0c
         .byte $c7,$82,$0c,$0c,$0c
         .byte $cd,$82
         .byte $30,$2c,$30,$2c
         .byte $32,$2c,$c3,$0c,$0c
         .byte $ff

//-----------------SOLO-BRIDGE-----------
s8:       .byte $cc,$a0
         .byte $fd,$02,$30,$33
         .byte $fd,$03,$33,$35
         .byte $9c,$32
         .byte $84,$32
         .byte $3a,$3a
         .byte $39,$39
         .byte $37,$37
         .byte $35,$35

         .byte $ff
//---------------------------------------

s9:       .byte $c2,$84,$10
         .byte $c7,$82,$10,$10
         .byte $c3,$84,$10
         .byte $c2,$82,$10
         .byte $c7,$10
         .byte $c2,$82,$10
         .byte $c7,$10,$10,$10
         .byte $c3,$84,$10
         .byte $cd,$84,$30
         .byte $c2,$84,$10
         .byte $c7,$82,$10,$10
         .byte $c3,$84,$10
         .byte $c2,$82,$10
         .byte $c7,$10
         .byte $c2,$82,$10
         .byte $c7,$10,$10,$10
         .byte $c3,$82,$10,$c2,$84,$10
         .byte $c7,$81
         .byte $10,$10
         .byte $ff

//---------------------------------------
sa:       .byte $c0,$84
         .byte $0c,$e2,$82
         .byte $0c,$e4
         .byte $82,$0c,$e2
         .byte $88,$0e
         .byte $88,$10
         .byte $ff
//---------------------------------------
sb:       .byte $c2,$82,$20
         .byte $c7,$20,$20
         .byte $c2,$82,$20
         .byte $c3,$82,$20
         .byte $c7,$81,$20,$20
         .byte $c2,$82,$20
         .byte $c7,$20
         .byte $c2,$82,$20
         .byte $c7,$20,$20,$20
         .byte $c4,$88,$30
         .byte $ff
//---------------------------------------
sc:       .byte $c1,$bf,$5f,$e1
         .byte $ff
//---------------------------------------
sd:
se:
sf:
s10:
s11:
s12:
s13:
s14:
s15:
s16:
s17:
s18:
         .byte $ff
//---------------------------------------
v0:       .byte $c0,$88,$0f,$c3,$84,$00
         .byte $c0,$0f,$88,$0f,$c3,$84
         .byte $00,$c0,$88,$0d,$84,$19
         .byte $c3,$00,$c0,$0d,$88,$0d
         .byte $c3,$84,$00,$c0,$0d,$88
         .byte $0f,$c3,$84,$00,$c0,$0f
         .byte $88,$0f,$c3,$84,$00,$c0
         .byte $88,$0d,$84,$19,$c3,$00
         .byte $c0,$0d,$88,$0d,$c3,$84
         .byte $00,$c0,$0d,$88,$03,$90
         .byte $0f,$c3,$84,$00,$c0,$88
         .byte $0d,$84,$19,$c3,$00,$c0
         .byte $0d,$88,$0d,$c3,$84,$00
         .byte $c0,$0d,$88,$0f,$c3,$84
         .byte $00,$c0,$0f,$88,$0f,$c3
         .byte $84,$00,$c0,$88,$0d,$84
         .byte $19,$c3,$00,$c0,$0d,$88
         .byte $0d,$c3,$84,$00,$c0,$0d
         .byte $ff
//---------------------------------------
v1:       .byte $c3,$81,$00,$c6,$8f,$63
         .byte $2e,$c2,$81,$00,$c6,$8f
         .byte $2e,$c2,$81,$00,$c6,$8f
         .byte $2c,$c2,$81,$00,$c6,$8f
         .byte $2c,$c2,$81,$00,$c6,$8f
         .byte $2e,$c2,$81,$00,$c6,$8f
         .byte $2e,$c2,$81,$00,$c6,$8f
         .byte $2c,$c2,$81,$00,$c6,$8f
         .byte $2c,$c2,$88,$00,$c3,$00
         .byte $c6,$2e,$c2,$81,$00,$c6
         .byte $83,$2e,$c2,$81,$00,$c6
         .byte $93,$2c,$c2,$81,$00,$c6
         .byte $8f,$2c,$c2,$81,$00,$c6
         .byte $8f,$2e,$c2,$81,$00,$c6
         .byte $8f,$2e,$c2,$81,$00,$c6
         .byte $8f,$2c,$c2,$81,$00,$c6
         .byte $8f,$2c,$ff
//---------------------------------------
v2:       .byte $cc,$98,$27,$c8,$84,$27
         .byte $25,$e4,$82,$22,$e2,$cc
         .byte $84,$25,$c8,$82,$27,$e2
         .byte $cc,$84,$2a,$c8,$82,$27
         .byte $cc,$84,$25,$c8,$82,$27
         .byte $cc,$84,$2c,$ce,$98,$72
         .byte $22,$84,$22,$20,$e4,$c8
         .byte $2c,$e4,$cc,$88,$2e,$c8
         .byte $84,$2b,$29,$27,$c4,$88
         .byte $18,$ce,$90,$73,$1f,$84
         .byte $1f,$1d,$e4,$c8,$22,$cc
         .byte $20,$c8,$22,$25,$27,$cc
         .byte $2c,$c8,$29,$ce,$98,$72
         .byte $22,$84,$22,$20,$e4,$c8
         .byte $82,$25,$e2,$cc,$84,$25
         .byte $c8,$22,$cc,$25,$c8,$82
         .byte $22,$cc,$84,$20,$c8,$82
         .byte $1e,$cc,$84,$1b,$ff

end:

