.pc =$0801 "Basic Upstart Program"
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
         .byte $06,$fb
f1955:    .byte <e1,<e2,<e3,<e4
         .byte <e5,<e6
f195b:    .byte >e1,>e2,>e3,>e4
         .byte >e5,>e6
f1961:    .byte <d7,<d8,<d9,<e2
         .byte <e4
f1966:    .byte >d7,>d8,>d9,>e2
         .byte >e4
f196b:    .byte <q1,<q2,<q3,<q4
         .byte <q5,<q6,<q7,<q8
         .byte <q9,<q10,<q11,<q12
         .byte <q13,<q14,<q15,<q16
         .byte <q17,<q18,<q19,<q20
         .byte <q21,<q22,<q23,<q24
         .byte <q25,<q26,<q27,<q28
         .byte <d2,<d4,<d6,<d7,<d11
f198b:    .byte >q1,>q2,>q3,>q4
         .byte >q5,>q6,>q7,>q8
         .byte >q9,>q10,>q11,>q12
         .byte >q13,>q14,>q15,>q16
         .byte >q17,>q18,>q19,>q20
         .byte >q21,>q22,>q23,>q24
         .byte >q25,>q26,>q27,>q28
         .byte >d2,>d4,>d6,>d7,>d11
f19ab:    .byte <d1,<d3,<d5,<d7,<d10
f19af:    .byte >d1,>d3,>d5,>d7,>d10
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//special-soundeffects...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//snaredrum...
//---------------------------------------
d1:       .byte $00,$41,$41,$41,$30,$fe
//---------------------------------------
d2:       .byte $00,$00,$00,$00,$00,$fe
//---------------------------------------
//high-hat...
//---------------------------------------
d3:       .byte $80,$81,$10,$80,$fe
//- - - - - - - - - - - - - - - - - - - -
d4:       .byte $80,$fc,$24    //81-a6-9f
         .byte $fc,$fe        //00
//---------------------------------------
//bassdrum...
//---------------------------------------
d5:       .byte $80,$81,$11,$41,$40
         .byte $fe
//- - - - - - - - - - - - - - - - - - - -
d6:       .byte $80,$40,$11,$0a,$08,$06
         .byte $04,$03,$02,$01,$fe
//---------------------------------------
//snaredrum 2...
//---------------------------------------
d10:      .byte $00,$81,$11,$41,$80,$80
         .byte $fe
//- - - - - - - - - - - - - - - - - - - -
d11:      .byte $80,$34,$11,$0e,$32,$34
         .byte $fe
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//filters
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
d7:       .byte $10,$a8,$04,$e8,$05,$f8
         .byte $ff
//---------------------------------------
d8:       .byte $30,$58,$04,$ff,$ff
//---------------------------------------
d9:       .byte $10,$a8,$05,$e8,$05,$f8
         .byte $ff
//- - - - - - - - - - - - - - - - - - - -
e1:       .byte $4c
         .byte $01,$04,$40,$01
         .byte $20,$ff
//---------------------------------------
e2:       .byte $79,$01
         .byte $01,$28,$ff
//---------------------------------------
e3:       .byte $38
         .byte $01,$01,$60,$ff
//---------------------------------------
e4:       .byte $df,$01,$0c,$80
         .byte $01,$08,$ff
//---------------------------------------
e5:       .byte $ce
         .byte $01,$01,$80,$ff
//---------------------------------------
e6:       .byte $6a,$01,$01,$08
         .byte $ff
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
q1:       .byte $10,$00,$07,$03,$ff
//---------------------------------------
q2:       .byte $10,$00,$05,$0a,$ff
//---------------------------------------
q3:       .byte $00,$00,$05,$09
         .byte $00,$05,$09
         .byte $00,$05,$09,$fe
//---------------------------------------
q4:       .byte $00,$00,$03,$08
         .byte $00,$03,$08
         .byte $00,$03,$08,$fe
//---------------------------------------
q5:       .byte $00,$00,$05,$0a,$ff
//---------------------------------------
q6:       .byte $00,$00,$03,$07
         .byte $00,$03,$07
         .byte $00,$03,$07,$fe
//---------------------------------------
q7:       .byte $00,$00,$05,$09,$ff
//---------------------------------------
q8:       .byte $00,$00,$03,$07,$ff
//---------------------------------------
q9:       .byte $00,$00,$04,$09
         .byte $00,$04,$09
         .byte $00,$04,$09,$fe
//---------------------------------------
q10:      .byte $10,$00,$03,$08,$ff
//---------------------------------------
q11:      .byte $10,$00,$04,$07,$ff
//---------------------------------------
q12:      .byte $10,$00,$04,$07,$ff
//---------------------------------------
q13:      .byte $10,$00,$03,$08,$ff
//---------------------------------------
q14:      .byte $10,$00,$04,$09,$ff
//---------------------------------------
q15:      .byte $10,$00,$03,$07,$ff
//---------------------------------------
q16:      .byte $10,$0b,$04,$00,$ff
//---------------------------------------
q17:      .byte $10,$0a,$03,$00,$ff
//---------------------------------------
q18:      .byte $10,$0c,$00,$ff
//---------------------------------------
q19:      .byte $30,$0c,$00,$ff
//---------------------------------------
q20:      .byte $50,$0c,$00,$00,$ff
//---------------------------------------
q21:      .byte $30,$00,$02,$03,$05,$ff
//---------------------------------------
q22:      .byte $30,$02,$00,$02,$04,$ff
//---------------------------------------
q23:      .byte $30,$01,$00,$01,$03,$ff
//---------------------------------------
q24:      .byte $30,$02,$03,$02,$00,$ff
//---------------------------------------
q25:      .byte $00,$00,$03,$07,$0c,$ff
//---------------------------------------
q26:      .byte $00,$00,$05,$08,$0c,$ff
//---------------------------------------
q27:      .byte $00,$00,$05,$09,$0c,$ff
//---------------------------------------
q28:      .byte $00,$00,$03,$08,$0c,$ff
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//sounds...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f1ac5:    .byte $08
f1ac6:    .byte $89
f1ac7:    .byte $07
f1ac8:    .byte $08
f1ac9:    .byte $08
f1aca:    .byte $00
f1acb:    .byte $00
f1acc:    .byte $40
//---------------------------------------
s1:       .byte $02,$41,$00
         .byte $d7,$01,$23,$33
         .byte $50
//---------------------------------------
s2:       .byte $05,$21,$00
         .byte $a8,$32,$00,$02
         .byte $54
//---------------------------------------
s3:       .byte $08,$89,$07
         .byte $07,$08,$00,$00
         .byte $30
//---------------------------------------
s4:       .byte $08,$11,$00
         .byte $a5,$f8,$00,$00
         .byte $20
//---------------------------------------
s5:       .byte $02,$21,$02
         .byte $55,$30,$00,$06
         .byte $50
//---------------------------------------
s6:       .byte $09,$41,$00
         .byte $89,$10,$23,$31
         .byte $00
//---------------------------------------
s7:       .byte $0d,$21,$00
         .byte $88,$00,$00,$03
         .byte $04
//---------------------------------------
s8:       .byte $0d,$21,$00
         .byte $89,$30,$00,$00
         .byte $04
//---------------------------------------
s9:       .byte $00,$21,$10
         .byte $59,$10,$00,$00
         .byte $04
//---------------------------------------
s10:      .byte $00,$81,$00
         .byte $84,$f0,$00,$00
         .byte $00
//---------------------------------------
s11:      .byte $03,$41,$08
         .byte $68,$02,$23,$31
         .byte $50
//---------------------------------------
s12:      .byte $02,$41,$08
         .byte $a7,$02,$50,$63
         .byte $50
//---------------------------------------
s13:      .byte $00,$17,$00
         .byte $49,$00,$00,$00
         .byte $00
//---------------------------------------
s14:      .byte $03,$41,$00
         .byte $89,$f0,$00,$11
         .byte $64
//---------------------------------------
s15:      .byte $03,$41,$f9
         .byte $69,$10,$00,$21
         .byte $64
//---------------------------------------
s16:      .byte $08,$41,$00
         .byte $68,$10,$33,$00
         .byte $50
//------------------------------ --------
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
s20:      .byte $0a,$41,$04
         .byte $76,$00,$33,$42
         .byte $80
//---------------------------------------
s21:      .byte $0a,$41,$04
         .byte $76,$00,$33,$02
         .byte $80
//---------------------------------------
s22:      .byte $0a,$41,$02    //ref-sound
         .byte $96,$00,$33,$45
         .byte $80
//---------------------------------------
s23:      .byte $0a,$41,$04
         .byte $7c,$e0,$33,$42
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
f1ba5:    .byte $00,$01,$02,$04
         .byte $02,$02,$02,$28
         .byte $08
f1bae:    .byte $00,$01,$02,$04
         .byte $81,$11,$15,$41
         .byte $51
//---------------------------------------
v1:
v2:
v3:
//---------------------------------------
c1:
c2:
c3:
c4:
c5:
c6:
c7:
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//tracks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f1c42:

t1:
         .byte $90,$08,$8b,$08,$ff

//---------------------------------------
t2:
         .byte $90,$09,$09,$8b,$09,$09
         .byte $ff

//---------------------------------------
t3:
         .byte $90,$0e,$ff

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//blocks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
b1:       .byte $fe,$f1
         .byte $c1,$82,$0c,$0c
         .byte $c2
         .byte $82,$60,$30
         .byte $c4,$00
         .byte $c2,$30
         .byte $30,$c1,$82,$0a,$84
         .byte $0c,$82,$0c
         .byte $c2
         .byte $82,$60,$30
         .byte $c4,$00,$c2,$30
         .byte $30,$c1,$82,$0f,$11
         .byte $ff
//---------------------------------------
b2:       .byte $f0,$f0,$f0,$ff
//---------------------------------------
b3:       .byte $c3,$82,$00,$c5,$30
         .byte $c0,$00,$c5,$30
         .byte $30,$c3,$00,$c0,$00
         .byte $c5,$30,$ff
//---------------------------------------
b4:       .byte $fe,$f1
         .byte $c1,$86,$0c,$82,$18
         .byte $c0,$82,$00
         .byte $c1,$82
         .byte $18,$0a,$0b,$84,$0c
         .byte $82
         .byte $0c,$18
         .byte $c0,$82,$00,$c1
         .byte $82,$0c,$0f
         .byte $10

         .byte $c1,$86,$11,$82,$1d
         .byte $c0,$82,$00
         .byte $c1,$82,$1d,$0f,$10,$11
         .byte $1e,$1b,$1d
         .byte $c0,$82,$00,$c1
         .byte $82,$1b,$16
         .byte $18

         .byte $c1,$86,$0c,$82,$18
         .byte $c0,$82,$00
         .byte $c1,$82
         .byte $18,$0a,$0b,$84,$0c
         .byte $82
         .byte $0c,$18
         .byte $c0,$82,$00,$c1
         .byte $82,$0c,$0f
         .byte $10

         .byte $c1,$86,$11,$82,$1d
         .byte $c0,$82,$00
         .byte $c1,$82,$1d,$0f,$10,$11
         .byte $1e,$1b,$1d
         .byte $c0,$82,$00,$c1
         .byte $82,$1d,$16
         .byte $18

         .byte $c1,$86,$0c,$82,$18
         .byte $c0,$82,$00
         .byte $c1,$82
         .byte $18,$0a,$0b,$84,$0c
         .byte $82
         .byte $0c,$18
         .byte $c0,$82,$00,$c1
         .byte $82,$0c,$0f
         .byte $10

         .byte $c1,$86,$11,$82,$1d
         .byte $c0,$82,$00
         .byte $c1,$82,$1d,$0f,$10,$11
         .byte $1e,$1b,$1d
         .byte $c0,$82,$00,$c1
         .byte $82,$1b,$16
         .byte $18

         .byte $c1,$86,$0c,$82,$18
         .byte $c0,$82,$00
         .byte $c1,$82
         .byte $18,$0a,$0b,$84,$0c
         .byte $82
         .byte $0c,$18
         .byte $c0,$82,$00,$c1
         .byte $82,$0c,$0f
         .byte $10

         .byte $c1,$86,$11,$82,$1d
         .byte $c0,$82,$00
         .byte $c1,$82,$1e,$1b,$1d,$c0
         .byte $00,$00,$84,$00,$82,$00
         .byte $00,$00,$00,$ff
//---------------------------------------
b5:       .byte $c3,$84,$00,$c2,$60,$22
         .byte $c3,$00,$c2,$22
         .byte $c3,$00,$c2,$22
         .byte $c3,$00,$c2,$22
         .byte $c3,$00,$c2,$24
         .byte $c3,$00,$c2,$24
         .byte $c3,$00,$c2,$24
         .byte $c3,$00,$c2,$24,$ff
//---------------------------------------
b6:       .byte $c5,$84,$3a,$3a,$3a,$3a
         .byte $c6,$86,$3a,$c5,$84,$3a
         .byte $82,$3a,$3c,$37,$84,$39
         .byte $35,$37,$82,$39,$c6,$86
         .byte $3a,$c5,$84,$39,$37,$82
         .byte $35,$84,$37,$82,$30,$c6
         .byte $86,$33,$f6,$c7,$84,$62
         .byte $30,$63,$2d,$62,$30,$30
         .byte $c8,$86,$64,$30,$66,$30
         .byte $c7,$84,$65,$30

         .byte $c5,$82,$3a,$3c,$84,$3f
         .byte $3a,$82,$37,$c6,$86,$3a
         .byte $c5,$84,$3c,$82,$33,$30
         .byte $33,$34,$84,$35,$3a,$82
         .byte $35,$36,$37,$c6,$86,$3a
         .byte $c5,$84,$39,$82,$3a,$c6
         .byte $86,$3c,$c7,$84,$62,$2e
         .byte $2e,$2e,$2e,$c8
         .byte $86,$66,$2e
         .byte $c7,$8a,$2e,$84,$62,$30
         .byte $63,$2d,$62,$30,$30,$c8
         .byte $86
         .byte $64,$30,$c7,$66,$30,$84
         .byte $68,$33,$ff
//---------------------------------------
b7:       .byte $c2,$8c,$60,$22,$e8,$86
         .byte $22,$22,$8c,$24,$84,$69
         .byte $21,$88,$61,$24,$60,$24
         .byte $8c,$22,$e8,$86,$22,$22
         .byte $82,$6a,$27,$84,$27,$27
         .byte $82,$27,$84,$27,$88,$27
         .byte $e8,$ff
//---------------------------------------
b8:       .byte $fe,$f1
         .byte $c1,$86,$0c,$82,$18
         .byte $c0,$82,$00
         .byte $c1,$82
         .byte $18,$0a,$0b,$84,$0c
         .byte $82
         .byte $0c,$18
         .byte $c0,$82,$00,$c1
         .byte $82,$0c,$0f
         .byte $10

         .byte $c1,$86,$11,$82,$1d
         .byte $c0,$82,$00
         .byte $c1,$82,$1d,$0f,$10,$11
         .byte $1e,$1b,$1d
         .byte $c0,$82,$00,$c1
         .byte $82,$1b,$16
         .byte $18

         .byte $c1,$86,$0c,$82,$18
         .byte $c0,$82,$00
         .byte $c1,$82
         .byte $18,$0a,$0b,$84,$0c
         .byte $82
         .byte $0c,$18
         .byte $c0,$82,$00,$c1
         .byte $82,$0c,$0e
         .byte $1a,$0f,$84,$0f,$0f,$82
         .byte $0f,$84,$0f,$88,$0f,$03
         .byte $ff
//---------------------------------------
b9:       .byte $c0,$82,$00,$84,$00,$00
         .byte $82,$00,$84,$00,$88,$00
         .byte $82,$00,$00,$00,$00,$ff
//---------------------------------------
b10:      .byte $c9,$84,$67,$32,$32,$32
         .byte $32,$32,$32,$6b,$30,$67
         .byte $31,$32,$32,$32,$32,$32
         .byte $32,$6b,$35,$67,$32,$6c
         .byte $32,$32,$32,$32
         .byte $32,$32,$32,$32
         .byte $32,$32,$32,$32
         .byte $32,$32,$32,$32,$ff
//---------------------------------------
b11:      .byte $c3,$84,$00,$ca,$82,$5c
         .byte $5c,$ff
//---------------------------------------
b12:      .byte $fe,$f1
         .byte $cb,$84,$0e,$82,$0e,$0e
         .byte $84,$1a,$82,$0e,$86,$0e
         .byte $cc,$0c,$cb,$0d

         .byte $84,$0e,$82,$0e,$0e,$84
         .byte $1a,$82,$0e,$86,$0e,$cc
         .byte $0d,$cb,$84,$0c,$82,$18
         .byte $ff
//---------------------------------------
b13:      .byte $fe,$f1
         .byte $cb,$84,$0e,$82,$0e,$0e
         .byte $84,$1a,$82,$0e,$86,$0e
         .byte $82,$0c,$0c,$18,$0c,$19
         .byte $0e

         .byte $84,$0e,$82,$0e,$0e,$84
         .byte $1a,$82,$0e,$86,$0e,$10
         .byte $11,$ff
//---------------------------------------
b14:      .byte $cd,$c0,$fd,$05,$10,$48
         .byte $cd,$c0,$fd,$03,$48,$10
         .byte $ff
//---------------------------------------
b15:      .byte $ce,$86,$6b,$30
         .byte $82,$6e,$32
         .byte $f8,$86,$6b,$30,$82,$6e
         .byte $32,$e8
         .byte $88,$32,$84,$6b,$30
         .byte $cf,$a4,$2e,$f4,$ce,$84
         .byte $30,$30,$82,$30,$6e,$32

         .byte $ce,$86,$6b,$30
         .byte $82,$6e,$32
         .byte $f8,$86,$6b,$30,$82,$6e
         .byte $32,$e8
         .byte $88
         .byte $6d,$35,$84,$6b,$35
         .byte $cf,$a4
         .byte $60,$35,$f4,$ce,$86
         .byte $6b,$3a,$6d,$35,$ff
         .byte $ff
//---------------------------------------
b16:
b17:
b18:
b19:
b20:
b21:
b22:
//---------------------------------------


