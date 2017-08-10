.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)

.var start    = $1000

         .pc= $4000
player:
         lda #$0f
         sta 646
         ldx #$00
kop:      lda header,x
         beq out
         jsr $ffd2
         inx
         bne kop
out:      sei
         ldy #$00
         jsr init
back2:    lda #$62
back1:    cmp $d012
         bne back1
         dec $d020
         jsr play
         inc $d020
         lda #$04
         sta $03
         lda #$00
         sta $02
         lda start+[3*40]
         jsr bar
         lda start+[3*40]+1
         jsr bar
         lda start+[3*40]+2
         jsr bar
         lda $dc01
         and #$04
         bne back2
         jmp $9000
//---------------------------------------
header:   .byte 13,13,13
         .text "The Four Seasons, "
         .text "Spring, Allegro."
         .byte 13,13
         .text "Composed by Antonio "
         .text "Vivaldi,"
         .byte 13
         .text "Converted by Mad B/"
         .text "Rhyme Design."
         .byte 0
//---------------------------------------
bar:      sta length
         lsr
         lsr
         sta comp+1
         lda #$a0
         ldy #$00
bloop:    sta ($02),y
         iny
comp:     cpy #$00
         bne bloop
         lda length
         and #3
         tax
         lda smooth,x
         sta ($02),y
         iny
         lda #$20
space:    cpy #40
         bpl endbar
         sta ($02),y
         iny
         jmp space
endbar:   lda $02
         clc
         adc #40
         sta $02
         lda $03
         adc #0
         sta $03
         rts

length:   .byte 0
smooth:   .byte 101,117,97,231
//---------------------------------------

         .pc= start

.var f00      = $00
.var f0101    = $0101
.var f0102    = $0102
.var f0201    = $0201
.var f800a    = $800a
.var fd400    = $d400
.var fd401    = $d401
.var fd402    = $d402
.var fd403    = $d403
.var fd404    = $d404
.var fd405    = $d405
.var fd406    = $d406
//---------------------------------------
.var a00      = $00
.var afe      = $fe
.var aff      = $ff
.var ad404    = $d404
.var ad40b    = $d40b
.var ad412    = $d412
.var ad415    = $d415
.var ad416    = $d416
.var ad417    = $d417
.var ad418    = $d418
//---------------------------------------
.var p0e      = $0e
.var p40      = $40
.var pfe      = $fe
//---------------------------------------

init:     jmp i10de
play:     jmp i114a
         jmp i1140
         jmp i123c
//---------------------------------------
         .byte $20,$20,$20,$2a
         .byte $2a,$20,$4d,$55
         .byte $53,$49,$43,$20
         .byte $42,$59,$20,$4d
         .byte $41,$52,$54,$49
         .byte $4a,$4e,$20,$53
         .byte $43,$48,$55,$54
         .byte $54,$45,$4e,$20
         .byte $2a,$2a,$20,$50
         .byte $4c,$41,$59,$45
         .byte $52,$2c,$20,$53
         .byte $4f,$55,$4e,$44
         .byte $53,$2c,$20,$46
         .byte $58,$20,$42,$59
         .byte $20,$46,$41,$4c
         .byte $43,$4f,$20,$50
         .byte $41,$55,$4c,$20
         .byte $2a,$2a,$20
a1053:    .byte $00
a1054:    .byte $40
a1055:    .byte $01
a1056:    .byte $01
a1057:    .byte $00
a1058:    .byte $02
a1059:    .byte $00
a105a:    .byte $00
a105b:    .byte $00
a105c:    .byte $00
a105d:    .byte $f1
a105e:    .byte $10
a105f:    .byte $0f
a1060:    .byte $07
a1061:    .byte $0f
a1062:    .byte $0f
f1063:    .byte $08,$08,$04
f1066:    .byte $05,$05,$05
f1069:    .byte $bb,$bb,$f2
f106c:    .byte $00,$00,$00
f106f:    .byte $00,$00,$00
f1072:    .byte $00,$00,$00
f1075:    .byte $bb,$00,$00
f1078:    .byte $19,$1b,$43
f107b:    .byte $00,$00,$00
f107e:    .byte $01,$01,$01
f1081:    .byte $0d,$0d,$0d
f1084:    .byte $03,$01,$01
f1087:    .byte $01,$01,$01
f108a:    .byte $2a,$4c,$62
f108d:    .byte $1e,$1e,$1e
f1090:    .byte $00,$00,$00
f1093:    .byte $00,$00,$00
f1096:    .byte $a7,$00,$00
f1099:    .byte $41,$00,$00
f109c:    .byte $02,$00,$00
f109f:    .byte $0b,$00,$00
f10a2:    .byte $60,$00,$00
f10a5:    .byte $00,$00,$00
f10a8:    .byte $00,$00,$00
f10ab:    .byte $70,$fb,$3c
f10ae:    .byte $04,$04,$32
f10b1:    .byte $00,$00,$00
f10b4:    .byte $00,$00,$00
f10b7:    .byte $63,$16,$44
f10ba:    .byte $01,$01,$05
f10bd:    .byte $20,$39,$ca
f10c0:    .byte $00,$00,$00
f10c3:    .byte $00,$01,$00
f10c6:    .byte $d6,$00,$00
a10c9:    .byte $40
f10ca:    .byte $02,$00,$00
a10cd:    .byte $01
f10ce:    .byte $00,$00,$00,$04
f10d2:    .byte $00,$00,$00,$08
f10d6:    .byte $00,$00,$00,$00
f10da:    .byte $00,$00,$00
a10dd:    .byte $00
//---------------------------------------
i10de:    lda f18cf,y
         tay
         lda f1e1f,y
         sta a1058
         lda f1e20,y
         sta a1059
         lda #$0f
         sta a105f
         ldx #$00
i10f5:    iny
         iny
         lda f1e1f,y
         sta f107e,x
         sta f1081,x
         lda f1e20,y
         sta f108a,x
         lda f1e21,y
         sta f108d,x
         lda #$01
         sta a1055
         sta a1060,x
         sta a1057
         lda #$00
         sta f1087,x
         sta f1084,x
         sta f1090,x
         sta f106c,x
         iny
         inx
         cpx #$03
         bne i10f5
         sta a10dd
         sta a105d
         sta a105e
         sta a1056
i1137:    sta ad404
         sta ad40b
         sta ad412
i1140:    sta a105a
i1143:    sta a105b
         sta a105c
         rts
i114a:    lda a1055
         beq i1137
         cld
         ldx #$02
         lda a105b
         beq i1167
         ldy a105f
         beq i1167
         dec a105c
         bne i1167
         sta a105c
         dec a105f
i1167:    dec a1057
         bpl i1174
         lda a1059
         sta a1057
         bne i1188
i1174:    dec a1056
         bpl i1188
         lda a1058
         sta a1056
         dec a1060
         dec a1061
         dec a1062
i1188:    stx a1053
         lda a1060,x
         beq i1193
         jmp i1402
i1193:    lda f108a,x
         sta afe
         lda f108d,x
         sta aff
         ldy f1087,x
         lda (pfe),y
         bpl i11e7
         cmp #$ff
         bne i11b3
         iny
         lda (pfe),y
         sta f1087,x
         tay
         lda (pfe),y
         bpl i11e7
i11b3:    cmp #$c0
         bcs i11c7
         and #$3f
         adc f107e,x
         sta f1081,x
         inc f1087,x
         iny
         lda (pfe),y
         bpl i1242
i11c7:    cmp #$e0
         bcs i11d8
         and #$1f
         sta f106c,x
         inc f1087,x
         iny
         lda (pfe),y
         bpl i1242
i11d8:    cmp #$fb
         bcs i11eb
         and #$1f
         sta f1090,x
         inc f1087,x
         iny
         lda (pfe),y
i11e7:    bpl i1242
         cmp #$fb
i11eb:    bne i120f
         inc f1087,x
         iny
         lda (pfe),y
         sta a1056
         sta a1058
         inc f1087,x
         iny
         lda (pfe),y
         sta a1059
         lda #$00
         sta a1057
         inc f1087,x
         iny
         lda (pfe),y
         bpl i1242
i120f:    cmp #$fc
         bne i1222
         lda a105a
         bne i1234
         jsr i1143
         lda #$0f
         sta a105f
         bne i1234
i1222:    cmp #$fd
         bne i123c
         inc f1087,x
         iny
         lda a105a
         bne i1234
         lda (pfe),y
         jsr i1143
i1234:    inc f1087,x
         iny
         lda (pfe),y
         bpl i1242
i123c:    lda #$00
         sta a1055
         rts
i1242:    tay
         lda f1e7e,y
         sta afe
         lda f1e8d,y
         sta aff
         lda #$00
         sta f1066,x
         sta f10b4,x
         sta f10a8,x
         sta f10da,x
         ldy f1084,x
         bne i126c
         sta f10a5,x
         sta f107b,x
         sta f106f,x
         sta f1072,x
i126c:    lda (pfe),y
         bpl i12ae
         cmp #$81
         bcs i127f
         iny
         lda (pfe),y
         sta f107b,x
         iny
         lda (pfe),y
         bpl i12ae
i127f:    cmp #$c0
         bcs i1298
         and #$3f
i1285:    sta f1063,x
         iny
         lda (pfe),y
         bpl i12ae
         cmp #$c0
         bcs i1298
         and #$3f
         adc f1063,x
         bne i1285
i1298:    cmp #$e0
         bcs i12b0
         and #$1f
         adc f106c,x
         tax
         lda f18cf,x
         ldx a1053
         sta f1069,x
         iny
         lda (pfe),y
i12ae:    bpl i1311
i12b0:    cmp #$f8
         bcs i12c9
         and #$1f
i12b6:    sta f10a5,x
         iny
         lda (pfe),y
         bpl i1311
         cmp #$f8
         bcs i12c9
         and #$1f
         adc f10a5,x
         bne i12b6
i12c9:    bne i12d5
         lda #$00
         sta a105d
         iny
         lda (pfe),y
         bpl i1311
i12d5:    cmp #$f9
         bne i12e4
         iny
         lda (pfe),y
         sta f106f,x
         iny
         lda (pfe),y
         bpl i1311
i12e4:    cmp #$fa
         bne i12f3
         iny
         lda (pfe),y
         sta f1072,x
         iny
         lda (pfe),y
         bpl i1311
i12f3:    cmp #$fb
         beq i12fd
         cmp #$fc
         bne i1305
         lda #$01
i12fd:    sta f10da,x
         iny
         lda (pfe),y
         bpl i1311
i1305:    cmp #$fe
         beq i130b
         lda #$00
i130b:    sta a10dd
         iny
         lda (pfe),y
i1311:    cmp #$60
         beq i132b
         bcs i131f
         adc f1081,x
         sta f1078,x
         bpl i134a
i131f:    and #$1f
         sta a1060,x
         lda #$00
         sta f1075,x
         beq i1356
i132b:    iny
         lda (pfe),y
         sta f10b1,x
         iny
         lda (pfe),y
         sta f10b4,x
         iny
         lda (pfe),y
         clc
         adc f1081,x
         sta f1078,x
         iny
         lda (pfe),y
         adc f1081,x
         sta f10b7,x
i134a:    lda f1069,x
         sta f1075,x
         lda f1063,x
         sta a1060,x
i1356:    iny
         lda (pfe),y
         cmp #$ff
         bne i136c
         lda f1090,x
         bne i1367
         inc f1087,x
         bne i136a
i1367:    dec f1090,x
i136a:    ldy #$00
i136c:    tya
         sta f1084,x
         lsr f1099,x
         asl f1099,x
         lda f1099,x
         ldy f18c9,x
         sta fd404,y
         ldy f1075,x
         lda f1c1e,y
         sta afe
         lda f1c1d,y
         sta f10a2,x
         and #$08
         beq i13a4
         lda f1078,x
         sec
         sbc f1081,x
         sta f1078,x
         lda f10b7,x
         sbc f1081,x
         sta f10b7,x
i13a4:    lda f10da,x
         bmi i13c1
         lda f10a2,x
         and #$01
         bne i13b3
         lda f1c16,y
i13b3:    sta f1099,x
         lda f1c1c,y
         sta f10c6,x
         and #$0f
         sta f10ca,x
i13c1:    lda f106f,x
         bne i13c9
         lda f1c18,y
i13c9:    sta f1093,x
         lda f1072,x
         bne i13d4
         lda f1c19,y
i13d4:    sta f1096,x
         ldy afe
         beq i13fc
         lda a10dd
         bmi i13fc
         lda f1d5c,y
         sta a10c9
         lda f1d5d,y
         sta a10cd
         lda f1d5e,y
         clc
         adc f18cc,x
         sta a105d
         lda f1d5f,y
         sta a105e
i13fc:    jsr i162a
         jmp i1559
i1402:    lda f10a2,x
         and #$04
         beq i1418
         lda f1066,x
         cmp #$00
         bcc i1418
         lda f10ae,x
         beq i1418
         dec f10ae,x
i1418:    lda f10a2,x
         and #$02
         beq i1446
         jsr i162a
         lda f1066,x
         cmp #$00
         bcc i1446
         cmp #$20
         bcs i1446
         lsr
         bcc i1475
         rol
         sec
         sbc #$00
         lsr
         sta afe
         inc afe
         lda f10ae,x
         sec
         sbc afe
         bcc i1446
         sta f10ae,x
         bcs i1475
i1446:    ldy f10b4,x
         beq i1459
         lda f1066,x
         cmp f10b1,x
         bcc i1459
         jsr i1691
         jmp i1475
i1459:    ldy f1075,x
         lda f1c1f,y
         beq i1475
         lsr
         tay
         lda f1066,x
         lsr
         bne i146c
         sta f10c3,x
i146c:    rol
         cmp f1d42,y
         bcc i1475
         jsr i16f6
i1475:    ldy f1075,x
         lda f1c20,y
         beq i148a
         tay
         lda f1066,x
         lsr
         bne i1487
         jsr i17b8
i1487:    jsr i17cc
i148a:    ldy f1075,x
         lda f1c1e,y
         beq i14a6
         tay
         lda f1066,x
         lsr
         bne i149e
         ldx #$03
         jsr i17b8
i149e:    ldx #$03
         jsr i17cc
         ldx a1053
i14a6:    ldy f10a5,x
         beq i14b5
         lda f10a2,x
         and #$10
         bne i14b5
         jsr i162f
i14b5:    lda f10a2,x
         bpl i14c9
         lda f1066,x
         lsr
         bne i14c6
         sta f109c,x
         sta f109f,x
i14c6:    jsr i15c8
i14c9:    lda f10a2,x
         and #$20
         beq i150e
         lda f1066,x
         cmp #$03
         bcc i150e
         lda a1056
         sta afe
         lda a1060,x
         sta aff
         ldy a1057
         dey
         bpl i14ec
         ldy a1059
         bne i14f9
i14ec:    dec afe
         bpl i14f9
         lda a1058
         sta afe
         dec aff
         beq i1509
i14f9:    dey
         bpl i1501
         ldy a1059
         bne i150e
i1501:    dec afe
         bpl i150e
         dec aff
         bne i150e
i1509:    lda #$00
         sta f1096,x
i150e:    ldy f1075,x
         lda f1066,x
         cmp #$02
         bcs i152e
         lsr
         bne i154e
         lda f10a2,x
         and #$40
         beq i154e
         ldy f18c9,x
         lda #$81
         sta f1099,x
         lda #$f9
         bne i1571
i152e:    lda f1066,x
         cmp f1c1a,y
         bcc i154e
         lda f1c1b,y
         beq i154d
         cmp a1060,x
         bcc i154e
         lda f10a2,x
         bpl i154d
         lsr f1099,x
         asl f1099,x
         bcc i1559
i154d:    iny
i154e:    lda f10a2,x
         bmi i1559
         lda f1c16,y
         sta f1099,x
i1559:    ldy f18c9,x
         lda f10ca,x
         sta fd403,y
         lda f10c6,x
         sta fd402,y
         lda f10ab,x
         sta fd400,y
         lda f10ae,x
i1571:    sta fd401,y
         lda f1096,x
         sta fd406,y
         lda f1093,x
         sta fd405,y
         lda f10da,x
         beq i158d
         bmi i1593
         lsr f1099,x
         asl f1099,x
i158d:    lda f1099,x
         sta fd404,y
i1593:    inc f1066,x
         bne i159b
         dec f1066,x
i159b:    dex
         bmi i15a1
         jmp i1188
i15a1:    lda a10c9
         sta ad415
         lsr
         lsr
         lsr
         sta afe
         lda a10cd
         lsr
         ror
         ror
         ror
         ora afe
         sta ad416
         lda a105d
         sta ad417
         lda a105f
         ora a105e
         sta ad418
         rts
i15c8:    ldy f1075,x
         lda f1c17,y
         sta a1054
         tay
         lda f1ad6,y
         sta afe
         lda f1ae8,y
         sta aff
         ldy f109c,x
         lda (pfe),y
         cmp #$fe
         beq i15f5
         bcc i15ed
         iny
         lda (pfe),y
         tay
         lda (pfe),y
i15ed:    sta f1099,x
         iny
         tya
         sta f109c,x
i15f5:    ldy a1054
         lda f1afa,y
         sta afe
         lda f1b0c,y
         sta aff
         ldy f109f,x
         lda (pfe),y
         cmp #$fd
         bcc i161b
         beq i1627
         cmp #$fe
         beq i1626
         iny
         lda (pfe),y
         tay
         lda (pfe),y
         cmp #$fd
         beq i1627
i161b:    sta f10ae,x
         sta f10ab,x
         iny
         tya
         sta f109f,x
i1626:    rts
i1627:    inc f109f,x
i162a:    ldy f1078,x
         bpl i1657
i162f:    lda f19a5,y
         sta afe
         lda f19b8,y
         sta aff
         ldy f10a8,x
         iny
         lda (pfe),y
         bpl i164c
         cmp #$81
         beq i1648
         bcs i164c
         rts
i1648:    iny
         lda (pfe),y
         tay
i164c:    tya
         sta f10a8,x
         lda (pfe),y
         clc
         adc f1078,x
         tay
i1657:    lda f18e6,y
         sta f10ab,x
         sec
         sbc f18e5,y
         sta afe
         lda f1946,y
         sta f10ae,x
         sbc f1945,y
         ldy f107b,x
         beq i1690
         lsr
         ror afe
         lsr
         ror afe
         lsr
         sta aff
         ror afe
i167c:    lda f10ab,x
         sec
         sbc afe
         sta f10ab,x
         lda f10ae,x
         sbc aff
         sta f10ae,x
         dey
         bne i167c
i1690:    rts
i1691:    sty afe
         lda #$00
         asl afe
         rol
         asl afe
         rol
         sta aff
         ldy f10b7,x
         tya
         cmp f1078,x
         bcs i16d5
         lda f10ab,x
         sec
         sbc afe
         sta f10ab,x
         lda f10ae,x
         sbc aff
         sta f10ae,x
         lda f10ab,x
         sec
         sbc f18e6,y
         lda f10ae,x
         sbc f1946,y
         bcs i16f5
i16c6:    lda #$00
         sta f10b4,x
         sta f10c3,x
         tya
         sta f1078,x
         jmp i1657
i16d5:    lda f10ab,x
         clc
         adc afe
         sta f10ab,x
         lda f10ae,x
         adc aff
         sta f10ae,x
         lda f18e6,y
         sec
         sbc f10ab,x
         lda f1946,y
         sbc f10ae,x
         bcc i16c6
i16f5:    rts
i16f6:    lda f10c3,x
         bne i1739
         sta f10ba,x
         inc f10c3,x
         lda f1d47,y
         sta afe
         lda f1078,x
         clc
         adc f1d46,y
         tay
         sta aff
         lda f18e6,y
         sec
         ldy f1078,x
         sbc f18e6,y
         sta f10bd,x
         ldy aff
         lda f1946,y
         ldy f1078,x
         sbc f1946,y
         sta f10c0,x
         ldy afe
         beq i1738
i172f:    lsr f10c0,x
         ror f10bd,x
         dey
         bne i172f
i1738:    rts
i1739:    lda f1066,x
         cmp f1d43,y
         bcc i1758
         cmp f1d49,y
         bcs i1758
         lda f10bd,x
         clc
         adc f1d48,y
         sta f10bd,x
         lda f10c0,x
         adc #$00
         sta f10c0,x
i1758:    sty a1054
         jsr i162a
         ldy a1054
         lda f1d44,y
         sta afe
         lda f1d45,y
         sta aff
i176b:    ldy f10ba,x
         lda (pfe),y
         beq i17b4
         tay
         bpl i1786
         cmp #$81
         bne i179e
         inc f10ba,x
         ldy f10ba,x
         lda (pfe),y
         sta f10ba,x
         bpl i176b
i1786:    lda f10ab,x
         clc
         adc f10bd,x
         sta f10ab,x
         lda f10ae,x
         adc f10c0,x
         sta f10ae,x
         dey
         bne i1786
         beq i17b4
i179e:    lda f10ab,x
         sec
         sbc f10bd,x
         sta f10ab,x
         lda f10ae,x
         sbc f10c0,x
         sta f10ae,x
         iny
         bne i179e
i17b4:    inc f10ba,x
         rts
i17b8:    lda f10da,x
         bmi i17cb
         sta f10d2,x
         sta f10d6,x
         lda f1d60,y
         and #$04
         sta f10ce,x
i17cb:    rts
i17cc:    lda f1d63,y
         beq i1844
         sta aff
         lda f1d62,y
         sta afe
         sty a1054
         ldy f10d2,x
         lda f10d6,x
         bne i17fd
         lda (pfe),y
         bpl i1832
         cmp #$fe
         bcc i17f5
         beq i1841
         iny
         lda (pfe),y
         tay
         lda (pfe),y
         bpl i1832
i17f5:    and #$7f
         sta f10d6,x
         jsr i183b
i17fd:    dec f10d6,x
         bne i1805
         inc f10d2,x
i1805:    lda f10ce,x
         bmi i1882
         bne i181f
         lda (pfe),y
         clc
         adc f10c6,x
         sta f10c6,x
         ldy a1054
         bcc i1861
         inc f10ca,x
         bcs i1861
i181f:    lda f10c6,x
         sec
         sbc (pfe),y
         sta f10c6,x
         ldy a1054
         bcs i1899
         dec f10ca,x
         bcc i1899
i1832:    sta f10ca,x
         iny
         lda (pfe),y
         sta f10c6,x
i183b:    iny
         tya
         sta f10d2,x
         rts
i1841:    ldy a1054
i1844:    lda f10ce,x
         bmi i1882
         bne i1883
         lda f10c6,x
         clc
         adc f1d6a,y
         sta f10c6,x
         lda f10ca,x
         adc f1d6b,y
         sta f10ca,x
         lda f10c6,x
i1861:    sec
         sbc f1d66,y
         lda f10ca,x
         sbc f1d67,y
         bmi i1882
         lda f1d61,y
         lsr
         bcs i18c3
         lsr
         bcc i18bb
         lda f1d64,y
         sta f10c6,x
         lda f1d65,y
         sta f10ca,x
i1882:    rts
i1883:    lda f10c6,x
         sec
         sbc f1d68,y
         sta f10c6,x
         lda f10ca,x
         sbc f1d69,y
         sta f10ca,x
         lda f10c6,x
i1899:    sec
         sbc f1d64,y
         lda f10ca,x
         sbc f1d65,y
         bpl i1882
         lda f1d60,y
         lsr
         bcs i18c3
         lsr
         bcc i18bf
         lda f1d66,y
         sta f10c6,x
         lda f1d67,y
         sta f10ca,x
         rts
i18bb:    lda #$01
         bne i18c5
i18bf:    lda #$00
         beq i18c5
i18c3:    lda #$ff
i18c5:    sta f10ce,x
         rts
//---------------------------------------
f18c9:    .byte $00,$07,$0e
f18cc:    .byte $01,$02,$04
f18cf:    .byte $00,$0b,$16,$21
         .byte $2c,$37,$42,$4d
         .byte $58,$63,$6e,$79
         .byte $84,$8f,$9a,$a5
         .byte $b0,$bb,$c6,$d1
         .byte $dc,$e7
f18e5:    .byte $f2
f18e6:    .byte $0c,$1c,$2d,$3e
         .byte $51,$66,$7b,$91
         .byte $a9,$c3,$dd,$fa
         .byte $18,$38,$5a,$7d
         .byte $a3,$cc,$f6,$23
         .byte $53,$86,$bb,$f4
         .byte $30,$70,$b4,$fb
         .byte $47,$98,$ed,$47
         .byte $b0,$0c,$77,$e9
         .byte $61,$e1,$68,$f7
         .byte $8f,$30,$da,$8f
         .byte $4e,$18,$ef,$d2
         .byte $c3,$c3,$d1,$ef
         .byte $1f,$60,$b5,$1e
         .byte $9c,$31,$df,$a5
         .byte $87,$86,$a2,$df
         .byte $3e,$c1,$6b,$3c
         .byte $39,$63,$be,$4b
         .byte $0f,$0c,$45,$bf
         .byte $7d,$83,$d6,$79
         .byte $73,$c7,$7c,$97
         .byte $1e,$18,$8b,$7e
         .byte $fa,$06,$ac,$f3
         .byte $e6,$8f,$f8
f1945:    .byte $2e
f1946:    .byte $01,$01,$01,$01
         .byte $01,$01,$01,$01
         .byte $01,$01,$01,$01
         .byte $02,$02,$02,$02
         .byte $02,$02,$02,$03
         .byte $03,$03,$03,$03
         .byte $04,$04,$04,$04
         .byte $05,$05,$05,$06
         .byte $06,$07,$07,$07
         .byte $08,$08,$09,$09
         .byte $0a,$0b,$0b,$0c
         .byte $0d,$0e,$0e,$0f
         .byte $10,$11,$12,$13
         .byte $15,$16,$17,$19
         .byte $1a,$1c,$1d,$1f
         .byte $21,$23,$25,$27
         .byte $2a,$2c,$2f,$32
         .byte $35,$38,$3b,$3f
         .byte $43,$47,$4b,$4f
         .byte $54,$59,$5e,$64
         .byte $6a,$70,$77,$7e
         .byte $86,$8e,$96,$9f
         .byte $a8,$b3,$bd,$c8
         .byte $d4,$e1,$ee,$fd
//---------------------------------------
//CHORD POINTERS
//---------------------------------------
.label f19a5    = *-1
         .byte <c1,<c2,<c3
         .byte <c4,<c5,<c6,<c7
         .byte <c8,<c9,<c10,<c11
         .byte <c12,<c13,<c14,<c15
         .byte <c16,<c17,<c18,<c19
.label f19b8    = *-1
         .byte >c1,>c2,>c3
         .byte >c4,>c5,>c6,>c7
         .byte >c8,>c9,>c10,>c11
         .byte >c12,>c13,>c14,>c15
         .byte >c16,>c17,>c18,>c19
//---------------------------------------
//CHORDS
//---------------------------------------
c1:       .byte $00,$00,$04,$04
         .byte $07,$07,$00,$00
         .byte $04,$04,$07,$07
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

c2:       .byte $00,$00,$05,$05
         .byte $07,$07,$00,$00
         .byte $05,$05,$07,$07
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

c3:       .byte $00,$02,$00,$02
         .byte $00,$02,$00,$02
         .byte $00,$02,$00,$02
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

c4:       .byte $00,$00,$00,$05
         .byte $05,$05,$09,$09
         .byte $09,$05,$05,$05
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

c5:       .byte $00,$00,$00,$05
         .byte $05,$05,$09,$09
         .byte $09,$0b,$0b,$0b
         .byte $09,$09,$09,$05
         .byte $05,$05,$81,$00

c6:       .byte $00,$00,$00,$03
         .byte $03,$03,$07,$07
         .byte $07,$09,$09,$09
         .byte $07,$07,$07,$03
         .byte $03,$03,$81,$00

c7:       .byte $00,$00,$00,$03
         .byte $03,$03,$08,$08
         .byte $08,$0a,$0a,$0a
         .byte $08,$08,$08,$03
         .byte $03,$03,$81,$00

c8:       .byte $00,$05,$09
         .byte $81,$00,$00

c9:       .byte $00,$03,$08
         .byte $81,$00,$00

c10:      .byte $00,$05,$0a
         .byte $81,$00,$00

c11:      .byte $00,$03,$07
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00

c12:      .byte $00,$00
         .byte $05,$05,$09,$09
         .byte $81,$00,$00,$00

c13:      .byte $00,$04,$09
         .byte $81,$00,$00,$00
         .byte $00,$00,$00

c14:      .byte $00,$00
         .byte $05,$05,$09,$09
         .byte $05,$05,$81,$00

c15:      .byte $00,$00,$04,$04
         .byte $07,$07,$04,$04
         .byte $81,$00

c16:      .byte $00,$00
         .byte $05,$05,$08,$08
         .byte $05,$05,$81,$00

c17:      .byte $00,$00,$03,$03
         .byte $07,$07,$03,$03
         .byte $81,$00

c18:      .byte $18,$15
         .byte $10,$0c,$09,$04
         .byte $00,$04,$09,$0c
         .byte $10,$15,$81,$00

c19:      .byte $06,$0a,$0e,$0c
         .byte $0a,$07,$05,$04
         .byte $03,$03,$02,$02
         .byte $02,$01,$08,$09
         .byte $07,$05,$03,$02
         .byte $01,$80
//---------------------------------------
//EFFECTEN POINTERS OFZO ?
//---------------------------------------
f1ad6:    .byte <i00,<i01,<i02,<i03
         .byte <i04,<i05,<i06,<i07
         .byte <i08,<i09,<i0a,<i0b
         .byte <i0c,<i0d,<i0e,<i0f
         .byte <i10,<i11
f1ae8:    .byte >i00,>i01,>i02,>i03
         .byte >i04,>i05,>i06,>i07
         .byte >i08,>i09,>i0a,>i0b
         .byte >i0c,>i0d,>i0e,>i0f
         .byte >i10,>i11

f1afa:    .byte <k00,<k01,<k02,<k03
         .byte <k04,<k05,<k06,<k07
         .byte <k08,<k09,<k0a,<k0b
         .byte <k0c,<k0d,<k0e,<k0f
         .byte <k10,<k11
f1b0c:    .byte >k00,>k01,>k02,>k03
         .byte >k04,>k05,>k06,>k07
         .byte >k08,>k09,>k0a,>k0b
         .byte >k0c,>k0d,>k0e,>k0f
         .byte >k10,>k11
//---------------------------------------
//EFFECTEN ?
//---------------------------------------
i00:      .byte $81,$00
         .byte $fe

k00:      .byte $f4,$fe

i01:      .byte $81,$10,$fe

k01:      .byte $32,$0a
         .byte $09,$08,$07,$06
         .byte $05,$04,$05,$04
         .byte $03,$fe

i02:      .byte $81,$10,$fe

k02:      .byte $32,$27,$23
         .byte $21,$1f,$1e,$1f
         .byte $21,$23,$ff

i03:      .byte $01
         .byte $81,$10,$10,$80
         .byte $fe

k03:      .byte $f2,$27,$1a
         .byte $32,$fe

i04:      .byte $11,$11
         .byte $11,$11,$10,$fe

k04:      .byte $32,$27,$21,$1d
         .byte $1a,$13,$10,$08
         .byte $04,$02,$fe

i05:      .byte $11
         .byte $10,$fe

k05:      .byte $1a,$13
         .byte $10,$0d,$0b,$09
         .byte $07,$05,$04,$03
         .byte $02,$01,$00,$fe

i06:      .byte $81,$11,$40,$80
         .byte $10,$fe

k06:      .byte $3e,$29
         .byte $2d,$3e,$0d,$fe

i07:      .byte $81,$11,$40,$80
         .byte $fe

k07:      .byte $f0,$2a,$24
         .byte $32,$fe

i08:      .byte $81,$41
         .byte $80,$80,$40,$fe

k08:      .byte $35,$12,$35,$35
         .byte $0e,$0d,$0c,$0b
         .byte $0a,$09,$08,$07
         .byte $06,$05,$04,$03
         .byte $01,$fe

i09:      .byte $81,$11
         .byte $80,$10,$10,$80
         .byte $fe

k09:      .byte $f0,$1e,$f0
         .byte $1c,$1b,$f0,$fe

i0a:      .byte $81,$10,$80,$ff

k0a:      .byte $01,$32,$13,$8d
         .byte $ff

i0b:      .byte $01,$81,$41
         .byte $40,$80,$80,$ff

k0b:      .byte $01,$32,$0f,$0d
         .byte $32,$32,$ff

i0c:      .byte $01
         .byte $81,$41,$40,$fe

k0c:      .byte $3d,$09,$07,$05
         .byte $03,$fe

i0d:      .byte $11,$10
         .byte $fe

k0d:      .byte $79,$7e,$85
         .byte $8e,$99,$a5,$b3
         .byte $00,$fe

i0e:      .byte $11,$10
         .byte $fe

k0e:      .byte $79,$7e,$85
         .byte $8e,$99,$a5,$b3
         .byte $ab,$a3,$9c,$95
         .byte $8f,$89,$83,$7d
         .byte $78,$73,$6e,$69
         .byte $64,$5f,$5a,$56
         .byte $52,$4e,$4a,$46
         .byte $42,$3e,$3b,$38
         .byte $35,$32,$2f,$2c
         .byte $fe

i0f:      .byte $81,$41,$41
         .byte $fe

k0f:      .byte $32,$0a,$07
         .byte $fd,$fe

i10:      .byte $81,$81
         .byte $80,$40,$fe

k10:      .byte $3d
         .byte $3d,$3d,$fd,$fe

i11:      .byte $11,$fe

k11:      .byte $6d,$60
         .byte $ff

         .byte $00
//---------------------------------------
//SOUNDS
//---------------------------------------
f1c16:    .byte $00   //golfvorm1
f1c17:    .byte $00   //golfvorm2
f1c18:    .byte $00   //attackwave
f1c19:    .byte $00   //sustain
f1c1a:    .byte $00   //release1
f1c1b:    .byte $00   //release2
f1c1c:    .byte $00   //knerpen
f1c1d:    .byte $00   //tiktak
f1c1e:    .byte $00   //filter 20/40
f1c1f:    .byte $00   //vibration
f1c20:    .byte $00   //wavevorm
//---------------------------------------
s1:       .byte $11,$01,$07
         .byte $07,$00,$00,$08
         .byte $80,$00,$00,$00
//---------------------------------------
s2:       .byte $11,$09,$00,$a5
         .byte $00,$00,$08,$80
         .byte $00,$00,$00
//---------------------------------------
s3:       .byte $41
         .byte $40,$00,$85,$00
         .byte $01,$09,$30,$00
         .byte $00,$10
//---------------------------------------
s4:       .byte $41,$40
         .byte $00,$89,$00,$01
         .byte $09,$30,$00,$10
         .byte $10
//---------------------------------------
s5:       .byte $31,$20,$00
         .byte $89,$00,$00,$0d
         .byte $20,$00,$00,$00
//---------------------------------------
s6:       .byte $21,$20,$00,$89
         .byte $00,$01,$0d,$20
         .byte $00,$00,$00
//---------------------------------------
s7:       .byte $11
         .byte $06,$00,$c6,$00
         .byte $00,$08,$b8,$00
         .byte $00,$00
//---------------------------------------
s8:       .byte $81,$09
         .byte $00,$f8,$00,$00
         .byte $00,$b8,$00,$00
         .byte $00
//---------------------------------------
s9:       .byte $11,$08,$08
         .byte $08,$00,$00,$08
         .byte $80,$20,$00,$00
//---------------------------------------
sa:       .byte $41,$43,$00,$5c
         .byte $00,$0c,$07,$20
         .byte $00,$30,$80
//---------------------------------------
sb:       .byte $43
         .byte $42,$00,$b9,$00
         .byte $00,$08,$24,$00
         .byte $00,$30
//---------------------------------------
sc:       .byte $11,$10
         .byte $00,$e8,$04,$00
         .byte $00,$64,$00,$00
         .byte $00
//---------------------------------------
sd:       .byte $00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//---------------------------------------
se:       .byte $11,$0d,$00,$e9
         .byte $00,$00,$00,$b8
         .byte $90,$00,$00
//---------------------------------------
sf:       .byte $11
         .byte $0e,$00,$ea,$00
         .byte $00,$00,$b8,$90
         .byte $00

i1cc5:    .byte $00

s10:      .byte $41,$40,$00
         .byte $a7,$00,$01,$02
         .byte $00,$40,$10,$30

s11:      .byte $41,$40,$00,$d9
         .byte $00,$01,$0e,$70
         .byte $40,$10,$20

s12:      .byte $41
         .byte $40,$00,$a7,$00
         .byte $01,$02,$60,$40
         .byte $20,$30

s13:      .byte $11,$40
         .byte $00,$89,$00,$00
         .byte $0b,$00,$00,$00
         .byte $30

s14:      .byte $41,$40,$00
         .byte $5c,$00,$00,$04
         .byte $20,$00,$00,$60

s15:      .byte $41,$40,$00,$3f
         .byte $00,$01,$0e,$00
         .byte $00,$00,$70

s16:      .byte $41
         .byte $40,$00,$5c,$00
         .byte $01,$07,$20,$00
         .byte $30,$80

s17:      .byte $41,$42
         .byte $00,$ac,$00,$02
         .byte $08,$20,$00,$10
         .byte $70

s18:      .byte $11,$10,$00
         .byte $e9,$00,$00,$00
         .byte $22,$00,$00,$00

s19:      .byte $17,$16,$00,$ea
         .byte $00,$00,$00,$20
         .byte $00,$00,$00

s1a:      .byte $41
         .byte $40,$00,$e8,$06
         .byte $00,$07,$60,$00
         .byte $00,$80

s1b:      .byte $11,$10
         .byte $00

f1d42:    .byte $f6
f1d43:    .byte $00
f1d44:    .byte $00
f1d45:    .byte $00
f1d46:    .byte $60
f1d47:    .byte $00
f1d48:    .byte $00
f1d49:    .byte $00
//---------------------------------------
         .byte $0a,$f0,$62,$1d,$01
         .byte $01,$00,$e0,$05,$f0,$62
         .byte $1d,$02,$01,$00,$e0,$12
         .byte $f0

f1d5c:    .byte $62
f1d5d:    .byte $1d
f1d5e:    .byte $01
f1d5f:    .byte $02
f1d60:    .byte $00
f1d61:    .byte $e0
f1d62:    .byte $00
f1d63:    .byte $01
f1d64:    .byte $02
f1d65:    .byte $01
f1d66:    .byte $00
f1d67:    .byte $ff
f1d68:    .byte $fe
f1d69:    .byte $ff
f1d6a:    .byte $81
f1d6b:    .byte $00,$00,$00,$00
         .byte $00,$00,$00,$fc
         .byte $1d,$30,$04,$40
         .byte $0c,$42,$00,$42
         .byte $00,$40,$05,$f0
         .byte $10,$04,$01,$00
         .byte $00,$c0,$01,$40
         .byte $06,$2c,$00,$05
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$30,$03,$40
         .byte $0b,$21
         .byte $00,$35,$00,$40
         .byte $07,$f0,$10,$04
         .byte $01,$12,$1e,$30
         .byte $00,$50,$04,$05
         .byte $00,$05,$00,$00
         .byte $00,$00
//---------------------------------------
i1daf:    .byte $00,$04,$00,$05
         .byte $1e,$f0,$05,$f0
//---------------------------------------
i1db7:    .byte $09,$30,$00,$30,$00
i1dbc:    .byte $00,$00,$00
i1dbf:    .byte $00,$00,$00,$00,$00,$40
//---------------------------------------
         .byte $04,$00,$08,$32
         .byte $00,$32,$00,$00
         .byte $00,$00,$00,$04
         .byte $01,$00,$00,$01
         .byte $03,$00,$0c,$12
         .byte $00,$52,$00,$00
         .byte $00,$00,$00,$04
         .byte $00,$00,$00,$50
         .byte $06,$20,$0d,$32
         .byte $00,$32,$00,$f0
         .byte $07,$f0,$10,$00
         .byte $00,$00,$00,$00
         .byte $01,$ff

         .byte $07
         .byte $00,$00,$00,$00
         .byte $08,$00,$08,$00
         .byte $08,$00,$05,$00
         .byte $fe

         .byte $0a,$80,$0a,$00
         .byte $09,$d0,$09,$a0
         .byte $09,$70,$09,$70
         .byte $fe

         .byte $05,$40,$03,$00
         .byte $02,$00,$01,$40
         .byte $00,$c0,$00,$80
         .byte $fe

//---------------------------------------
f1e1f:    .byte $02           //speed
f1e20:    .byte $00           //speed fine
f1e21:    .byte $00,<tr1,>tr1
         .byte $00,<tr2,>tr2
         .byte $00,<tr3,>tr3
//---------------------------------------
//TRACKS
//$8x : verhoog x noten
//$ex : herhaal volgende block x maal
//$fe : stop song
//$ff,$xx : begin overnieuw op plaats xx
//---------------------------------------
tr1:    // .byte $8c,$00,$ff,$00
         .byte $8c,$01,$01,$02,$02
         .byte $ff,$00

tr2:    // .byte $8c,$00,$ff,$00
         .byte $8c
         .byte $03,$03,$03,$03
         .byte $03,$87,$03
         .byte $8c
         .byte $03,$03,$03,$03
         .byte $03,$87,$03
         .byte $8c
         .byte $03,$03,$03,$03
         .byte $03,$87,$03,$8c,$03
         .byte $8c
         .byte $03,$03,$03,$03
         .byte $03,$87,$03,$8c,$03
         .byte $ff,$00

tr3:    // .byte $8c,$00,$ff,$00
         .byte $8c,$04,$04,$05,$05
         .byte $ff,$00
//---------------------------------------
//BLOCK POINTERS
//---------------------------------------
f1e7e:    .byte <b0,<b1,<b2,<b3
         .byte <b4,<b5,<b6,<b7
         .byte <b8,<b9,<b10,<b11
         .byte <b12,<b13,<b14
f1e8d:    .byte >b0,>b1,>b2,>b3
         .byte >b4,>b5,>b6,>b7
         .byte >b8,>b9,>b10,>b11
         .byte >b12,>b13,>b14
//---------------------------------------
//BLOCKS
//---------------------------------------
b0:       .byte $70,$70,$ff
//---------------------------------------
b1:       .byte $84,$c5
         .byte $34,$34,$34
         .byte $82,$32,$30,$8c,$37
         .byte $82,$37,$35
         .byte $84,$34,$34,$34
         .byte $82,$32,$30,$8c,$37
         .byte $82,$37,$35
         .byte $84,$34
         .byte $82,$35,$37
         .byte $84,$35,$34,$8c,$32
         .byte $84,$30
         .byte $ff

//---------------------------------------
b2:       .byte $84,$c3
         .byte $84,$37,$82,$35,$34
         .byte $84,$35,$37
         .byte $39,$88,$37
         .byte $84,$34
         .byte $84,$37,$82,$35,$34
         .byte $84,$35,$37
         .byte $39,$88,$37
         .byte $84,$34
         .byte $84,$39,$88,$37
         .byte $84,$35
         .byte $84,$34
         .byte $82,$32,$30
         .byte $81,$c4
         .byte $34,$32
         .byte $34,$32
         .byte $34,$32
         .byte $82,$c3,$30,$8c,$30
         .byte $84,$30
         .byte $ff

//---------------------------------------
b3:       .byte $84,$c1,$00
         .byte $82,$cc,$e1,$30
         .byte $82,$e2,$30
         .byte $84,$e1,$30
         .byte $82,$c2,$30
         .byte $82,$c2,$30
         .byte $ff
//---------------------------------------
b4:       .byte $86,$d1
         .byte $0c,$82,$18,$84,$c9,$00
         .byte $8a,$d1,$0c
         .byte $82,$18
         .byte $84,$c9,$00
         .byte $84,$d1,$18,$86,$0c
         .byte $82,$18,$84,$c9,$00
         .byte $84,$d1,$0c
         .byte $82,$13,$13+12
         .byte $82,$18,$18+12
         .byte $84,$c9,$00
         .byte $84,$d1,$0c
         .byte $86,$0c,$82,$18
         .byte $84,$c9,$00
         .byte $84,$d1,$09,$88,$07
         .byte $84,$c9,$00
         .byte $82,$d1,$0a,$0b

         .byte $ff
//---------------------------------------
b5:       .byte $82,$d1
         .byte $0c,$0c,$84,$0c
         .byte $84,$c9,$00
         .byte $84,$d1,$0c
         .byte $84,$11,$0c
         .byte $84,$c9,$00
         .byte $84,$d1,$0c

         .byte $82,$0c,$0c,$84,$0c
         .byte $84,$c9,$00
         .byte $84,$d1,$0c,$11,$0c
         .byte $84,$c9,$00
         .byte $84,$d1,$0c,$11,$0c
         .byte $84,$c9,$00
         .byte $84,$d1,$09,$07,$07
         .byte $84,$c9,$00
         .byte $84,$d1,$07
         .byte $82,$07,$07+12
         .byte $0c,$18
         .byte $84,$c9,$00
         .byte $84,$d1,$0c
         .byte $ff
//---------------------------------------
b6:       .byte $84,$c1,$00,$d3,$ec,$22
         .byte $84,$c1,$00,$d3,$ec,$22
         .byte $84,$c1,$00,$d3,$ec,$22
         .byte $84,$c1,$00,$d3,$ec,$22

         .byte $84,$c1,$00,$d3,$ec,$24
         .byte $84,$c1,$00,$d3,$ec,$24
         .byte $84,$c1,$00,$d3,$ec,$24
         .byte $84,$c1,$00,$d3,$ec,$24
         .byte $ff
//---------------------------------------
b7:       .byte $84,$c3,$3a,$3a,$3a,$3a
         .byte $86,$c4,$3a,$84,$c3,$3a
         .byte $82,$3a,$3c,$37,$84,$39
         .byte $35,$37,$82,$39,$86,$c4
         .byte $3a,$84,$c3,$39,$37,$82
         .byte $35,$84,$37,$82,$30,$86
         .byte $c4,$33,$76
         .byte $84,$c5,$e8,$30,$e9,$2d
         .byte $e8,$30,$30,$86,$c6,$ea
         .byte $30,$e8,$30,$84,$c5,$eb
         .byte $30

         .byte $82,$c3,$3a,$3c,$84,$3f
         .byte $3a,$82,$37,$86,$c4,$3a
         .byte $84,$c3,$3c,$82,$33,$30
         .byte $33,$34,$84,$35,$3a,$82
         .byte $35,$36,$37,$86,$c4,$3a
         .byte $84,$c3,$39,$82,$3a,$86
         .byte $c4,$3c,$84,$c5,$e8,$2e
         .byte $2e,$2e,$2e,$86,$c6,$2e
         .byte $8a,$c5,$2e,$84,$30,$e9
         .byte $2d,$e8,$30,$30,$86,$c6
         .byte $ea,$30,$c5,$e8,$30,$84
         .byte $ed,$33,$ff
//---------------------------------------
b8:
b9:
b10:
b11:
b12:
b13:
b14:
         .byte $ff
//---------------------------------------

