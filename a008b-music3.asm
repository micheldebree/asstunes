* =$0801
:BasicUpstart(player)
         .pc= $4000
player:
         sei
         lda #$00
         jsr $1000
door:     lda #$62
f1:       cmp $d012
         bne f1
         dec $d020
         jsr $1003
         inc $d020
         lda $dc01
         and #$10
         bne door
         jmp $9000
//---------------------------------------

         .pc= $1000

//---------------------------------------
.var f1f      = $1f
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

         jmp i10f7
         jmp i110f
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
i1043:    sta f1f,x
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
f10a0:    .byte $04,$06,$04//"
f10a3:    .byte $00,$00,$00//"...
f10a6:    .byte $08,$20,$08//" 
f10a9:    .byte $a1,$a0,$a1//"! !
f10ac:    .byte $00,$00,$00//"...
f10af:    .byte $13,$03,$11//"
f10b2:    .byte $13,$03,$11//"
f10b5:    .byte $00,$00,$00//"...
f10b8:    .byte $38,$00,$0a//"8.

f10bb:    .byte $00,$00,$00//"...
f10be:    .byte $00,$00,$00//"...
a10c1:    .byte $c0,$00,$00//"@..
f10c4:    .byte $00,$00,$00//"...
f10c7:    .byte $0d,$05,$03//".
f10ca:    .byte $01,$01,$01//"
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
f1849:    .byte $1c,$ff,$3f,$52//".?r
         .byte $66,$7b,$92,$aa//"F{*
         .byte $c3,$de,$fa,$18//"C^z
         .byte $38,$5a,$7e,$a3//"8z~#
         .byte $cc,$f6,$23,$53//"Lv#s
         .byte $86,$bb,$f4,$30//"//t0
         .byte $70,$b4,$fb,$47//"P4{g
         .byte $97,$ec,$47,$a6//"lg&
         .byte $0b,$77,$e8,$60//"Wh`
         .byte $e0,$67,$f6,$8e//"`Gv
         .byte $2f,$d9,$8d,$4c//"/Y.l
         .byte $17,$ed,$d0,$c1//"mPA
         .byte $c0,$ce,$ec,$1c//"@Nl
         .byte $5d,$b2,$1a,$98//"]2
         .byte $2d,$da,$a0,$82//"-Z 
         .byte $80,$9c,$d9,$38//" Y8
         .byte $ba,$63,$34,$31//":C41
         .byte $5a,$b4,$41,$04//"z4a
         .byte $00,$39,$b2,$6f//".92O
         .byte $74,$c6,$69,$81//"TFI
         .byte $b5,$68,$82,$08//"5H
         .byte $00,$72,$64,$de//".RD^
         .byte $e9,$8c,$d1,$c2//"iQB
         .byte $69,$d1
f18a7:    .byte $04
f18a8:    .byte $01,$fc,$01,$01//"|
         .byte $01,$01,$01,$01//"
         .byte $01,$01,$01,$02//"
         .byte $02,$02,$02,$02//"
         .byte $02,$02,$03,$03//"
         .byte $03,$03,$03,$04//"
         .byte $04,$04,$04,$05//"
         .byte $05,$05,$06,$06//"
         .byte $07,$07,$07,$08//"
         .byte $08,$09,$09,$0a//"		

         .byte $0b,$0b,$0c,$0d//".
         .byte $0e,$0e,$0f,$10//"
         .byte $11,$12,$13,$15//"
         .byte $16,$17,$19,$1a//"
         .byte $1c,$1d,$1f,$21//"!
         .byte $23,$25,$27,$2a//"#%'*
         .byte $2c,$2f,$32,$35//",/25
         .byte $38,$3b,$3f,$43//"8//?c
         .byte $47,$4b,$4f,$54//"gkot
         .byte $59,$5e,$64,$6a//"y^DJ
         .byte $70,$77,$7e,$86//"PW~
         .byte $8e,$96,$9f,$a8//"(
         .byte $b2,$bd,$c8,$d4//"2=HT
         .byte $e1,$ee,$fd
f1907:    .byte $eb
//---------------------------------------
f1908:    .byte $1f,<c1,>c1,<c3
         .byte >c3,<c2,>c2,<c4
         .byte >c4,<c5,>c5,<c6
         .byte >c6,<c7,>c7,<b1
         .byte >b1,<b3,>b3,<b4
         .byte >b4,<b5,>b5,<b6
         .byte >b6,<b7,>b7,<b2
         .byte >b2,<b8,>b8,<b9
         .byte >b9,<b12,>b12,<b13
         .byte >b13,<b14,>b14,<b15
         .byte >b15,<b16,>b16,<b17
         .byte >b17,<b18,>b18,<b19
         .byte >b19,<b20,>b20,<b21
         .byte >b21,<b22,>b22,<b10
         .byte >b10,<b11,>b11
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
         .byte $02            //speed
//---------------------------------------
         .byte $00,$fd
f1955:    .byte $02,$09,$0e,$13
         .byte $1a,$1f
f195b:    .byte $1a,$1a,$1a,$1a
         .byte $1a,$1a
f1961:    .byte $f5,$fa,$ff,$02
         .byte $02
f1966:    .byte $19,$19,$19,$1a
         .byte $1a
f196b:    .byte $24,$29,$2e,$33
         .byte $38,$3d,$42,$49
         .byte $4d,$53,$5a,$5e
         .byte $6f,$74,$79,$7e
         .byte $83,$88,$8c,$90
         .byte $95,$9b,$a1,$a7
         .byte $ad,$b3,$b9,$bf
         .byte $c4,$dc,$e7,$f5
f198b:    .byte $1a,$1a,$1a,$1a
         .byte $1a,$1a,$1a,$1a
         .byte $1a,$1a,$1a,$1a
         .byte $1a,$1a,$1a,$1a
         .byte $1a,$1a,$1a,$1a
         .byte $1a,$1a,$1a,$1a
         .byte $1a,$1a,$1a,$1a
         .byte $19,$19,$19,$19
f19ab:    .byte $b3,$d5,$e2,$f5
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//special-soundeffects...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f19af:    .byte $19,$19,$19,$19
         .byte $80,$81,$11,$40
         .byte $80,$80,$80,$80
         .byte $80,$80,$80,$80
         .byte $80,$80,$80,$10
         .byte $fe,$80,$3c,$1a
         .byte $1e,$3c,$3c,$3c
         .byte $3c,$3c,$3c,$3c
         .byte $3c,$3c,$3c,$3c
         .byte $0e,$fe
//---------------------------------------
         .byte $80,$81        //snaredrum
         .byte $41,$41,$80,$80
         .byte $fe,$83,$d8,$0d
         .byte $09,$d8,$fe
//---------------------------------------
         .byte $80            //basdrum
         .byte $81,$11,$10,$fe
         .byte $03,$d8,$a8,$a4
         .byte $a3,$a2,$a1,$a1
         .byte $a0,$a0,$9f,$9e
         .byte $9e,$fe
//---------------------------------------
         .byte $30,$08
         .byte $04,$ff,$ff,$10
         .byte $80,$40,$ff,$ff
         .byte $10,$98,$ff,$4c
         .byte $01,$04,$40,$01//".
         .byte $20,$ff,$79,$01//" .Y
         .byte $01,$28,$ff,$38//"(.8
         .byte $01,$01,$60,$ff//"`.
         .byte $df,$01,$0c,$80//"_ 
         .byte $01,$08,$ff,$ce//".N
         .byte $01,$01,$80,$ff//" .
         .byte $6a,$01,$01,$08//"J
         .byte $ff,$10,$07,$03//".
         .byte $00,$ff,$10,$07//"..
         .byte $04,$00,$ff,$10//"..
         .byte $08,$05,$00,$ff//"..
         .byte $10,$09,$05,$00//"	.
         .byte $ff,$10,$08,$03//".
         .byte $00,$ff,$10,$09//"..	
         .byte $04,$00,$ff,$00//"...
         .byte $a0,$9c,$98,$94//" 
         .byte $00,$fe,$20,$00//".~ .
         .byte $01,$ff,$20,$2f//". /
         .byte $30,$0c,$00,$ff//"0..
         .byte $01,$c8,$0c,$0c//"H
         .byte $00,$00,$ff,$50//"...p
         .byte $0c,$00,$ff,$04//"..
         .byte $a4,$a0,$9c,$0c//"_ 
         .byte $0c,$0c,$00,$00//"..
         .byte $00,$00,$00,$00//"....
         .byte $0c,$0c,$0c,$ff//".
         .byte $10,$07,$05,$00//".
         .byte $ff,$10,$0a,$05//".
         .byte $00,$ff,$10,$0b//"..
         .byte $05,$00,$ff,$10//"..
         .byte $0b,$04,$00,$ff//"..
         .byte $10,$0a,$03,$00//"
         .byte $ff,$20,$0c,$00//". .
         .byte $ff,$30,$0c,$00//".0.
         .byte $ff,$50,$0c,$00//".p.
         .byte $00,$ff,$30,$00//"..0.
         .byte $02,$03,$05,$ff//".
         .byte $30,$02,$00,$02//"0.
         .byte $04,$ff,$30,$01//".0
         .byte $00,$01,$03,$ff//"..
         .byte $30,$02,$03,$02//"0
         .byte $00,$ff,$00,$00//"....
         .byte $03,$07,$0c,$ff//".
         .byte $00,$00,$05,$08//"..
         .byte $0c,$ff,$00,$00//"...
         .byte $05,$09,$0c,$ff//"	.
         .byte $00,$00,$03,$08//"..
         .byte $0c,$ff
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//sounds...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f1ac5:    .byte $00
f1ac6:    .byte $00
f1ac7:    .byte $00
f1ac8:    .byte $00
f1ac9:    .byte $00
f1aca:    .byte $00
f1acb:    .byte $00
f1acc:    .byte $00
//---------------------------------------
s1:       .byte $01,$41,$08
         .byte $b8,$10,$33,$41
         .byte $00
//---------------------------------------
s2:       .byte $01,$41,$08
         .byte $88,$10,$23,$01
         .byte $00
//---------------------------------------
s3:       .byte $08,$89,$0d
         .byte $e8,$f8,$00,$00
         .byte $20
//---------------------------------------
s4:       .byte $08,$89,$0d
         .byte $e8,$f8,$00,$00
         .byte $30
//---------------------------------------
s5:       .byte $08,$41,$00
         .byte $89,$10,$33,$04
         .byte $70
//---------------------------------------
s6:       .byte $08,$89,$00
         .byte $89,$f8,$00,$00
         .byte $20
//---------------------------------------
s7:       .byte $47,$41,$03
         .byte $69,$10,$00,$01
         .byte $54
//---------------------------------------
s8:       .byte $05,$41,$06
         .byte $a9,$10,$00,$04
         .byte $64
//---------------------------------------
s9:       .byte $08,$21,$00
         .byte $49,$10,$00,$00
         .byte $64
//---------------------------------------
s10:      .byte $08,$11,$00
         .byte $99,$f0,$00,$00
         .byte $64
//---------------------------------------
s11:      .byte $02,$41,$0a
         .byte $a9,$f2,$00,$02
         .byte $64
//---------------------------------------
s12:      .byte $02,$41,$00
         .byte $69,$f2,$00,$02
         .byte $64
//---------------------------------------
s13:      .byte $02,$41,$0a
         .byte $a9,$22,$33,$42
         .byte $64
//---------------------------------------
s14:      .byte $02,$41,$00
         .byte $99,$f2,$00,$02
         .byte $64
//---------------------------------------
s15:      .byte $08,$41,$00
         .byte $68,$10,$00,$00
         .byte $50
//---------------------------------------
s16:      .byte $08,$41,$00
         .byte $68,$10,$33,$00
         .byte $50
//---------------------------------------
s17:      .byte $08,$43,$08
         .byte $aa,$f0,$03,$00
         .byte $00
//---------------------------------------
s18:      .byte $08,$41,$03    //prz-bas
         .byte $99,$32,$23,$31
         .byte $54
//---------------------------------------
s19:      .byte $0e,$41,$03    //prz-bas
         .byte $99,$32,$23,$34
         .byte $54
//---------------------------------------
s20:      .byte $08,$89,$00    //hihat
         .byte $a6,$f8,$00,$00
         .byte $10
//---------------------------------------
s21:      .byte $08,$89,$04    //prz-snare
         .byte $a9,$fa,$00,$00
         .byte $20
//---------------------------------------
s22:      .byte $0a,$41,$02    //ref-sound
         .byte $96,$00,$33,$45
         .byte $80
//---------------------------------------
s23:      .byte $09,$41,$02    //ref-sound
         .byte $9a,$d0,$33,$45
         .byte $80
//---------------------------------------
s24:      .byte $08,$15,$00    //bottle
         .byte $99,$40,$00,$00
         .byte $50
//---------------------------------------
s25:      .byte $09,$41,$02    //voice
         .byte $69,$40,$00,$03
         .byte $64
//---------------------------------------
s26:      .byte $0c,$41,$08    //tss-bas
         .byte $c9,$11,$42,$10
         .byte $80
//---------------------------------------
s27:      .byte $08,$81,$08
         .byte $08,$10,$00,$00
         .byte $00
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f1ba5:    .byte $00,$01,$02,$03
         .byte $02,$02,$02,$28
         .byte $08
f1bae:    .byte $00,$01,$02,$03
         .byte $81,$11,$15,$41
         .byte $51
//---------------------------------------
v1:       .byte $00
//---------------------------------------
v2:       .byte $00
//---------------------------------------
v3:       .byte $00
//---------------------------------------
c1:       .byte $00
//---------------------------------------
c2:       .byte $00
//---------------------------------------
c3:       .byte $00
//---------------------------------------
c4:       .byte $00
//---------------------------------------
c5:       .byte $00
//---------------------------------------
c6:       .byte $00
//---------------------------------------
c7:       .byte $00
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//tracks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f1c42:

t1:    //  .byte $90,$15,$ff

         .byte $98,$0c,$8c,$08,$08,$0d
         .byte $0d,$88,$13,$13,$90,$73
         .byte $15,$ff
//---------------------------------------
t2:    //  .byte $90,$16,$ff

         .byte $98,$0b,$8c,$09,$09,$7f
         .byte $0f,$73,$0f,$88,$12,$90
         .byte $73,$16,$ff
//---------------------------------------
t3:    //  .byte $90,$14,$ff

         .byte $98,$0a,$0a,$0a,$8c,$10
         .byte $10,$88,$11,$11,$90,$14
         .byte $14,$ff

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//blocks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
b1:       .byte $c2,$86,$0c,$c1,$82,$18
         .byte $c3,$00,$c1,$0c,$84,$0e
         .byte $c2,$86,$0f,$c1,$82,$1b
         .byte $c3,$00,$c1,$0f,$84,$10

         .byte $c2,$86,$11,$c1,$82,$1d
         .byte $c3,$00,$c1,$07,$84,$08
         .byte $09,$15,$c3,$82,$00,$c1
         .byte $0a,$84,$16

         .byte $c2,$86,$0c,$c1,$82,$18
         .byte $c3,$00,$c1,$0c,$84,$0e
         .byte $c2,$86,$0f,$c1,$82,$1b
         .byte $c3,$00,$c1,$0f,$84,$10

         .byte $c2,$86,$11,$c1,$82,$1d
         .byte $c3,$00,$c1,$07,$84,$08
         .byte $09,$15,$c3,$82,$00,$c1
         .byte $0a,$84,$16

         .byte $c2,$86,$0c,$c1,$82,$18
         .byte $c3,$00,$c1,$0c,$84,$0e
         .byte $c2,$86,$0f,$c1,$82,$1b
         .byte $c3,$00,$c1,$0f,$84,$10

         .byte $c2,$86,$11,$c1,$82,$1d
         .byte $c3,$00,$c1,$07,$84,$08
         .byte $09,$15,$c3,$82,$00,$c1
         .byte $0a,$84,$16

         .byte $c2,$86,$0c,$c1,$82,$18
         .byte $c3,$00,$c1,$0c,$84,$0e
         .byte $c2,$86,$0f,$c1,$82,$1b
         .byte $c3,$00,$c1,$0f,$84,$10

         .byte $c2,$86,$11,$c1,$82,$1d
         .byte $c3,$00,$c1,$1d,$84,$11
         .byte $fd,$28,$1f,$13,$82,$1d
         .byte $1b,$c3,$00,$c1,$1d,$84
         .byte $1b
         .byte $ff
//---------------------------------------
b2:       .byte $f0,$f0,$ff
         .byte $c1
         .byte $82,$24,$27,$2b
         .byte $30,$c2,$84,$00
         .byte $c1,$82,$24,$27
         .byte $2b,$86,$30,$c2
         .byte $88,$00,$c1,$82
         .byte $24,$27,$2c,$30
         .byte $c2,$84,$00,$c1
         .byte $82,$24,$27,$2c
         .byte $86,$30,$c2,$88
         .byte $00,$c1,$82,$22
         .byte $26,$29,$2e,$c2
         .byte $84,$00,$c1,$82
         .byte $22,$26,$29,$86
         .byte $2e,$c2,$88,$00
         .byte $c1,$82,$24,$27
         .byte $2b,$30,$c2,$84
         .byte $00,$c1,$82,$24
         .byte $27,$2b,$86,$30
         .byte $c2,$88,$00,$ff

         .byte $c1            //"B.A
         .byte $86,$22,$82,$26//".&
         .byte $c2,$84,$00,$c1//"B.A
         .byte $84,$27,$88,$29//"')
         .byte $c2,$88,$00,$c1//"B.A
         .byte $86,$22,$82,$26//".&
         .byte $c2,$84,$00,$c1//"B.A
         .byte $27,$86,$29,$82//"')
         .byte $27,$c2,$84,$00//"'B.
         .byte $c1,$26,$c1,$86//"A&A
         .byte $24,$82,$26,$c2//"$&B
         .byte $84,$00,$c1,$84//".A
         .byte $27,$88,$2b,$c2//"'+B
         .byte $00,$c1,$86,$24//".A$
         .byte $82,$1f,$c2,$84//"B
         .byte $00,$c1,$18,$c2//".AB
         .byte $00,$82,$00,$00//"...
         .byte $84,$00,$82,$00//"..
         .byte $00,$ff
//---------------------------------------
b3:       .byte $c4,$84,$00,$c9,$62,$2b
         .byte $c8,$2b,$c9,$2b,$c8,$88
         .byte $63,$29,$84,$62,$2b,$61
         .byte $29,$c4,$00,$c8,$29,$c9
         .byte $29,$c8,$29,$88,$29,$84
         .byte $63,$29,$c9,$29,$c4,$00
         .byte $c9,$62,$2b,$c8,$2b,$c9
         .byte $2b,$c8,$88,$63,$29,$84
         .byte $62,$2b,$61,$29,$c4,$00
         .byte $c8,$29,$c9,$29,$c8,$29
         .byte $88,$29,$84,$63,$29,$c9
         .byte $29,$c4,$00,$c9,$6d,$2b
         .byte $c8,$2b,$8c,$62,$2b,$84
         .byte $63,$29,$61,$29,$c4,$00
         .byte $c8,$29,$c9,$29,$c8,$29
         .byte $88,$29,$84,$63,$29,$c9
         .byte $29,$c4,$00,$c9,$62,$2b
         .byte $c8,$2b,$c9,$2b,$c8,$88
         .byte $63,$29,$84,$62,$2b,$61
         .byte $29,$c4,$00,$c8,$29,$c9
         .byte $29,$c8,$29,$88,$29,$84
         .byte $63,$29,$c3,$82,$00,$00
         .byte $ff
//---------------------------------------
b4:       .byte $e8,$c5,$84,$27,$e4,$88
         .byte $26,$84,$27,$24,$e4,$24
         .byte $e4,$24,$88,$24,$84,$26
         .byte $e4
         .byte $e8,$84,$27,$e4,$88
         .byte $26,$84,$27,$24,$e4,$24
         .byte $e4,$24,$88,$24,$84,$26
         .byte $e4
         .byte $e8,$84,$29,$8c,$27
         .byte $84,$26,$24,$e4,$24,$e4
         .byte $24,$88,$24,$84,$26,$e4
         .byte $e8,$84,$27,$e4,$88
         .byte $26,$84,$27,$24,$e4,$24
         .byte $e4,$24,$88,$24,$84,$26
         .byte $e4,$ff
//---------------------------------------
b5:       .byte $e8,$c5,$84,$1f,$e4,$88
         .byte $1d,$84,$1f,$1d,$e4,$1d
         .byte $e4,$1d,$88,$1d,$84,$1d
         .byte $e4
         .byte $e8,$84,$1f,$e4,$88
         .byte $1d,$84,$1f,$1d,$e4,$1d
         .byte $e4,$1d,$88,$1d,$84,$1d
         .byte $e4
         .byte $e8,$84,$1f,$8c,$1f
         .byte $84,$1d,$1d,$e4,$1d,$e4
         .byte $1d,$88,$1d,$84,$1d,$e4
         .byte $e8,$84,$1f,$e4,$88
         .byte $1d,$84,$1f,$1d,$e4,$1d
         .byte $e4,$1d,$88,$1d,$84,$1d
         .byte $e4,$ff
//---------------------------------------
b6:       .byte $e8,$c5,$84,$24,$e4,$88
         .byte $22,$84,$24,$21,$e4,$21
         .byte $e4,$21,$88,$21,$84,$22
         .byte $e4
         .byte $e8,$84,$24,$e4,$88
         .byte $22,$84,$24,$21,$e4,$21
         .byte $e4,$21,$88,$21,$84,$22
         .byte $e4
         .byte $e8,$84,$24,$8c,$24
         .byte $84,$22,$21,$e4,$21,$e4
         .byte $21,$88,$21,$84,$22,$e4
         .byte $e8,$84,$24,$e4,$88
         .byte $22,$84,$24,$21,$e4,$21
         .byte $e4,$21,$88,$21,$84,$22
         .byte $e4,$ff
//---------------------------------------
b7:       .byte $c7,$88,$6b,$0c,$c3,$84
         .byte $00,$c7,$8c,$0c,$c3,$84
         .byte $00,$c7,$84,$0c,$84,$0c
         .byte $0c,$c3,$00
         .byte $c7,$8c,$0c,$c3,$84
         .byte $00,$c7,$07,$88,$08,$c3
         .byte $84,$00,$c7,$8c,$08,$c3
         .byte $84,$00,$c7,$07,$05,$11
         .byte $c3,$00,$c7,$07,$11,$13
         .byte $c3,$00,$c6,$82,$00,$00
         .byte $c7,$88,$6b,$0c,$c3,$84
         .byte $00,$c7,$8c,$0c,$c3,$84
         .byte $00,$c7,$84,$0c,$84,$0c
         .byte $0c,$c3,$00
         .byte $c7,$8c,$0c,$c3,$84
         .byte $00,$c7,$07,$88,$08,$c3
         .byte $84,$00,$c7,$8c,$08,$c3
         .byte $84,$00,$c7,$07,$05,$11
         .byte $c3,$00,$c7,$07,$11,$13
         .byte $c3,$00,$c6,$82,$00,$00
         .byte $c7,$8c,$6b,$08,$08
         .byte $c3
         .byte $84,$00,$c7,$05,$07,$0b
         .byte $0e,$11,$88,$13,$c3,$00
         .byte $ff
//---------------------------------------
b8:       .byte $c4,$84,$00,$ca,$69,$24
         .byte $26,$c4,$00,$00,$ca,$24
         .byte $26,$24,$ff
//---------------------------------------
b9:       .byte $fe,$f4
         .byte $cb,$84,$60,$30,$cc
         .byte $30,$cb,$6d,$2b,$cc,$2b
         .byte $cd,$88,$62,$2b,$cb,$84
         .byte $6c,$2b,$65,$27,$e4
         .byte $ce,$27,$e4,$cc,$27,$e4
         .byte $cf,$82,$41,$43,$3f,$3e
         .byte $d0,$84,$3c,$cb,$60,$30
         .byte $cc,$30,$cb,$65,$2c,$cc
         .byte $2c,$cd,$88,$61,$2c,$cb
         .byte $84,$6f,$27,$cd,$8c,$61
         .byte $2c,$cb,$84,$60,$30

         .byte $cd,$88,$61,$2e,$84,$63
         .byte $35,$64,$32,$61,$2e

         .byte $cb,$84,$60,$30,$cc
         .byte $30,$cb,$6d,$2b,$cc,$2b
         .byte $cd,$88,$62,$2b,$cb,$84
         .byte $6c,$2b,$65,$27,$e4
         .byte $ce,$27,$e4,$cc,$27,$e4
         .byte $cf,$82,$41,$43,$3f,$3e
         .byte $d0,$84,$3c,$cb,$60,$30
         .byte $cc,$30,$cb,$65,$2c,$cc
         .byte $2c,$cd,$88,$61,$2c,$cb
         .byte $84,$6f,$27,$cd,$8c,$61
         .byte $2c,$cb,$84,$60,$30

         .byte $cd,$8c,$61,$2e,$88,$63
         .byte $29,$a0,$27,$90,$6d,$26
         .byte $88,$63,$26,$d1,$fd,$03
         .byte $43,$08,$ff
//---------------------------------------
b10:      .byte $d2
         .byte $88,$1f,$1f,$22
         .byte $1f,$1f,$1f,$22
         .byte $1f,$ff
//---------------------------------------
b11:      .byte $e4,$d2
         .byte $88,$1d,$20,$20
         .byte $1d,$1d,$20,$20
         .byte $84,$1d,$ff
//---------------------------------------
b12:      .byte $fe,$f4,$d2,$86,$6b
         .byte $13,$d3
         .byte $82,$1f,$d5,$84,$00,$d2
         .byte $13,$88,$13,$d4,$84,$00
         .byte $d3,$1f,$d2,$86,$13,$d3
         .byte $82,$1f,$d5,$84,$00,$d2
         .byte $13,$88,$13,$d4,$84,$00
         .byte $d3,$1f,$d2,$86,$11,$d3
         .byte $82,$1d,$d5,$84,$00,$d2
         .byte $11,$86,$11,$d3,$82,$1d
         .byte $d4,$84,$00,$d3,$1d,$d2
         .byte $88,$11,$d5,$84,$00,$d2
         .byte $11,$88,$11,$d4,$84,$00
         .byte $d3,$1d,$d2,$88,$0c,$d5
         .byte $84,$00,$d2,$0c,$88,$0c
         .byte $d4,$84,$00,$d3,$18,$d2
         .byte $86,$0c,$d3,$82,$18,$d5
         .byte $84,$00,$d2,$0c,$88,$0c
         .byte $d4,$84,$00,$d3,$18,$d2
         .byte $88,$0e,$d5,$84,$00,$d2
         .byte $0e,$88,$0e,$d4,$84,$00
         .byte $d3,$1a,$d2,$86,$0e,$d3
         .byte $82,$1a,$d5,$84,$00,$d2
         .byte $0e,$88,$0e,$d4,$84,$00
         .byte $d5,$00,$ff
//---------------------------------------
b13:      .byte $fb,$d6,$81,$30,$fb,$31
         .byte $96,$32,$86,$2b,$82,$35
         .byte $e2,$86,$37,$84,$35,$82
         .byte $32,$e2,$84,$31,$30,$2e
         .byte $2b,$81,$30,$31,$96,$30
         .byte $84,$32,$e2,$fb,$81,$2b
         .byte $fb,$2c,$83,$2d,$e1,$84
         .byte $2d,$e4,$39,$e4,$35,$30
         .byte $d7,$88,$33,$fb,$84,$33
         .byte $82,$30,$fb,$84,$33,$82
         .byte $30,$fb,$84,$33,$82,$30
         .byte $fb,$84,$35,$82,$37,$d8
         .byte $86,$48,$d7,$84,$33,$82
         .byte $30,$fb,$84,$33,$82,$30
         .byte $fb,$84,$33,$82,$30,$fb
         .byte $33,$30,$fb,$84,$35,$37

         .byte $d6,$81,$37,$fb,$38
         .byte $fb,$9b,$39,$fb,$81,$38
         .byte $fb,$37,$fb,$35,$d7,$90
         .byte $32,$d8,$84,$48,$40,$3c
         .byte $38

         .byte $fb,$d6,$81,$30,$fb,$31
         .byte $96,$32,$86,$2b,$82,$35
         .byte $e2,$86,$37,$84,$35,$82
         .byte $32,$e2,$84,$31,$30,$2e
         .byte $2b,$81,$30,$31,$96,$30
         .byte $84,$32,$e2,$fb,$81,$2b
         .byte $fb,$2c,$83,$2d,$e1,$84
         .byte $2d,$e4,$39,$e4,$35,$30
         .byte $d7,$88,$33,$fb,$84,$33
         .byte $82,$30,$fb,$84,$33,$82
         .byte $30,$fb,$84,$33,$82,$30
         .byte $fb,$84,$35,$82,$37,$d8
         .byte $86,$48,$d7,$84,$33,$82
         .byte $30,$fb,$84,$33,$82,$30
         .byte $fb,$84,$33,$82,$30,$fb
         .byte $33,$30,$fb,$84,$35,$37

         .byte $d6,$81,$37,$fb
         .byte $38,$fb,$9b,$39,$fb,$81
         .byte $3a,$fb,$3c,$fb,$3d,$d6
         .byte $90,$3e,$d8,$84,$38,$3c
         .byte $40,$48,$ff
//---------------------------------------
b14:      .byte $d9,$98,$60,$2b,$86,$62
         .byte $26,$92,$60,$2b,$86,$6c
         .byte $29,$65,$29,$84,$62,$26
         .byte $98,$61,$29,$86,$64
         .byte $28,$92,$61,$29,$fb,$88
         .byte $63,$24,$fb,$6b,$24
         .byte $86,$60,$24,$65,$27,$62
         .byte $2b,$65,$27,$84,$60,$24
         .byte $65,$27,$86,$60,$24,$65
         .byte $27,$62,$2b,$65,$27,$84
         .byte $60,$24,$65,$27,$a0,$60
         .byte $26,$fb,$98,$65,$29
         .byte $88,$70,$2b,$ff
//---------------------------------------
b15:      .byte $fe,$f4,$da,$86,$0a,$82
         .byte $0c,$c3,$84,$00,$da,$07
         .byte $0a,$82,$0a,$0c,$c3,$84
         .byte $00,$da,$82,$05,$07,$86
         .byte $0a,$82,$0c,$c3,$84,$00
         .byte $da,$82,$0a,$0c,$84,$0f
         .byte $82,$10,$0c,$c3,$84,$00
         .byte $da,$82,$05,$07,$da,$86
         .byte $0a,$82,$0c,$c3,$84,$00
         .byte $da,$07,$0a,$82,$0a,$0c
         .byte $c3,$84,$00,$da,$82,$05
         .byte $07,$86,$0a,$82,$0c,$c3
         .byte $84,$00,$da,$82,$0a,$0c
         .byte $84,$13,$82,$10,$0c,$c3
         .byte $84,$00,$da,$84,$00,$ff
//---------------------------------------
b16:      .byte $c4,$84,$00,$d4,$00,$e4
         .byte $d4,$00,$c4,$00,$d4
         .byte $00,$e4,$d4,$00,$c4
         .byte $00,$d4,$00,$e4,$d4
         .byte $00,$c4,$00,$00,$e4
         .byte $d4,$82,$00,$00,$ff
//---------------------------------------
b17:      .byte $f0,$db,$82,$4f
         .byte $4f,$4f,$4f,$f8
         .byte $db,$82,$4f,$4f,$4f,$4f
         .byte $e8,$ff
//---------------------------------------
b18:      .byte $00
//---------------------------------------
b19:      .byte $00
//---------------------------------------
b20:      .byte $00
//---------------------------------------
b21:      .byte $00
//---------------------------------------
b22:      .byte $00
//---------------------------------------
         .byte $00,$00,$00,$00
//---------------------------------------
         .text " "
         .text " - maniac-mix by"
         .text " trooper/rd -  "
//---------------------------------------


