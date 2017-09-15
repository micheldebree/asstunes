* =$0801
:BasicUpstart(player)
//---------------------------------------
//Music-routine by Maniacs of Noise
//Assembled by Trooper/RD & Mad B/RD
//---------------------------------------

.var speed    = 2
.var place    = $1000

         .pc= $4000
player:
         sei
         lda #$0f
         sta 646
         jsr $e544
         ldx #$00
hurry:    lda message,x
         cmp #$ff
         beq outta
         jsr $ffd2
         inx
         bne hurry
outta:    lda #$00
         jsr init
         sei
         lda #22
         sta $d018
door:     lda #$62
hole:     cmp $d012
         bne hole
         rol $033e
         rol $033e
         lda #$0f
         sta $d020
         jsr play
         lda #$0b
         sta $d020
         lda $d012
         cmp high+1
         bcc high
         sta high+1
         inc high+1
high:     lda #$63
duf:      cmp $d012
         bne duf
         rol $033e
         rol $033e
         lda #$00
         sta $d020
         lda $dc01
         and #$04
         bne door
         jmp $9000

message:
         .byte 34
         .text "Frog-salad"
         .byte 34,$0d,$0d
         .text "composed by Mad B"
         .text "/Rhyme Design"
         .byte $0d,$0d
         .text "Player by M.O.N."
         .byte $0d,$0d
         .text "{reverse on}1"
         .byte $0d
         .text "2"
         .byte $0d
         .text "{reverse on}3"
         .byte $0d
         .text "4"
         .byte $0d
         .text "{reverse on}5"
         .byte $0d
         .text "6"
         .byte $ff

//---------------------------------------

         .pc= place

.var z1f      = $1f
.var fd400    = $d400
.var fd401    = $d401
.var fd402    = $d402
.var fd403    = $d403
.var fd404    = $d404
.var fd405    = $d405
.var fd406    = $d406
//---------------------------------------
.var a20      = $20
.var a21      = $21
.var a0102    = $0102
.var ad416    = $d416
.var ad417    = $d417
.var ad418    = $d418
//---------------------------------------
.var p20      = $20
//---------------------------------------

init:     jmp i10f7
play:     jmp i110f
         jmp i10f7
a1009:    brk
i100a:    ldy #$00
         sty a1110
         sta a1016
         asl
         asl
         asl
.label a1016    = *+1
         adc #$01
         sta f10cd
         sta a10ce
         sta f10cf
         tax
         lda f1949,x
         sta a1066
         lda f194a,x
         sta a1131
         lda f194b,x
         sta a1195
         lda #$0f
         sta a183d
         tya
         ldx #$27
i103b:    sta f10cf,x
         dex
         bne i103b
         ldx #$02
i1043:    sta z1f,x
         dex
         bpl i1043
         sta a1009
         lda #$10
         sta a183f
         lda #$f0
         sta a1844
         lda #$00
         ldx #$14
i1059:    sta fd400,x
         dex
         bpl i1059
         stx a1110
         rts
f1063:    brk
//---------------------------------------
         .byte $07,$0e
a1066:    .byte $02
a1067:    .byte $00
a1068:    .byte $29
f1069:    .byte $ec,$47,$c0
f106c:    .byte $13,$03,$11
f106f:    .byte $30,$c0,$f0
f1072:    .byte $02,$09,$02
f1075:    .byte $08,$06,$08
f1078:    .byte $0c,$fd,$0c
f107b:    .byte $fe,$fe,$fe
f107e:    .byte $b8,$a8,$b8
f1081:    .byte $08,$38,$20
f1084:    .byte $08,$38,$20
a1087:    .byte $f0
a1088:    .byte $34
a1089:    .byte $66
a108a:    .byte $60
f108b:    .byte $0b,$0b,$01
f108e:    .byte $00
//---------------------------------------
i108f:    brk
         brk
f1091:    ora a0102
f1094:    brk
//---------------------------------------
         .byte $04,$03
f1097:    .byte $00,$00,$01
f109a:    .byte $02,$00,$00
a109d:    .byte $04
a109e:    .byte $00
a109f:    .byte $04
f10a0:    .byte $04,$06,$04
f10a3:    .byte $00,$00,$00
f10a6:    .byte $08,$20,$08
f10a9:    .byte $a1,$a0,$a1
f10ac:    .byte $00,$00,$00
f10af:    .byte $13,$03,$11
f10b2:    .byte $13,$03,$11
f10b5:    .byte $00,$00,$00
f10b8:    .byte $38,$00,$0a
f10bb:    .byte $00,$00,$00
f10be:    .byte $00,$00,$00
a10c1:    .byte $c0,$00,$00
f10c4:    .byte $00,$00,$00
f10c7:    .byte $0d,$05,$03
f10ca:    .byte $01,$01,$01
f10cd:    .byte $09
a10ce:    .byte $09
f10cf:    .byte $09
a10d0:    .byte $01
a10d1:    .byte $00
f10d2:    .byte $41,$41,$41
a10d5:    .byte $00
f10d6:    .byte $01,$01,$01
f10d9:    .byte $01,$01,$01
f10dc:    .byte $09,$09,$09
f10df:    .byte $00,$00,$00
f10e2:    .byte $00,$00,$00
f10e5:    .byte $06,$06,$05
f10e8:    .byte $17,$15,$17
f10eb:    .byte $0f,$1f,$0f
f10ee:    .byte $0d,$0d,$05,$00
         .byte $00,$00
f10f4:    .byte $32,$13,$30
//---------------------------------------
i10f7:    lda #$01
i10f9:    jmp i100a
         bpl i108f
         sta fd404,x
         sta fd400,x
         sta fd401,x
         txa
         sec
         sbc #$07
         tax
         bpl i10f9
         rts
.label a1110    = *+1

i110f:    lda #$ff
         bmi i1114
         rts
i1114:    lda a1009
         beq i1129
         dec a10d5
         bpl i1129
         sta a10d5
         lda a183d
         beq i10f7
         dec a183d
i1129:    ldx #$02
         dec a10d1
         bpl i1137
.label a1131    = *+1
         lda #$00
         sta a10d1
         bne i1142
i1137:    dec a10d0
         bpl i1142
         lda a1066
         sta a10d0
i1142:    stx a1067
         lda a1066
         cmp a10d0
         beq i1150
         jmp i137e
i1150:    dec f10ee,x
         bmi i1158
         jmp i1353
i1158:    txa
         asl
         adc f10cd,x
         tax
         lda f1943,x
         sta a1171
         lda f1944,x
         sta a1172
         ldx a1067
i116d:    ldy f10d9,x
.label a1172    = *+2

.label a1171    = *+1
         lda f1c42,y
         cmp #$fe
         beq i10f7
         cmp #$ff
         bne i1189
         lda #$00
         sta f10ee,x
         sta f10e5,x
         sta f10d9,x
         jmp i1158
i1189:    cmp #$6f
         bcc i11a9
         cmp #$80
         bcc i119e
         sbc #$80
         clc
.label a1195    = *+1
         adc #$fd
         sta f10dc,x
         inc f10d9,x
         bne i116d
i119e:    sec
         sbc #$70
         sta f10e2,x
         inc f10d9,x
         bne i116d
i11a9:    asl
         tay
         lda f1907,y
         sta a20
         lda f1908,y
         sta a21
i11b5:    lda #$00
         sta f10bb,x
         sta f10ac,x
         lda #$01
         sta f10ca,x
         ldy f10e5,x
         lda (p20),y
         sta a1068
         cmp #$60
         bcs i11d1
         jmp i12c1
i11d1:    cmp #$ff
         bne i11ed
         lda #$00
         sta f10e5,x
         lda f10e2,x
         beq i11e4
         dec f10e2,x
         bpl i11ea
i11e4:    inc f10d9,x
         jmp i116d
i11ea:    jmp i11b5
i11ed:    cmp #$fe
         bne i11fd
         iny
         lda (p20),y
         sta a1844
         iny
         lda (p20),y
         sta a1068
i11fd:    cmp #$fd
         bne i1225
i1201:    iny
         lda (p20),y
         and #$0f
         sta f10bb,x
         lda (p20),y
         lsr
         lsr
         lsr
         lsr
         sta f10be,x
         iny
         lda (p20),y
         sta a1068
         iny
         lda (p20),y
         clc
         adc f10dc,x
         sta f10b8,x
         jmp i12c1
i1225:    lda #$00
         sta f10bb,x
         lda a1068
         cmp #$fc
         bne i123d
         iny
         lda (p20),y
         sta a1009
         iny
         lda (p20),y
         sta a1068
i123d:    cmp #$fb
         bne i124c
         lda #$00
         sta f10ca,x
         iny
         lda (p20),y
         sta a1068
i124c:    lda a1068
         cmp #$e0
         bcc i1270
         sbc #$e1
         sta f10ee,x
         lda #$00
         sta f10d2,x
         sta f1075,x
         sta f1078,x
         lda #$01
         sta f10ac,x
         iny
         tya
         sta f10e5,x
         jmp i17f0
i1270:    lda a1068
         cmp #$c0
         bcc i128d
         sbc #$c0
         clc
         adc f10df,x
         sta f10e8,x
         iny
         lda (p20),y
         cmp #$fd
         bne i128a
         jmp i1201
i128a:    sta a1068
i128d:    cmp #$80
         bcc i12b2
         sbc #$81
         sta f10eb,x
i1296:    iny
         lda (p20),y
         cmp #$fd
         bne i12a0
         jmp i1201
i12a0:    cmp #$80
         bcc i12af
         sbc #$80
         clc
         adc f10eb,x
         sta f10eb,x
         bne i1296
i12af:    sta a1068
i12b2:    cmp #$60
         bcc i12c1
         sbc #$60
         sta f108b,x
         iny
         lda (p20),y
         sta a1068
i12c1:    lda f10eb,x
         sta f10ee,x
         lda #$00
         sta f1081,x
         sta f1094,x
         sta f1097,x
         sta f109a,x
         iny
         tya
         sta f10e5,x
         lda a1068
         clc
         adc f10dc,x
         sta f10f4,x
         tay
         lda f1849,y
         sta f1069,x
         lda f18a8,y
         sta f106c,x
         sta f10af,x
         sta f10b2,x
         inc f1081,x
         lda #$ff
         sta f107b,x
         lda f10e8,x
         asl
         asl
         asl
         sta f107e,x
         tay
         lda f1ac7,y
         sta f1075,x
         lda f1ac8,y
         sta f1078,x
         lda f10ca,x
         beq i132f
         lda f10d6,x
         bmi i132f
         lda f1ac5,y
         and #$0f
         sta f1072,x
         lda f1ac5,y
         and #$f0
         sta f106f,x
i132f:    lda f1ac9,y
         and #$08
         bne i134a
         lda f10ca,x
         beq i134a
         lda f1acc,y
         and #$f0
         beq i134a
         lda #$01
         sta f10d2,x
         jmp i17f0
i134a:    lda f1ac6,y
         sta f10d2,x
         jmp i17f0
i1353:    lda f10ee,x
         beq i1374
         cmp f10eb,x
         beq i1370
         ldy f107e,x
         lda f1ac9,y
         lsr
         lsr
         lsr
         lsr
         cmp #$0f
         beq i1374
         cmp f10ee,x
         bcs i1374
i1370:    lda #$ff
         bne i137b
i1374:    lda f10ca,x
         beq i137e
         lda #$fe
i137b:    sta f107b,x
i137e:    lda f10ac,x
         beq i1386
         jmp i17f0
i1386:    inc f1081,x
         lda f1081,x
         cmp #$03
         bcs i1392
         lda #$00
i1392:    sta f1084,x
         ldy f107e,x
         lda f1ac9,y
         sta a1087
         lda f1aca,y
         sta a1088
         lda f1acb,y
         sta a1089
         lda f1acc,y
         sta a108a
         and #$08
         beq i13c8
         lda f10ee,x
         bne i13c8
         lda f10ca,x
         beq i13c8
         lda a10d0
         cmp #$01
         bne i13c8
         sta f1078,x
i13c8:    lda f10bb,x
         bne i13d0
         jmp i146b
i13d0:    lda a1066
         cmp a10d0
         bne i13e0
         lda f10be,x
         beq i13e0
         dec f10be,x
i13e0:    lda f10be,x
         beq i13e8
         jmp i146b
i13e8:    ldy f10b8,x
         lda f1849,y
         sta a20
         lda f18a8,y
         sta a21
         lda #$00
         sta a1068
         lda #$07
         ldy f10bb,x
         dey
i1400:    dey
         bmi i140a
         asl
         rol a1068
         jmp i1400
i140a:    sta a10c1
         lda f10f4,x
         cmp f10b8,x
         bcc i1449
         lda f1069,x
         sbc a10c1
         sta f1069,x
         lda f106c,x
         sbc a1068
         sta f106c,x
         lda f1069,x
         sec
         sbc a20
         lda f106c,x
         sbc a21
         bcs i146b
i1434:    lda #$00
         sta f10bb,x
         lda a20
         sta f1069,x
         lda a21
         sta f106c,x
         sta f10af,x
         jmp i146b
i1449:    lda f1069,x
         adc a10c1
         sta f1069,x
         lda f106c,x
         adc a1068
         sta f106c,x
         lda a20
         sec
         sbc f1069,x
         lda a21
         sbc f106c,x
         bcs i146b
         jmp i1434
i146b:    lda a1087
         and #$08
         beq i1484
         lda a108a
         lsr
         lsr
         lsr
         lsr
         tay
         dey
         lda f1bae,y
         clc
         adc #$1c
         tay
         bne i148e
i1484:    lda a108a
         and #$04
         beq i1507
         ldy f108b,x
i148e:    lda f196b,y
         sta a20
         lda f198b,y
         sta a21
         lda f1084,x
         bne i14a3
         sta f1091,x
         sta f108e,x
i14a3:    ldy #$00
         lda (p20),y
         sta a1068
         dec f108e,x
         bpl i1507
         lsr
         lsr
         lsr
         lsr
         and #$07
         sta f108e,x
i14b8:    inc f1091,x
         ldy f1091,x
         lda (p20),y
         cmp #$ff
         bne i14d0
         ldy #$00
         lda (p20),y
         and #$0f
         sta f1091,x
         jmp i14b8
i14d0:    cmp #$fe
         bne i14da
         dec f1091,x
         jmp i1507
i14da:    ldy f10bb,x
         bne i1507
         bit a1068
         bpl i14ed
         sta f106c,x
         sta f1069,x
         jmp i1504
i14ed:    cmp #$00
         bmi i14f5
         clc
         adc f10f4,x
i14f5:    and #$7f
         tay
         lda f1849,y
         sta f1069,x
         lda f18a8,y
         sta f106c,x
i1504:    sta f10af,x
i1507:    lda a1088
         bne i150f
i150c:    jmp i15da
i150f:    lda f1084,x
         bne i152d
         lda #$00
         sta f1097,x
         sta f1094,x
         sta f10c4,x
         lda a1088
         and #$07
         lsr
         adc #$00
         sta f109a,x
         jmp i15da
i152d:    lda f10bb,x
         bne i150c
         ldy f10f4,x
         lda f1849,y
         sec
         sbc f1848,y
         sta a20
         lda f18a8,y
         sbc f18a7,y
         sta a21
         lda a1088
         and #$70
         lsr
         lsr
         lsr
         lsr
         tay
i1550:    dey
         bmi i155a
         lsr a21
         ror a20
         jmp i1550
i155a:    lda a1088
         bpl i157b
         lda f1081,x
         cmp #$2c
         bcs i1569
         inc f10c4,x
i1569:    ldy #$01
i156b:    lda a20
         adc f10c4,x
         sta a20
         lda a21
         adc #$00
         sta a21
         dey
         bpl i156b
i157b:    lda a1089
         lsr
         lsr
         lsr
         lsr
         sta a158d
         lda f10eb,x
         sec
         sbc f10ee,x
.label a158d    = *+1
         cmp #$06
         bcc i15da
         dec f109a,x
         bpl i15b2
         inc f109a,x
         dec f1094,x
         bpl i15ad
         lda a1088
         and #$07
         sta f1094,x
         lda f1097,x
         eor #$01
         sta f1097,x
i15ad:    lda f1097,x
         bne i15c6
i15b2:    lda f1069,x
         clc
         adc a20
         sta f1069,x
         lda f10af,x
         adc a21
         sta f106c,x
         jmp i15d7
i15c6:    lda f1069,x
         sec
         sbc a20
         sta f1069,x
         lda f10af,x
         sbc a21
         sta f106c,x
i15d7:    sta f10af,x
i15da:    ldx a1067
         lda a1087
         and #$07
         bne i15e7
         jmp i1657
i15e7:    stx a1658
         tay
         dey
         lda f1961,y
         sta a20
         lda f1966,y
         sta a21
         lda f1084,x
         bne i1620
         ldy #$00
         sty a1621
         lda (p20),y
         sta a1068
         and #$f0
         sta a183f
         lda a1068
         and #$0f
         sta a1636
         lda #$02
         sta a109f
         iny
         sty a109e
         lda (p20),y
         jmp i1665
.label a1621    = *+1

i1620:    lda #$ff
         bmi i166b
         dec a109e
         bne i164e
i1629:    ldy a109f
         lda (p20),y
         cmp #$ff
         bne i1641
         sta a1621
.label a1636    = *+1
         lda #$00
         beq i166b
         sta a1621
         sta a109f
         bne i1629
i1641:    sta a109e
         iny
         lda (p20),y
         sta a1653
         iny
         sty a109f
i164e:    lda a109d
         clc
.label a1653    = *+1
         adc #$ff
         jmp i1665
.label a1658    = *+1

i1657:    lda #$01
         cmp a1067
         bne i166b
         lda #$10
         sta a183f
         lda #$ff
i1665:    sta a109d
         sta ad416
i166b:    ldx a1067
         lda a1089
         and #$0f
         bne i1678
         jmp i172d
i1678:    tay
         dey
         lda f1955,y
         sta a20
         lda f195b,y
         sta a21
         ldy #$00
         lda (p20),y
         and #$0f
         sta a170b
         lda (p20),y
         lsr
         lsr
         lsr
         lsr
         sta a1727
         lda f1084,x
         bne i16b7
         iny
         lda (p20),y
         sta f10d6,x
         bmi i16aa
         lda (p20),y
         and #$7f
         sta f10a9,x
i16aa:    lda #$02
         sta f10a0,x
         lda #$01
         sta f10a3,x
         jmp i172d
i16b7:    lda f10a9,x
         bmi i16f2
         dec f10a3,x
         bne i16f2
         ldy f10a0,x
         lda (p20),y
         cmp #$ff
         bne i16d5
         lda f10a9,x
         eor #$a0
         sta f10a9,x
         jmp i16f2
i16d5:    cmp #$fe
         bne i16e4
         lda #$0c
         sta f1072,x
         sta f106f,x
         iny
         lda (p20),y
i16e4:    sta f10a3,x
         iny
         lda (p20),y
         sta f10a6,x
         iny
         tya
         sta f10a0,x
i16f2:    lda f10a9,x
         lsr
         bcc i1714
         lda f106f,x
         clc
         adc f10a6,x
         sta f106f,x
         lda f1072,x
         adc #$00
         sta f1072,x
.label a170b    = *+1
         cmp #$0a
         bcc i172d
         dec f10a9,x
         jmp i172d
i1714:    lda f106f,x
         sec
         sbc f10a6,x
         sta f106f,x
         lda f1072,x
         sbc #$00
         sta f1072,x
.label a1727    = *+1
         cmp #$06
         bcs i172d
         inc f10a9,x
i172d:    lda a108a
         and #$02
         beq i1759
         lda f10eb,x
         cmp #$00
         bcc i1753
         lda f10ee,x
         cmp #$05
         bcs i1753
         lda f1081,x
         and #$01
         beq i1753
         lda f10b2,x
         beq i1759
         dec f10b2,x
         bne i1756
i1753:    lda f10af,x
i1756:    sta f106c,x
i1759:    lda a1087
         and #$08
         bne i17a5
         lda f10ca,x
         beq i17a5
         lda a108a
         and #$f0
         beq i17a5
         lsr
         lsr
         lsr
         lsr
         tay
         dey
         lda f1ba5,y
         cmp f1081,x
         bcc i178e
         lda #$01
         sta f10b5,x
         lda f1bae,y
         bpl i178b
         lda #$48
         sta f106c,x
         lda #$81
i178b:    jmp i17a2
i178e:    lda f10b5,x
         beq i17a5
         dec f10b5,x
         lda f10af,x
         sta f106c,x
         ldy f107e,x
         lda f1ac6,y
i17a2:    sta f10d2,x
i17a5:    lda a1087
         and #$08
         beq i17f0
         lda a108a
         lsr
         lsr
         lsr
         lsr
         tay
         dey
         lda f1ba5,y
         tay
         lda f19ab,y
         sta a20
         lda f19af,y
         sta a21
         lda f1084,x
         bne i17cb
         sta f10c7,x
i17cb:    inc f10c7,x
         ldy f10c7,x
         lda (p20),y
         cmp #$ff
         bne i17e3
         ldy #$00
         lda (p20),y
         and #$0f
         sta f10c7,x
         jmp i17cb
i17e3:    cmp #$fe
         bne i17ed
         dec f10c7,x
         jmp i17f0
i17ed:    sta f10d2,x
i17f0:    ldx a1067
         ldy f1063,x
         lda f1078,x
         sta fd406,y
         lda f1075,x
         sta fd405,y
         lda f10d2,x
         and f107b,x
         sta fd404,y
         lda f1072,x
         sta fd403,y
         lda f106f,x
         sta fd402,y
         lda a108a
         and #$01
         beq i1827
         lda f1069,x
         clc
         adc #$ff
         jmp i182b
i1827:    lda f1069,x
         clc
i182b:    sta fd400,y
         lda f106c,x
         adc #$00
         sta fd401,y
         dex
         bmi i183c
         jmp i1142
.label a183d    = *+1

i183c:    lda #$0f
.label a183f    = *+1
         ora #$30
         sta ad418
.label a1844    = *+1
         lda #$f2
         sta ad417
f1848:    rts
//---------------------------------------
f1849:    .byte $1c,$ff,$3f,$52
         .byte $66,$7b,$92,$aa
         .byte $c3,$de,$fa,$18
         .byte $38,$5a,$7e,$a3
         .byte $cc,$f6,$23,$53
         .byte $86,$bb,$f4,$30
         .byte $70,$b4,$fb,$47
         .byte $97,$ec,$47,$a6
         .byte $0b,$77,$e8,$60
         .byte $e0,$67,$f6,$8e
         .byte $2f,$d9,$8d,$4c
         .byte $17,$ed,$d0,$c1
         .byte $c0,$ce,$ec,$1c
         .byte $5d,$b2,$1a,$98
         .byte $2d,$da,$a0,$82
         .byte $80,$9c,$d9,$38
         .byte $ba,$63,$34,$31
         .byte $5a,$b4,$41,$04
         .byte $00,$39,$b2,$6f
         .byte $74,$c6,$69,$81
         .byte $b5,$68,$82,$08
         .byte $00,$72,$64,$de
         .byte $e9,$8c,$d1,$c2
         .byte $69,$d1
f18a7:    .byte $04
f18a8:    .byte $01,$fc,$01,$01
         .byte $01,$01,$01,$01
         .byte $01,$01,$01,$02
         .byte $02,$02,$02,$02
         .byte $02,$02,$03,$03
         .byte $03,$03,$03,$04
         .byte $04,$04,$04,$05
         .byte $05,$05,$06,$06
         .byte $07,$07,$07,$08
         .byte $08,$09,$09,$0a
         .byte $0b,$0b,$0c,$0d
         .byte $0e,$0e,$0f,$10
         .byte $11,$12,$13,$15
         .byte $16,$17,$19,$1a
         .byte $1c,$1d,$1f,$21
         .byte $23,$25,$27,$2a
         .byte $2c,$2f,$32,$35
         .byte $38,$3b,$3f,$43
         .byte $47,$4b,$4f,$54
         .byte $59,$5e,$64,$6a
         .byte $70,$77,$7e,$86
         .byte $8e,$96,$9f,$a8
         .byte $b2,$bd,$c8,$d4
         .byte $e1,$ee,$fd
//---------------------------------------
f1907:
.label f1908    = *+1

         .byte <b0
         .byte >b0,<b1,>b1,<b2
         .byte >b2,<b3,>b3,<b4
         .byte >b4,<b5,>b5,<b6
         .byte >b6,<b7,>b7,<b8
         .byte >b8,<b9,>b9,<ba
         .byte >ba,<bb,>bb,<bc
         .byte >bc,<bd,>bd,<be
         .byte >be,<bf,>bf,<b10
         .byte >b10,<b11,>b11,<b12
         .byte >b12,<b13,>b13,<b14
         .byte >b14,<b15,>b15,<b16
         .byte >b16,<b17,>b17,<b18
         .byte >b18,<b19,>b19,<b1a
         .byte >b1a,<b1b,>b1b,<b1c
         .byte >b1c,<b1d,>b1d
//---------------------------------------
f1943:    .byte <v1
f1944:    .byte >v1,<v2,>v2,<v3
         .byte >v3
f1949:    .byte $00
f194a:    .byte $06
//---------------------------------------
f194b:    .byte $fd,<t1,>t1,<t2
         .byte >t2,<t3,>t3

//---------------------------------------
         .byte speed
//---------------------------------------

         .byte $00,$fb
//---------------------------------------
//FILTER POINTERS
//---------------------------------------
f1955:    .byte <fl1,<fl2,<fl3,<fl4
         .byte <fl5,<fl6

f195b:    .byte >fl1,>fl2,>fl3,>fl4
         .byte >fl5,>fl6
//---------------------------------------
f1961:    .byte $fd        //filter1
         .byte $d8        //filter2
         .byte <ffl1      //filter3
         .byte <ffl2      //filter4
         .byte <ffl2      //filter5
//---------------------------------------
f1966:    .byte $17        //filter1+
         .byte $18        //filter2+
         .byte >ffl1      //filter3+
         .byte >ffl2      //filter4+
         .byte >ffl2      //filter5+
//---------------------------------------
//FX POINTERS
//---------------------------------------
f196b:    .byte <f1,<f2,<f3,<f4
         .byte <f5,<f6,<f7,<f8
         .byte <f9,<fa,<fb,<fc
         .byte <fd,<fe,<ff,<f10
         .byte <f11,<f12,<f13,<f14
         .byte <f15,<f16,<f17,<f18
         .byte <f19,<f1a,<f1b,<f1c
         .byte <f1d,<f1e,<f1f,<f20

f198b:    .byte >f1,>f2,>f3,>f4
         .byte >f5,>f6,>f7,>f8
         .byte >f9,>fa,>fb,>fc
         .byte >fd,>fe,>ff,>f10
         .byte >f11,>f12,>f13,>f14
         .byte >f15,>f16,>f17,>f18
         .byte >f19,>f1a,>f1b,>f1c
         .byte >f1d,>f1e,>f1f,>f20

f19ab:    .byte <sf1,<sf2,<sf3,<sf4
f19af:    .byte >sf1,>sf2,>sf3,>sf4

//---------------------------------------
//FX
//---------------------------------------

sf1:      .byte $00,$81,$11,$41 //snare
         .byte $80,$40,$80,$80
         .byte $80,$80,$80,$80
         .byte $80,$80,$80,$80
         .byte $fe
sf2:      .byte $80,$81         //high-hat
         .byte $11,$80,$80,$80
         .byte $fe
sf3:      .byte $00             //bass
         .byte $81,$11,$40,$fe
sf4:      .byte $ff
//---------------------------------------
//         FILTERS
//---------------------------------------
ffl1:     .byte $10
         .byte $80,$40,$ff,$ff //108040

ffl2:     .byte $10,$98,$ff  //1098
//---------------------------------------
fl1:      .byte $4c,$01,$04,$40
         .byte $01,$20,$ff
fl2:      .byte $79,$01,$01,$28,$ff
fl3:      .byte $38,$01,$01,$60,$ff
fl4:      .byte $df,$01,$0c,$80
         .byte $01,$08,$ff
fl5:      .byte $ce,$01,$01,$80,$ff
fl6:      .byte $6a,$01,$01,$08,$ff
//---------------------------------------
//ARPEGGIO
//---------------------------------------
f1:       .byte $40,$00,$03,$07,$ff
f2:       .byte $40,$00,$05,$09,$ff
f3:       .byte $10,$0c,$07,$00,$ff
f4:       .byte $10,$0c,$09,$00,$ff
f5:       .byte $20,$00,$03,$08,$ff
f6:       .byte $20,$00,$04,$09,$ff
f7:       .byte $00,$a0,$9c,$98
         .byte $94,$00,$fe
f8:       .byte $20,$00,$01,$ff
f9:       .byte $20,$2f,$30,$0c
         .byte $00,$ff
fa:       .byte $01,$c8,$0c,$0c
         .byte $00,$00,$ff
fb:       .byte $50,$0c,$00,$ff
fc:       .byte $04,$a8,$a4,$a0
         .byte $9c,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$0c,$0c,$0c,$ff
fd:       .byte $10,$07,$05,$00,$ff
fe:       .byte $10,$0a,$05,$00,$ff
ff:       .byte $10,$0b,$05,$00,$ff
f10:      .byte $10,$0b,$04,$00,$ff
f11:      .byte $10,$0a,$03,$00,$ff
f12:      .byte $10,$0c,$00,$ff
f13:      .byte $30,$0c,$00,$ff
f14:      .byte $50,$0c,$00,$00,$ff
f15:      .byte $30,$00,$02,$03
         .byte $05,$ff
f16:      .byte $30,$02,$00,$02
         .byte $04,$ff
f17:      .byte $30,$01,$00,$01
         .byte $03,$ff
f18:      .byte $30,$02,$03,$02
         .byte $00,$ff
f19:      .byte $00,$00,$03,$07
         .byte $0c,$ff
f1a:      .byte $00,$00,$05,$08
         .byte $0c,$ff
f1b:      .byte $00,$00,$05,$09
         .byte $0c,$ff
f1c:      .byte $00,$00,$03,$08
         .byte $0c,$ff
f1d:      .byte $80,$34,$13
         .byte $0e,$32,$0d,$32
         .byte $34,$32,$34,$32
         .byte $34,$32,$34,$32
         .byte $34,$fe
f1e:      .byte $80,$70,$10
         .byte $fd,$fd,$fe
f1f:      .byte $80,$40,$10,$0a
         .byte $08,$06,$05,$04
         .byte $03,$03,$02,$02
         .byte $01,$fe
f20:      .byte $30,$08,$04,$ff

//---------------------------------------

f1ac5:
.label f1ac6    = *+1
.label f1ac7    = *+2
.label f1ac8    = *+3
.label f1ac9    = *+4
.label f1aca    = *+5
.label f1acb    = *+6
.label f1acc    = *+7

//---------------------------------------
//SOUNDS
//---------------------------------------

s0:       .byte $06,$41,$00,$9a
         .byte $93,$33,$01,$54
//---------------------------------------
s1:       .byte $08,$41,$00,$3a
         .byte $30,$00,$04,$64
//---------------------------------------
s2:       .byte $08,$11,$08,$07
         .byte $08,$00,$00,$30
//---------------------------------------
s3:       .byte $08,$11,$09,$08
         .byte $08,$00,$00,$10
//---------------------------------------
s4:       .byte $0a,$41,$00,$78
         .byte $00,$00,$01,$60
//---------------------------------------
s5:       .byte $04,$41,$08,$b8
         .byte $03,$23,$01,$50
//---------------------------------------
s6:       .byte $0c,$41,$08,$76
         .byte $10,$44,$01,$60
//---------------------------------------
s7:       .byte $04,$41,$03,$c7
         .byte $01,$23,$01,$50
//---------------------------------------
s8:       .byte $02,$41,$00,$59
         .byte $30,$23,$04,$60
//---------------------------------------
s9:       .byte $02,$41,$fb,$59
         .byte $30,$23,$04,$80
//---------------------------------------
sa:       .byte $08,$11,$00,$da
         .byte $00,$00,$00,$58
//---------------------------------------
sb:       .byte $08,$11,$00,$da
         .byte $00,$23,$00,$58
//---------------------------------------
sc:       .byte $08,$13,$08,$ad
         .byte $f0,$00,$00,$00
//---------------------------------------
sd:       .byte $0c,$41,$07,$d9
         .byte $30,$34,$31,$64
//---------------------------------------
se:       .byte $02,$41,$07,$d9
         .byte $f2,$00,$02,$64
//---------------------------------------
sf:       .byte $08,$41,$00,$68
         .byte $10,$00,$00,$50
//---------------------------------------
s10:      .byte $05,$41,$07,$08
         .byte $c2,$33,$00,$00
//---------------------------------------
s11:      .byte $08,$43,$08,$aa
         .byte $f0,$03,$00,$00
//---------------------------------------
s12:      .byte $08,$41,$03,$79 //prz-bas
         .byte $32,$00,$31,$54
//---------------------------------------
s13:      .byte $0e,$41,$03,$99 //prz-bas
         .byte $32,$23,$34,$54
//---------------------------------------
s14:      .byte $08,$89,$00,$a6 //hihat
         .byte $f8,$00,$00,$10
//---------------------------------------
s15:      .byte $08,$89,$04,$a9 //przsnare
         .byte $fa,$00,$00,$20
//---------------------------------------
s16:      .byte $0a,$41,$02,$96 //refsound
         .byte $00,$33,$45,$80
//---------------------------------------
s17:      .byte $09,$41,$02,$9a //refsound
         .byte $d0,$33,$45,$80
//---------------------------------------
s18:      .byte $08,$15,$00,$99 //bottle
         .byte $40,$00,$00,$50
//---------------------------------------
s19:      .byte $09,$41,$02,$69 //voice
         .byte $40,$00,$03,$64
//---------------------------------------
s20:      .byte $0c,$41,$08,$c9 //tss-bas
         .byte $11,$42,$10,$80
//---------------------------------------
s21:      .byte $08,$81,$08,$08
         .byte $10,$00,$00,$00
//---------------------------------------
f1ba5:    .byte $00,$01,$02
         .byte $03,$02,$02
         .byte $02,$28,$08

f1bae:    .byte $00,$01,$02
         .byte $03,$81,$11
         .byte $15,$41,$51
//---------------------------------------
v1:
v2:
v3:
//---------------------------------------
         .text "Music by Mad B of "
         .text "Rhyme Design. Player "
         .text "by Maniacs of Noise."
//---------------------------------------

f1c42:
//---------------------------------------
//TRACKS
//---------------------------------------

t1:     // .byte $8c,$04,$ff
         .byte $8c,$00,$00
         .byte $8c,$01,$01
         .byte $8e,$01,$01
         .byte $8e,$04,$04,$04,$04
         .byte $04,$04,$04,$04
         .byte $8e,$01,$01
         .byte $ff

t2:     // .byte $8c,$05,$ff
         .byte $8c,$02,$91,$02
         .byte $8a,$02,$8c,$02
         .byte $8c,$02,$91,$02
         .byte $8a,$02,$8c,$02

         .byte $8c,$02,$91,$02
         .byte $8a,$02,$8c,$02
         .byte $8c,$02,$91,$02
         .byte $8a,$02,$8c,$02

         .byte $8e,$02,$93,$02
         .byte $8c,$02,$8e,$02
         .byte $8e,$02,$93,$02
         .byte $8c,$02,$8e,$02

         .byte $8e,$05,$05,$05,$05
         .byte $05,$05,$05,$05
         .byte $05,$05,$05,$05
         .byte $05,$05,$05,$05


         .byte $8e,$02,$93,$02
         .byte $8c,$02,$8e,$02
         .byte $8e,$02,$93,$02
         .byte $8c,$02,$8e,$02

         .byte $ff

t3:     // .byte $8c,$06,$ff
         .byte $8c,$00,$00
         .byte $8c,$03,$8e,$03,$06,$03
         .byte $ff
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
help:
    //    .byte $fe,$f1  //filter aan
    //    .byte $60-$7f  //special sounds
//---------------------------------------
//BLOCKS
//---------------------------------------
b0:       .byte $f0,$f0,$f0,$f0
         .byte $f0,$f0,$f0,$f0
         .byte $ff
//---------------------------------------
b1:       .byte $c5,$86         //Bass
         .byte $0c,$82,$18
         .byte $c3,$84,$00
         .byte $c5,$0c
         .byte $88,$0c
         .byte $c3,$84,$00
         .byte $c5,$0f
         .byte $86,$11
         .byte $82,$11
         .byte $c3,$84,$00
         .byte $c5,$82,$0a,$0c,$0f
         .byte $84,$11,$82,$11
         .byte $c3,$84,$00
         .byte $c5,$13

         .byte $86,$16
         .byte $82,$16
         .byte $c3,$84,$00
         .byte $c5,$82
         .byte $13,$13+12
         .byte $11,$11+12
         .byte $82,$0f,$0c
         .byte $c3,$84,$00
         .byte $c5,$0a

         .byte $0c,$82,$0f,$0f+12
         .byte $c3,$84,$00
         .byte $c5,$11

         .byte $82,$16,$13,$16,$18
         .byte $c3,$84,$00
         .byte $c5,$18

         .byte $ff


//---------------------------------------
b2:                             //Drum
         .byte $c2,$84,$00
         .byte $d2,$62,$30
         .byte $d2,$63,$30
         .byte $d2,$62,$30
         .byte $c2,$00
         .byte $c2,$84,$00
         .byte $d2,$84,$63,$30
         .byte $d2,$84,$62,$30
         .byte $ff
//---------------------------------------
b3:                              //Solo
         .byte $e8,$c6
         .byte $88,$34
         .byte $84,$34,$35,$37
         .byte $88,$37,$84,$35,$34
         .byte $90,$30
         .byte $84,$30,$2e,$88,$30
         .byte $84,$30,$34,$35,$34
         .byte $88,$30
         .byte $84,$3a,$3a,$82,$37
         .byte $84,$3c
         .byte $82,$24,$24,$24,$28
         .byte $24,$30,$32
         .byte $88,$34
         .byte $88,$35
         .byte $88,$34
         .byte $88,$30
         .byte $84,$2e
         .byte $88,$30
         .byte $82,$2e,$30
         .byte $84,$35,$30,$2e,$30
         .byte $86,$3a
         .byte $86,$39
         .byte $82,$35,$37
         .byte $84,$3a
         .byte $88,$3c,$3c
         .byte $82,$24,$24,$24,$24
         .byte $c3,$82,$00,$00,$84,$00
         .byte $e8,$82,$00,$00
         .byte $ff
//---------------------------------------
b4:       .byte $c5,$86,$0c      //Bass 2
         .byte $82,$0c
         .byte $c3,$84,$00
         .byte $c5,$0c,$0f,$11
         .byte $c3,$84,$00
         .byte $c5,$13
         .byte $ff
//---------------------------------------
b5:       .byte $c2,$84,$00
         .byte $d2,$84,$63,$30
         .byte $62,$30
         .byte $c2,$84,$00
         .byte $ff
//---------------------------------------
b6:       .byte $e8,$c6,$88,$30
         .byte $82,$35,$36,$37,$36
         .byte $35,$33,$30
         .byte $2e,$84,$33,$84,$30
         .byte $82,$2b,$2e,$88,$30
         .byte $82,$3a,$3c,$3f
         .byte $3a,$3c,$3f
         .byte $3a,$3c,$3f
         .byte $3a,$3c
         .byte $3a,$37,$36
         .byte $3a,$37,$36
         .byte $3a,$37
         .byte $3a,$37,$36,$35,$33
         .byte $84,$30,$33
         .byte $82,$36,$37,$36
         .byte $82,$3a,$37,$3a
         .byte $84,$3c
         .byte $84,$fd,$08,$30,$20

         .byte $86,$fd,$05,$3a,$3c
         .byte $86,$fd,$05,$3a,$3c
         .byte $84,$fd,$05,$3a,$3c
         .byte $86,$fd,$05,$3a,$3c
         .byte $86,$fd,$05,$3a,$3c
         .byte $84,$fd,$05,$3a,$3c
         .byte $82,$37,$3a,$37,$3a
         .byte $37,$3a,$37,$36,$35
         .byte $33,$32
         .byte $33,$88,$30
         .byte $86,$36,$35,$84,$33
         .byte $86,$36,$35,$84,$33
         .byte $86,$36,$35,$84,$33
         .byte $88,$fd,$08,$30,$0c
         .byte $c3,$82,$00,$00,$00,$00

         .byte $ff
//---------------------------------------

b7:
b8:
b9:
ba:
bb:
bc:
bd:
be:
bf:
b10:
b11:
b12:
b13:
b14:
b15:
b16:
b17:
b18:
b19:
b1a:
b1b:
b1c:
b1d:

         .byte $ff
//---------------------------------------

