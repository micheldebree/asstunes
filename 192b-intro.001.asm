.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)
.encoding "petscii_mixed"

//charles deenen player
//re-assembled by trooper & youth /htw

.var musicloc = $1000
.var musicstore = musicloc
//---------------------------------------
         .pc= musicloc-3
         jmp player

.var f1f      = $1f
.var a20      = $20
.var a21      = $21

init:     jmp mycode
play:     jmp i110f

         .text "music by heatwave "
         .text "player by cd/mon"

a1009:    .byte $00
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
i1059:    sta $d400,x
         dex
         bpl i1059
         stx a1110
         rts
//---------------------------------------
f1063:    .byte 0,7,$0e
a1066:    .byte 0
a1067:    .byte 0
a1068:    .byte 0
f1069:    .byte 0,0,0
f106c:    .byte 0,0,0
f106f:    .byte 0,0,0
f1072:    .byte 0,0,0
f1075:    .byte 0,0,0
f1078:    .byte 0,0,0
f107b:    .byte 0,0,0
f107e:    .byte 0,0,0
f1081:    .byte 0,0,0
f1084:    .byte 0,0,0
a1087:    .byte 0
a1088:    .byte 0
a1089:    .byte 0
a108a:    .byte 0
f108b:    .byte 0,0,0
f108e:    .byte 0
i108f:    .byte 0,0
f1091:    .byte 0,0,0
f1094:    .byte 0,0,0
f1097:    .byte 0,0,0
f109a:    .byte 0,0,0
a109d:    .byte 0
a109e:    .byte 0
a109f:    .byte 0
f10a0:    .byte 0,0,0
f10a3:    .byte 0,0,0
f10a6:    .byte 0,0,0
f10a9:    .byte 0,0,0
f10ac:    .byte 0,0,0
f10af:    .byte 0,0,0
f10b2:    .byte 0,0,0
f10b5:    .byte 0,0,0
f10b8:    .byte 0,0,0
f10bb:    .byte 0,0,0
f10be:    .byte 0,0,0
a10c1:    .byte 0,0,0
f10c4:    .byte 0,0,0
f10c7:    .byte 0,0,0
f10ca:    .byte 0,0,0
f10cd:    .byte 0
a10ce:    .byte 0
f10cf:    .byte 0
a10d0:    .byte 0
a10d1:    .byte 0
f10d2:    .byte 0,0,0
a10d5:    .byte 0
f10d6:    .byte 0,0,0
f10d9:    .byte 0,0,0
f10dc:    .byte 0,0,0
f10df:    .byte 0,0,0
f10e2:    .byte 0,0,0
f10e5:    .byte 0,0,0
f10e8:    .byte 0,0,0
f10eb:    .byte 0,0,0
f10ee:    .byte 0,0,0
         .byte 0,0,0
f10f4:    .byte 0,0,0
//---------------------------------------
mycode:   sta i10f7+1
i10f7:    lda #$00
i10f9:    jmp i100a
         bpl i108f
         sta $d404,x
         sta $d400,x
         sta $d401,x
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
         lda (a20),y
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
         lda (a20),y
         sta a1844
         iny
         lda (a20),y
         sta a1068
i11fd:    cmp #$fd
         bne i1225
i1201:    iny
         lda (a20),y
         and #$0f
         sta f10bb,x
         lda (a20),y
         lsr
         lsr
         lsr
         lsr
         sta f10be,x
         iny
         lda (a20),y
         sta a1068
         iny
         lda (a20),y
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
         lda (a20),y
         sta a1009
         iny
         lda (a20),y
         sta a1068
i123d:    cmp #$fb
         bne i124c
         lda #$00
         sta f10ca,x
         iny
         lda (a20),y
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
         lda (a20),y
         cmp #$fd
         bne i128a
         jmp i1201
i128a:    sta a1068
i128d:    cmp #$80
         bcc i12b2
         sbc #$81
         sta f10eb,x
i1296:    iny
         lda (a20),y
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
         lda (a20),y
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
         lda (a20),y
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
         lda (a20),y
         cmp #$ff
         bne i14d0
         ldy #$00
         lda (a20),y
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
         lda (a20),y
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
         lda (a20),y
         jmp i1665
.label a1621    = *+1
i1620:    lda #$ff
         bmi i166b
         dec a109e
         bne i164e
i1629:    ldy a109f
         lda (a20),y
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
         lda (a20),y
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
         sta $d416
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
         lda (a20),y
         and #$0f
         sta a170b
         lda (a20),y
         lsr
         lsr
         lsr
         lsr
         sta a1727
         lda f1084,x
         bne i16b7
         iny
         lda (a20),y
         sta f10d6,x
         bmi i16aa
         lda (a20),y
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
         lda (a20),y
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
         lda (a20),y
i16e4:    sta f10a3,x
         iny
         lda (a20),y
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
         lda (a20),y
         cmp #$ff
         bne i17e3
         ldy #$00
         lda (a20),y
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
         sta $d406,y
         lda f1075,x
         sta $d405,y
         lda f10d2,x
         and f107b,x
         sta $d404,y
         lda f1072,x
         sta $d403,y
         lda f106f,x
         sta $d402,y
         lda a108a
         and #$01
         beq i1827
         lda f1069,x
         clc
         adc #$ff
         jmp i182b
i1827:    lda f1069,x
         clc
i182b:    sta $d400,y
         lda f106c,x
         adc #$00
         sta $d401,y
         dex
         bmi i183c
         jmp i1142
.label a183d    = *+1
i183c:    lda #$0f
.label a183f    = *+1
         ora #$30
         sta $d418
.label a1844    = *+1
         lda #$f2
         sta $d417
f1848:    rts
//---------------------------------------
//           FREQUENCY TABLES
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
//        BLOCK POINTERS
//---------------------------------------
f1907:
.label f1908    = *+1

         .byte <b00,>b00,<b01,>b01
         .byte <b02,>b02,<b03,>b03
         .byte <b04,>b04,<b05,>b05
//---------------------------------------
f1943:
.label f1944    = *+1

         .byte <t01,>t01
         .byte <t02,>t02
         .byte <t03,>t03
f1949:
.label f194a    = *+1
.label f194b    = *+2

         .byte $02,$00,$fb
//               ^   ^   ^ transpose
//               !   ! finespeed
//               ! speed
//---------------------------------------
//           EGEL POINTERS
//---------------------------------------
f1955:    .byte <e0,<e1,<e2,<e3,<e4,<e5
f195b:    .byte >e0,>e1,>e2,>e3,>e4,>e5
//---------------------------------------
//          FILTER POINTERS
//---------------------------------------
f1961:    .byte <f1,<f2,<f3
f1966:    .byte >f1,>f2,>f3
//---------------------------------------
//         ARPEGGIO POINTERS
//---------------------------------------

f196b:    .byte <q00,<q01,<q02,<q03
         .byte <q04,<q05,<q06,<q07
         .byte <q08,<q09,<q0a,$00
         .byte 0,0,0,0
         .byte 0,0,0,0
         .byte 0,0,0,0
         .byte 0,0,0,0


         .byte <d1,<d3,<d5,$00,<d7

f198b:    .byte >q00,>q01,>q02,>q03
         .byte >q04,>q05,>q06,>q07
         .byte >q08,>q09,>q0a,$00
         .byte 0,0,0,0
         .byte 0,0,0,0
         .byte 0,0,0,0
         .byte 0,0,0,0

         .byte >d1,>d3,>d5,$00,>d7
//---------------------------------------
//         DRUMSOUND POINTERS
//---------------------------------------
f19ab:    .byte <d0,<d2,<d4,$00,<d6
f19af:    .byte >d0,>d2,>d4,$00,>d6
//---------------------------------------
//snaredrum...
d0:       .byte $84,$81,$11,$41,$40,$80
         .byte $10,$ff
d1:       .byte $84,$d0,$11,$0e,$0b,$d0
         .byte $0c,$d0,$0d,$ff

//high-hat...
d2:       .byte $00,$81,$11,$10
         .byte $fe
d3:       .byte $80,$d0,$11,$16,$13,$11
         .byte $0f,$0e,$0c,$0a,$07,$05
         .byte $fe

//bassdrum...
d4:       .byte $0c,$81,$11,$10,$10
         .byte $10,$10,$00,$fe
d5:       .byte $80,$d0,$10,$0c
         .byte $08,$06,$04,$00,$fe

//snaredrum 2...

d6:       .byte $00,$81,$41,$41,$80,$fe
d7:       .byte $80,$d8,$0e,$0c,$d8,$fe
//---------------------------------------
//filters
//---------------------------------------
f1:       .byte $30,$08,$04,$ff,$ff

f2:       .byte $31,$c8,$00,$ff,$ff

f3:       .byte $31,$74,$ff
//---------------------------------------
//          egels
//---------------------------------------
e0:       .byte $4c
         .byte $01,$04,$40,$01
         .byte $20,$ff
e1:       .byte $79,$01
         .byte $01,$28,$ff
e2:       .byte $38
         .byte $01,$01,$60,$ff
e3:       .byte $df,$01,$0c,$80
         .byte $01,$08,$ff
e4:       .byte $ce
         .byte $01,$01,$80,$ff
e5:       .byte $6a,$01,$01,$08
         .byte $ff
//---------------------------------------
q00:      .byte $20,$00,$03,$07,$ff
q01:      .byte $20,$00,$04,$07,$ff
q02:      .byte $20,$00,$05,$08,$ff
q03:      .byte $20,$00,$05,$09,$ff
q04:      .byte $20,$00,$03,$08,$ff
q05:      .byte $20,$00,$03,$06,$ff
q06:      .byte $20,$05,$09,$0c,$ff
q07:      .byte $10,$00,$02,$06,$ff
q08:      .byte $10,$00,$05,$07,$ff
q09:      .byte $10,$00,$05,$0a,$ff
q0a:      .byte $50,$0c,$00,$ff
//---------------------------------------
//sounds...
//---------------------------------------
f1ac5:    .byte $05
f1ac6:    .byte $21
f1ac7:    .byte $00
f1ac8:    .byte $59
f1ac9:    .byte $30
f1aca:    .byte $00
f1acb:    .byte $03
f1acc:    .byte $84
//---------------------------------------
s1:       .byte $05,$41,$00
         .byte $5d,$f0,$00,$03
         .byte $64

s2:       .byte $08,$11,$08
         .byte $07,$f8,$00,$00
         .byte $30

s3:       .byte $08,$11,$05
         .byte $0d,$f8,$00,$00
         .byte $10

s4:       .byte $09,$11,$00
         .byte $39,$38,$00,$02
         .byte $10

s5:       .byte $02,$41,$00
         .byte $7d,$f2,$00,$02
         .byte $54

s6:       .byte $02,$41,$00
         .byte $78,$32,$00,$02
         .byte $54
//---------------------------------------
f1ba5:    .byte $00,$01,$02,$04
         .byte $02,$02,$02,$28
         .byte $08
f1bae:    .byte $00,$01,$02,$04
         .byte $81,$11,$15,$41
         .byte $51
f1c42:
//---------------------------------------
//tracks...
//---------------------------------------
t01:      .byte $8e,$01,$ff

t02:      .byte $9a,$05,$ff

t03:      .byte $8e,$03,$ff
//---------------------------------------
//blocks...
//---------------------------------------
b00:      .byte $f0,$ff
b01:      .byte $fe,$f1
         .byte $c6,$8c,$6a
         .byte $11,$94,$10
         .byte $8c,$0e,$94,$0c,$a0
         .byte $0a,$0c,$c5,$c0,$11,$ff
//---------------------------------------
b02:      .byte $f0,$f0,$f0,$f0,$ff
//---------------------------------------
b03:      .byte $fe,$f1
         .byte $c2,$8c,$00,$94,$00,$8c
         .byte $00,$94,$00,$a0,$00,$00
         .byte $c3,$c0,$00,$ff
//---------------------------------------
b04:
//---------------------------------------
b05:      .byte $c0,$8c,$63,$24,$94
         .byte $61,$24
         .byte $8c,$62
         .byte $21
         .byte $94,$63,$1f,$a0,$1d,$1f
         .byte $c1,$c0,$66,$18

         .byte $8c,$63,$24,$94
         .byte $61,$24
         .byte $8c,$62
         .byte $21
         .byte $94,$63,$1f,$a0,$1d,$1f
         .byte $c1,$c0,$66,$24

         .byte $ff

//---------------------------------------
player:
//---------------------------------------
         jsr $ff81
         ldx #$00
         stx $d020
         stx $d021

dodo:     lda mess,x
         beq dada
         jsr $ffd2
         inx
         bne dodo
dada:
         ldy #>musicloc
         ldx #<musicloc
         jsr printhex
         lda #'-'
         jsr $ffd2
         ldy #>player
         ldx #<player
         jsr printhex
         lda #'/'
         jsr $ffd2
         ldy #>init
         ldx #<init
         jsr printhex
         lda #','
         jsr $ffd2
         ldy #>play
         ldx #<play
         jsr printhex
         sei
         lda #$00
         jsr init
door:     lda #$62
daar:     cmp $d012
         bne daar
         dec $d020
         jsr play
         inc $d020
         lda $dc01
         and #$04
         bne door
         jmp $9000

printhex: lda #'$'
         jsr $ffd2
         jsr printbyte
         txa
         tay
         jsr printbyte
         rts
printbyte:
sla:
         tya
         pha
         lsr
         lsr
         lsr
         lsr
         tay
         lda hex,y
         jsr $ffd2
         pla
         and #$0f
         tay
         lda hex,y
         jsr $ffd2
         rts

hex:      .text "0123456789abcdef"
mess:
         .text "{clear}{light gray}song: {white}intro{light gray}"
         .byte $0d
         .text "{light gray}composed by {white}heatwave"
         .text " {light gray}in 1995"
         .byte $0d
         .text "player by charles "
         .text "deenen"
         .byte $0d
         .text "player adapted by "
         .text "{white}youth{light gray}"
         .byte $0d,$0d
         .text "for demonstration "
         .text "purposes {white}only{light gray}..."
         .byte $0d
         .text "do {white}not{light gray} use this, "
         .text "it's not finished yet!"
         .byte $0d,$0d,$00

