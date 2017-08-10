.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)

.var start    = $1000

         .pc= $4000
player:
         jsr $ff81
         lda #$0f
         sta 646
         ldx #$00
kop:      lda header,x
         beq out
         jsr $ffd2
         inx
         bne kop
out:      sei
         lda #23
         sta $d018
         ldy #$00
         sty $d020
         sty $d021
         jsr init
back2:    lda #$4c
back1:    cmp $d012
         bne back1
         ror $033e
         ror $033e
         lda #$0f
         sta $d020
         jsr play
         lda #$0b
         sta $d020
         lda $d012
         cmp max+1
         bmi max
         sta max+1
max:      lda #$00
time:     cmp $d012
         bne time
         lda #$00
         ror $033e
         ror $033e
         sta $d020
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
         lda start+[3*40]+30
         and #1
         sta $d800
         lda start+[3*40]+31
         and #1
         sta $d828
         lda start+[3*40]+32
         and #1
         sta $d850
         lda $dc01
         and #$04
         bne back2
         jmp $9000
//---------------------------------------
header:   .byte 13,13,13,13
         .text "Willy and Billy"
         .text " acting silly..."
         .byte 13,13
         .text "Composed by Mad B/"
         .text "Rhyme Design."
         .byte 0
//---------------------------------------
bar:      sta length
         lsr
         lsr
         sta comp+1
         lda #$a0
         ldy #$00
comp:     cpy #$00
         bpl balk
         sta ($02),y
         iny
         jmp comp
balk:     lda length
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
         .text " music composed"
         .text "by mad b/rhyme design"
         .text " player by falco "
         .text " paul/20cc        "

a1053:    .byte $00
a1054:    .byte $00
a1055:    .byte $00
a1056:    .byte $00
a1057:    .byte $00
a1058:    .byte $00
a1059:    .byte $00
a105a:    .byte $00
a105b:    .byte $00
a105c:    .byte $00
a105d:    .byte $00
a105e:    .byte $00
a105f:    .byte $00
a1060:    .byte $00
a1061:    .byte $00
a1062:    .byte $00
f1063:    .byte $00,$00,$00
f1066:    .byte $00,$00,$00
f1069:    .byte $00,$00,$00
f106c:    .byte $00,$00,$00
f106f:    .byte $00,$00,$00
f1072:    .byte $00,$00,$00
f1075:    .byte $00,$00,$00
f1078:    .byte $00,$00,$00
f107b:    .byte $00,$00,$00
f107e:    .byte $00,$00,$00
f1081:    .byte $00,$00,$00
f1084:    .byte $00,$00,$00
f1087:    .byte $00,$00,$00
f108a:    .byte $00,$00,$00
f108d:    .byte $00,$00,$00
f1090:    .byte $00,$00,$00
f1093:    .byte $00,$00,$00
f1096:    .byte $00,$00,$00
f1099:    .byte $00,$00,$00
f109c:    .byte $00,$00,$00
f109f:    .byte $00,$00,$00
f10a2:    .byte $00,$00,$00
f10a5:    .byte $00,$00,$00
f10a8:    .byte $00,$00,$00
f10ab:    .byte $00,$00,$00
f10ae:    .byte $00,$00,$00
f10b1:    .byte $00,$00,$00
f10b4:    .byte $00,$00,$00
f10b7:    .byte $00,$00,$00
f10ba:    .byte $00,$00,$00
f10bd:    .byte $00,$00,$00
f10c0:    .byte $00,$00,$00
f10c3:    .byte $00,$00,$00
f10c6:    .byte $00,$00,$00
a10c9:    .byte $00
f10ca:    .byte $00,$00,$00
a10cd:    .byte $00
f10ce:    .byte $00,$00,$00,$00
f10d2:    .byte $00,$00,$00,$00
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
//FREQUENCY TABLES
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
         .byte <e1,<e2,<e3
         .byte <e4,<e5,<e6,<e7
         .byte <e8,<e9,<ea,<eb
         .byte <ec,<ed,<ee,<ef
         .byte <f0,<f1,<f2,<f3
.label f19b8    = *-1
         .byte >e1,>e2,>e3
         .byte >e4,>e5,>e6,>e7
         .byte >e8,>e9,>ea,>eb
         .byte >ec,>ed,>ee,>ef
         .byte >f0,>f1,>f2,>f3
//---------------------------------------
//CHORDS
//---------------------------------------
e1:       .byte $00,$00,$04,$04
         .byte $07,$07,$00,$00
         .byte $04,$04,$07,$07
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

e2:       .byte $00,$00,$05,$05
         .byte $09,$09,$00,$00
         .byte $05,$05,$09,$09
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

e3:       .byte $00,$00,$05,$05
         .byte $08,$08,$00,$00
         .byte $05,$05,$08,$08
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

e4:       .byte $00,$00,$03,$03
         .byte $07,$07,$00,$00
         .byte $03,$03,$07,$07
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

e5:       .byte $00,$00,$05,$05
         .byte $0a,$0a,$00,$00
         .byte $05,$05,$0a,$0a
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

e6:       .byte $00,$00,$04,$04
         .byte $09,$09,$00,$00
         .byte $04,$04,$09,$09
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

e7:       .byte $00,$00,$00,$03
         .byte $03,$03,$08,$08
         .byte $08,$0a,$0a,$0a
         .byte $08,$08,$08,$03
         .byte $03,$03,$81,$00

e8:       .byte $00,$05,$09
         .byte $81,$00,$00

e9:       .byte $00,$03,$08
         .byte $81,$00,$00

ea:       .byte $00,$05,$0a
         .byte $81,$00,$00

eb:       .byte $00,$03,$07
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00

ec:       .byte $00,$00
         .byte $05,$05,$09,$09
         .byte $81,$00,$00,$00

ed:       .byte $00,$04,$09
         .byte $81,$00,$00,$00
         .byte $00,$00,$00

ee:       .byte $00,$00
         .byte $05,$05,$09,$09
         .byte $05,$05,$81,$00

ef:       .byte $00,$00,$04,$04
         .byte $07,$07,$04,$04
         .byte $81,$00

f0:       .byte $00,$00
         .byte $05,$05,$08,$08
         .byte $05,$05,$81,$00

f1:       .byte $00,$00,$03,$03
         .byte $07,$07,$03,$03
         .byte $81,$00

f2:       .byte $18,$15
         .byte $10,$0c,$09,$04
         .byte $00,$04,$09,$0c
         .byte $10,$15,$81,$00

f3:       .byte $06,$0a,$0e,$0c
         .byte $0a,$07,$05,$04
         .byte $03,$03,$02,$02
         .byte $02,$01,$08,$09
         .byte $07,$05,$03,$02
         .byte $01,$80
//---------------------------------------
//SPECIAL FX POINTERS
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
//SPECIAL FX
//(in 2nd byte of sound)
//
//i   : Waveform
//k   : Note
//$fe : Stop
//$ff : Repeat
//---------------------------------------
i00:      .byte $81,$00,$fe

k00:      .byte $f4,$fe

i01:      .byte $81,$10,$fe

k01:      .byte $32,$0a,$09,$08
         .byte $07,$06,$05,$04
         .byte $05,$04,$03,$fe

i02:      .byte $81,$10,$fe

k02:      .byte $32,$27,$23,$21
         .byte $1f,$1e,$1f,$21
         .byte $23,$ff

i03:      .byte $01,$81,$10,$10
         .byte $80,$fe

k03:      .byte $f2,$27,$1a,$32,$fe

i04:      .byte $11,$11,$11,$11
         .byte $10,$fe

k04:      .byte $32,$27,$21,$1d
         .byte $1a,$13,$10,$08
         .byte $04,$02,$fe

i05:      .byte $11,$10,$fe

k05:      .byte $1a,$13,$10,$0d
         .byte $0b,$09,$07,$05
         .byte $04,$03,$02,$01
         .byte $00,$fe

i06:      .byte $81,$11,$40,$80
         .byte $10,$fe

k06:      .byte $3e,$29,$2d,$3e
         .byte $0d,$fe

i07:      .byte $81,$11,$40,$80,$fe

k07:      .byte $f0,$2a,$24,$32,$fe

i08:      .byte $81,$41,$80,$80
         .byte $40,$fe

k08:      .byte $35,$12,$35,$35
         .byte $0e,$0d,$0c,$0b
         .byte $0a,$09,$08,$07
         .byte $06,$05,$04,$03
         .byte $02,$fe

i09:      .byte $81,$11,$80,$10
         .byte $10,$80,$fe

k09:      .byte $f0,$1e,$f0,$1c
         .byte $1b,$f0,$fe

i0a:      .byte $81,$10,$80,$ff

k0a:      .byte $01,$32,$13,$8d,$ff

i0b:      .byte $01,$81,$41,$40
         .byte $80,$80,$ff

k0b:      .byte $01,$32,$0f,$0d
         .byte $32,$32,$ff

i0c:      .byte $01,$81,$41,$40,$fe

k0c:      .byte $3d,$09,$07,$05,$03
         .byte $fe

i0d:      .byte $11,$10,$fe

k0d:      .byte $79,$7e,$85,$8e
         .byte $99,$a5,$b3,$00
         .byte $fe

i0e:      .byte $11,$10,$fe

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

i10:      .byte $81,$81,$80,$40,$fe

k10:      .byte $3d,$3d,$3d,$fd,$fe

i11:      .byte $11,$fe

k11:      .byte $6d,$60,$ff

         .byte $00
//---------------------------------------
//SOUNDS
//---------------------------------------
f1c16:                //golfvorm1
.label f1c17    = *+1       //golfvorm2 (fx)
.label f1c18    = *+2       //attackwave
.label f1c19    = *+3       //sustain
.label f1c1a    = *+4       //release1
.label f1c1b    = *+5       //release2
.label f1c1c    = *+6       //knerpen
.label f1c1d    = *+7       //tiktak
.label f1c1e    = *+8       //filter 20/40
.label f1c1f    = *+9       //vibration
.label f1c20    = *+10      //wavevorm
//---------------------------------------
c0:       .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00

c1:       .byte $11,$01,$07,$07
         .byte $00,$00,$08,$80
         .byte $00,$00,$00

c2:       .byte $11,$09,$00,$a5
         .byte $00,$00,$08,$80
         .byte $00,$00,$00

c3:       .byte $41,$40,$00,$65
         .byte $00,$02,$08,$30
         .byte $00,$12,$10

c4:       .byte $41,$40,$00,$89
         .byte $00,$01,$09,$30
         .byte $00,$10,$10

c5:       .byte $31,$20,$00,$89
         .byte $00,$00,$0d,$20
         .byte $00,$00,$00

c6:       .byte $21,$20,$00,$89
         .byte $00,$01,$0d,$20
         .byte $00,$00,$00

c7:       .byte $11,$06,$00,$c6
         .byte $00,$00,$08,$b8
         .byte $00,$00,$00

c8:       .byte $81,$09,$00,$f8
         .byte $00,$00,$00,$b8
         .byte $00,$00,$00

c9:       .byte $11,$08,$08,$08
         .byte $00,$00,$08,$80
         .byte $00,$00,$00

ca:       .byte $41,$43,$00,$5c
         .byte $00,$0c,$07,$20
         .byte $00,$30,$80

cb:       .byte $43,$42,$00,$b9
         .byte $00,$00,$08,$24
         .byte $00,$00,$30

cc:       .byte $11,$10,$00,$e8
         .byte $04,$00,$00,$64
         .byte $00,$00,$00

cd:       .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00

ce:       .byte $11,$0d,$00,$e9
         .byte $00,$00,$00,$b8
         .byte $00,$00,$00

cf:       .byte $11,$0e,$00,$ea
         .byte $00,$00,$00,$b8
         .byte $00,$00,$00

d0:       .byte $41,$40,$00
         .byte $a7,$00,$01,$02
         .byte $00,$40,$10,$30

d1:       .byte $41,$40,$00,$d9
         .byte $00,$01,$0e,$70
         .byte $40,$10,$20

d2:       .byte $41,$40,$00,$a7
         .byte $00,$01,$02,$60
         .byte $40,$20,$30

d3:       .byte $11,$40,$00,$89
         .byte $00,$00,$0b,$00
         .byte $00,$00,$30

d4:       .byte $41,$40,$00,$5c
         .byte $00,$00,$04,$20
         .byte $00,$00,$60

d5:       .byte $41,$40,$00,$3f
         .byte $00,$01,$0e,$00
         .byte $00,$00,$70

d6:       .byte $41,$40,$00,$5c
         .byte $00,$01,$07,$20
         .byte $00,$30,$80

d7:       .byte $41,$42,$00,$ac
         .byte $00,$02,$08,$20
         .byte $00,$10,$70

d8:       .byte $11,$10,$00,$e9
         .byte $00,$00,$00,$22
         .byte $00,$00,$00

d9:       .byte $17,$16,$00,$ea
         .byte $00,$00,$00,$20
         .byte $00,$00,$00

da:       .byte $41,$40,$00,$e8
         .byte $06,$00,$07,$60
         .byte $00,$00,$80

db:       .byte $11,$10,$00,$f6
         .byte $00,$00,$00,$60
         .byte $00,$00,$00
//---------------------------------------
.label f1d42    = *-8
.label f1d43    = *-7
.label f1d44    = *-6
.label f1d45    = *-5
.label f1d46    = *-4
.label f1d47    = *-3
.label f1d48    = *-2
.label f1d49    = *-1

         .byte $0a,$f0,$62,$1d
         .byte $01,$01,$00,$e0

         .byte $05,$f0,$62,$1d
         .byte $02,$01,$00,$e0

         .byte $12,$f0,$62,$1d
         .byte $01,$02,$00,$e0
//---------------------------------------

.label f1d5c    = *-6
.label f1d5d    = *-5
.label f1d5e    = *-4
.label f1d5f    = *-3
.label f1d60    = *-2
.label f1d61    = *-1

f1d62:
.label f1d63    = *+1
.label f1d64    = *+2
.label f1d65    = *+3
.label f1d66    = *+4
.label f1d67    = *+5
.label f1d68    = *+6
.label f1d69    = *+7
.label f1d6a    = *+8
.label f1d6b    = *+9

         .byte $00,$01,$02,$01
         .byte $00,$ff,$fe,$ff
         .byte $81,$00,$00,$00
         .byte $00,$00,$00,$00

         .byte <f1dfc,>f1dfc

         .byte $30,$04,$40,$0c
         .byte $42,$00,$42,$00
         .byte $40,$05,$f0,$10
         .byte $04,$01,$00,$00

         .byte $c0,$01

         .byte $40,$06,$2c,$00
         .byte $05,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$30,$03
         .byte $40,$0b,$21,$00
         .byte $35,$00,$40,$07
         .byte $f0,$10,$04,$01

         .byte <f1e12,>f1e12

         .byte $30,$00,$50,$04
         .byte $05,$00,$05,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$04,$00

         .byte <f1e05,>f1e05

         .byte $f0,$05,$f0,$09
         .byte $30,$00
         .byte $30,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00
         .byte $40,$04,$00,$08
         .byte $32,$00,$32,$00
         .byte $00,$00
         .byte $00,$00,$04,$01
         .byte $00,$00,$01,$03
         .byte $00,$0c
         .byte $12,$00,$52,$00
         .byte $00,$00,$00,$00
         .byte $04,$00
         .byte $00,$00,$50,$06
         .byte $20,$0d,$32,$00
         .byte $32,$00
         .byte $f0,$07,$f0,$10
         .byte $00,$00,$00,$00
         .byte $00,$01
         .byte $ff,$07
         .byte $00,$00,$00,$00

.label f1dfc    = *-2

         .byte $08,$00,$08,$00
         .byte $08,$00,$05,$00
         .byte $fe

.label f1e05    = *-2

         .byte $0a,$80,$0a,$00
         .byte $09,$d0,$09,$a0
         .byte $09,$70,$09,$70
         .byte $fe

.label f1e12    = *-2

         .byte $05,$40,$03,$00
         .byte $02,$00,$01,$40
         .byte $00,$c0,$00,$80
         .byte $fe

//---------------------------------------
//SPEED
//---------------------------------------
f1e1f:    .byte $02           //speed
f1e20:    .byte $00           //speed fine
//---------------------------------------
//TRACK POINTERS
//
//1e byte: $xx = verhoog track xx noten
//---------------------------------------
f1e21:    .byte $00,<tr1,>tr1    //track 1
         .byte $00,<tr2,>tr2    //track 2
         .byte $00,<tr3,>tr3    //track 3
//---------------------------------------
//TRACKS
//
//$8x : verhoog x noten
//$ex : herhaal volgende block x maal
//$fe : stop song
//$ff,$xx : begin overnieuw op plaats xx
//---------------------------------------
tr1:    // .byte $8c,$00,$ff,$00
         .byte $8c,$04,$04
         .byte $8c,$e3,$02
         .byte $8e,$e1,$02
         .byte $ff,$03

tr2:    // .byte $8c,$03,$ff,$00
         .byte $8c,$05,$05
         .byte $8c,$e3,$03
         .byte $8c,$e1,$07
         .byte $8e,$e1,$07
         .byte $ff,$03

tr3:    // .byte $8c,$00,$ff,$00
         .byte $80,$06,$06
         .byte $8c,$e1,$01
         .byte $8c,$e1,$08
         .byte $8e,$e1,$08
         .byte $ff,$03
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
b1:       .byte $84,$c0,$00
         .byte $84,$c5,$e2
         .byte $2b,$2b,$2b
         .byte $86,$e1,$2b,$e2,$2b
         .byte $88,$e3,$2d
         .byte $84,$e3,$2d,$2d,$2d
         .byte $86,$e4,$2d,$e3,$2d
         .byte $88,$e3,$2d
         .byte $84,$e3,$2d,$2d,$2d
         .byte $86,$e5,$2d,$e4,$2d
         .byte $88,$e3,$2d
         .byte $84,$e3,$2d,$e4,$2d
         .byte $e3,$2d
         .byte $86,$e1,$29,$e1,$2b
         .byte $84,$e2,$2b
         .byte $ff

//---------------------------------------
b2:       .byte $86,$d1
         .byte $0c,$82,$18
         .byte $88,$c0,$00
         .byte $82,$d1,$07,$13,$0c
         .byte $18
         .byte $84,$c0,$00
         .byte $84,$d1,$0d
         .byte $86,$0e,$82,$1a
         .byte $84,$c0,$00
         .byte $82,$d1,$0e,$1a
         .byte $84,$c0,$00
         .byte $84,$d1,$0e,$10,$11
         .byte $86,$0e,$86,$0c
         .byte $82,$09,$82,$0e
         .byte $84,$c0,$00
         .byte $84,$d1,$0c,$0d
         .byte $84,$0e
         .byte $86,$13,$11,$82,$10
         .byte $82,$0e
         .byte $84,$d1,$05,$11
         .byte $07,$13
         .byte $ff

//---------------------------------------
b3:       .byte $84,$c1,$00
         .byte $82,$c2,$00,$00
         .byte $84,$c9,$00
         .byte $82,$c1,$00
         .byte $84,$00
         .byte $82,$c2,$00
         .byte $84,$c1,$00
         .byte $84,$c9,$00
         .byte $84,$c1,$00
         .byte $84,$c1,$00
         .byte $82,$c2,$00
         .byte $82,$c1,$00
         .byte $84,$c9,$00
         .byte $82,$c2,$00
         .byte $84,$c1,$00
         .byte $82,$c2,$00
         .byte $84,$c1,$00
         .byte $82,$c9,$00
         .byte $82,$c9,$00
         .byte $84,$c9,$00
         .byte $ff
//---------------------------------------
b4:       .byte $8c,$c5,$e2
         .byte $2b,$2b
         .byte $88,$2b
         .byte $8c,$e6,$2b,$2b
         .byte $88,$2b
         .byte $8c,$e4,$2d,$2d
         .byte $88,$2d
         .byte $8c,$e4,$2d,$2d
         .byte $88,$e1,$2b

         .byte $8c,$e2,$2b,$2b
         .byte $88,$2b
         .byte $8c,$e6,$2b,$2b
         .byte $88,$2b
         .byte $8c,$e1,$2e,$2e
         .byte $88,$2e
         .byte $8c,$e1,$2b,$2b
         .byte $88,$2b

         .byte $ff
//---------------------------------------
b5:       .byte $8c,$d1
         .byte $0c,$0c
         .byte $88,$0c
         .byte $8c,$10,$10
         .byte $88,$10
         .byte $8c,$09,$09
         .byte $88,$09
         .byte $8c,$09,$09
         .byte $88,$07

         .byte $8c,$0c,$0c
         .byte $88,$0c
         .byte $8c,$10,$10
         .byte $88,$10
         .byte $8c,$0a,$0a
         .byte $88,$0a
         .byte $8c,$07,$07
         .byte $88,$07

         .byte $ff
//---------------------------------------
b6:       .byte $8c,$c3,$34
         .byte $32,$88,$30
         .byte $84,$2f,$8c,$2b
         .byte $84,$34,$35,$37
         .byte $98,$34
         .byte $84,$3c,$3e,$94,$39
         .byte $84,$34,$32,$88,$30

         .byte $8c,$34
         .byte $32,$88,$30
         .byte $84,$3c,$8c,$3b
         .byte $84,$37,$39,$34
         .byte $98,$32
         .byte $84,$32,$30,$94,$32
         .byte $84,$34,$32,$88,$30
         .byte $ff
//---------------------------------------
b7:       .byte $84,$c1,$00
         .byte $84,$c5,$e2,$2b
         .byte $84,$c9,$00
         .byte $82,$c1,$00
         .byte $82,$c1,$00
         .byte $84,$c5,$e1,$2b
         .byte $84,$c1,$00
         .byte $84,$c9,$00
         .byte $84,$c5,$e3,$2d
         .byte $84,$c1,$00
         .byte $84,$c5,$e3,$2d
         .byte $84,$c9,$00
         .byte $84,$c1,$00
         .byte $84,$c5,$e4,$2d
         .byte $84,$c1,$00
         .byte $84,$c9,$00
         .byte $84,$c5,$e3,$2d
         .byte $84,$c1,$00
         .byte $84,$c5,$e3,$2d
         .byte $84,$c9,$00
         .byte $82,$c1,$00
         .byte $82,$c1,$00
         .byte $84,$c5,$e5,$2d
         .byte $84,$c1,$00
         .byte $84,$c9,$00
         .byte $84,$c5,$e3,$2d
         .byte $84,$c1,$00
         .byte $84,$c5,$e3,$2d
         .byte $84,$c9,$00
         .byte $84,$c1,$00
         .byte $84,$c5,$e1,$29
         .byte $84,$c1,$00
         .byte $84,$c9,$00
         .byte $84,$c5,$e2,$2b
         .byte $ff
//---------------------------------------
b8:       .byte $84,$c3,$30
         .byte $84,$c0,$00
         .byte $84,$c3,$2d
         .byte $82,$2b,$84,$30
         .byte $8a,$c0,$00
         .byte $84,$c3,$2d,$32,$32
         .byte $84,$c0,$00
         .byte $82,$c3,$34,$84,$2d
         .byte $82,$c0,$00
         .byte $84,$ce,$00
         .byte $84,$cf,$00
         .byte $84,$c3,$2b,$34,$32
         .byte $84,$c0,$00
         .byte $84,$c3,$2b,$34,$32
         .byte $84,$c0,$00
         .byte $82,$c3,$32,$34
         .byte $84,$37,$37,$37
         .byte $82,$39
         .byte $84,$32
         .byte $8a,$c0,$00
         .byte $82,$c3,$2b,$2d
         .byte $ff
//---------------------------------------

b9:
b10:
b11:
b12:
b13:
b14:
         .byte $ff
//---------------------------------------

