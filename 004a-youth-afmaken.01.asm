.pc =$0801 "Basic Upstart Program"
:BasicUpstart($0ffd)
.encoding "petscii_mixed"

//charles deenen player
//re-assembled by trooper & youth /htw

.var musicloc = $1000
.var musicstore = musicloc
//---------------------------------------
         .pc= musicloc-3
         //.offs musicstore-musicloc //TODO: Replace .pc + .offs with .pseudopc block
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
i134a:    lda wav,y
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
         lda wav,y
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
         .byte <b06,>b06,<b07,>b07
         .byte <b08,>b08,<b09,>b09
         .byte <b0a,>b0a,<b0b,>b0b
         .byte <b0c,>b0c,<b0d,>b0d
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

         .byte <t11,>t11
         .byte <t12,>t12
         .byte <t13,>t13

         .byte $02,$00,$fb

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
         .byte <q08,<q09,<q0a,<q0b
         .byte <q0c,<q0d,<q0e,<q0f
         .byte <q10,<q11,<q12,<q13
         .byte <q14,<q15,<q16,<q17
         .byte <q18,<q19,<q20,<q21

         .byte <d1,<d3,<d5,$00,<d7

f198b:    .byte >q00,>q01,>q02,>q03
         .byte >q04,>q05,>q06,>q07
         .byte >q08,>q09,>q0a,>q0b
         .byte >q0c,>q0d,<q0e,>q0f
         .byte >q10,>q11,>q12,>q13
         .byte >q14,>q15,>q16,>q17
         .byte >q18,>q19,>q20,>q21


         .byte >d1,>d3,>d5,$00,>d7
//---------------------------------------
//         DRUMSOUND POINTERS
//---------------------------------------
f19ab:    .byte <d0,<d2,<d4,$00,<d6
f19af:    .byte >d0,>d2,>d4,$00,>d6
//---------------------------------------
//            DRUMSOUNDS
//---------------------------------------
//  snare

//1e byte = meeverander

d0:       .byte $00,$41,$41,$41,$41,$21
         .byte $10,$fe
d1:       .byte $00,$00,$00,$05,$05,$09
         .byte $09,$ff
//  hat
d2:       .byte $00,$81,$11,$80,$10
         .byte $80,$10,$80,$fe
d3:       .byte $80,$fc,$18,$fc,$18
         .byte $fc,$18,$fc,$fe
//  base
d4:       .byte $0c,$41,$11,$11,$11
         .byte $11,$10,$fe
d5:       .byte $80,$0c,$10,$0a
         .byte $08,$05,$03,$fe
//snare2
d6:       .byte $00,$81,$40,$80,$fe
d7:       .byte $80,$40,$0f,$40,$fe
//---------------------------------------
//            FILTERS
//---------------------------------------
f1:       .byte $10,$a1,$05,$e8,$05,$f8
         .byte $ff
f2:       .byte $31,$88,$00,$ff,$ff
f3:       .byte $11,$28,$00,$ff
         .byte $ff
//---------------------------------------
//              EGELS
//---------------------------------------
e0:       .byte $4c,$01,$04,$40,$01
         .byte $20,$ff

e1:       .byte $79,$01,$01,$28,$ff

e2:       .byte $38,$01,$01,$60,$ff

e3:       .byte $df,$01,$0c,$80,$01
         .byte $08,$ff

e4:       .byte $ce,$01,$01,$80,$ff

e5:       .byte $6a,$01,$01,$08,$ff
//---------------------------------------
//              ARPEGGIOS
//---------------------------------------
// speed,notes,$ff/$fe

q00:      .byte $01,$00,$03,$07,$0a,$ff
q01:      .byte $01,$00,$03,$05,$09,$ff
q02:      .byte $00,$00,$05,$09,$ff
//---------------------------------------
q03:      .byte $01,$00,$05,$0c,$ff
q04:      .byte $10,$08,$03,$0c,$ff
q05:      .byte $10,$00,$03,$06,$ff
q06:      .byte $10,$00,$02,$07,$ff
q07:      .byte $10,$00,$02,$06,$ff
q08:      .byte $10,$00,$05,$07,$ff
q09:      .byte $10,$00,$05,$0a,$ff
q0a:      .byte $50,$0c,$00,$0c,$ff
q0b:      .byte $10,$00,$03,$0a,$ff
q0c:      .byte $20,$00,$03,$07,$ff
q0d:      .byte $20,$00,$04,$07,$ff
q0e:      .byte $10,$0b,$05,$00,$ff
q0f:      .byte $10,$0b,$04,$00,$ff
q10:      .byte $10,$0a,$03,$00,$ff
q11:      .byte $10,$0c,$00,$ff
q12:      .byte $30,$0c,$00,$ff
q13:      .byte $50,$0c,$00,$00,$ff
q14:      .byte $30,$00,$02,$03,$05,$ff
q15:      .byte $30,$02,$00,$02,$04,$ff
q16:
q17:
q18:
q19:
q20:
q21:
//---------------------------------------
//              SOUNDS
//---------------------------------------
f1ac5:          // pulse
.label wav    = *+1 // waveform
.label f1ac7    = *+2 // attack/decay
.label f1ac8    = *+3 // sustain/release
.label f1ac9    = *+4 // len/fil+drum
.label f1aca    = *+5 // vibrato
.label f1acb    = *+6 // vibrato/pulse
.label f1acc    = *+7 // fx $x4=tringle

//last byte $10-$40 = drum
//          $50-$90 = pluck
//              $.4 = arpeggio

c00:      .byte $08,$89,$09,$f9//base
         .byte $08,$00,$00,$30

c01:      .byte $08,$89,$00,$65//hihat
         .byte $f8,$00,$00,$20

c02:      .byte $13,$41,$00,$a5//bass1
         .byte $01,$23,$40,$60

c03:      .byte $08,$89,$00,$e5//snare2
         .byte $0a,$00,$00,$40

c04:      .byte $15,$21,$03,$a5//chord
         .byte $20,$00,$37,$74

c05:      .byte $15,$71,$00,$d5//bass2
         .byte $01,$23,$20,$80

c06:      .byte $08,$89,$07,$07//snare2
         .byte $fa,$00,$00,$40

c07:      .byte $13,$41,$00,$ba//bass3
         .byte $13,$23,$20,$60

c08:      .byte $02,$41,$00,$38
         .byte $00,$22,$04,$60

c09:      .byte $0e,$21,$00,$18
         .byte $00,$34,$00,$60

c0a:      .byte $00,$11,$00,$37
         .byte $00,$22,$00,$50

c0b:      .byte $08,$11,$00,$15
         .byte $f8,$00,$00,$40

c0c:      .byte $08,$11,$00,$35
         .byte $f8,$00,$00,$40

c0d:      .byte $08,$11,$00,$55
         .byte $f8,$00,$00,$40

c0e:      .byte $0c,$41,$00,$38
         .byte $10,$00,$03,$64

c0f:      .byte $0c,$11,$00,$38
         .byte $10,$00,$03,$84

c10:      .byte $0c,$21,$00,$18
         .byte $10,$00,$03,$04

c11:      .byte $00,$15,$00,$9a
         .byte $f0,$03,$00,$74
//---------------------------------------
//            PLUCKS
//---------------------------------------
f1ba5:    .byte $00,$01,$02,$04
//len
         .byte $02,$02,$02,$02
         .byte $08

f1bae:    .byte $00,$01,$02,$04
//waveform
         .byte $81,$71,$11,$41
         .byte $51
//---------------------------------------
//            TRACKS
//---------------------------------------
f1c42:
       // $70+x = repeat x+1
       // $80+x = transpose

t11:
t01:      .byte $8c,$02,$03,$02,$04,$ff

//---------------------------------------
t12:
t02:      .byte $8c,$01,$05,$01,$06,$ff

//---------------------------------------
t13:
t03:      .byte $98,$00,$ff

//---------------------------------------
//              BLOCKS
//---------------------------------------

         // $60+x arpeggio on
         // $80+x dur
         // $c0+x sound
         // $e0+x pause
         // $fb   legato
         // $fd,spd,note1,note2 glide
         // $fe,$f1 = filter track 1
         //     $f3 =        track 2
         //     $f5 =        track 3

b00:      .byte $f0,$f0,$f0,$f0,$ff
//---------------------------------------
b01:      .byte $c0,$84,$00,$c4,$82,$60
         .byte $30,$c1,$00
         .byte $c0,$00,$c4,$82,$62,$2e
         .byte $c1,$00
         .byte $c4,$60,$30
         .byte $c0,$82,$00,$c4,$82,$30
         .byte $62,$2e
         .byte $60,$30,$c0,$82,$00,$c1
         .byte $00,$c4,$82,$62
         .byte $2e,$60,$30
         .byte $c0,$84,$00,$c4,$30
         .byte $c0,$82,$00,$c4,$62,$2e
         .byte $c1
         .byte $00,$c4
         .byte $60,$30
         .byte $c0,$82,$00,$c4,$82,$30
         .byte $62,$2e
         .byte $60,$30,$c0,$00,$c1
         .byte $00,$c4,$62,$2e
         .byte $60,$30,$ff
//---------------------------------------
b02:      .byte $fe,$f1
         .byte $c2,$84,$0c,$c5,$82,$18
         .byte $c2,$0c
         .byte $c3,$00,$c2,$24
         .byte $c5,$12,$c2,$84
         .byte $13
         .byte $c2,$82,$18,$c5,$0a,$c2
         .byte $16
         .byte $c3,$00,$c5,$16,$c2,$84
         .byte $18

         .byte $84,$0c,$c5,$82,$18
         .byte $c2,$0c
         .byte $c3,$00,$c2,$24
         .byte $c5,$12,$c2,$84
         .byte $13
         .byte $c2,$82,$24,$c5,$16,$c2
         .byte $18
         .byte $c3,$00,$c5,$0c,$c2,$0f
         .byte $c5,$10
         .byte $ff
//---------------------------------------
b03:      .byte $fe,$f1
         .byte $c2,$84,$11,$c5,$82,$1d
         .byte $c2,$11
         .byte $c3,$00,$c2,$29
         .byte $c5,$0c,$c2,$84
         .byte $0f
         .byte $c2,$82,$10,$c5,$1d,$c2
         .byte $11
         .byte $c3,$00,$c5,$1d,$c2,$84
         .byte $0f

         .byte $84,$11,$c5,$82,$1d
         .byte $c2,$11
         .byte $c3,$00,$c2,$29
         .byte $c5,$0f,$c2,$84
         .byte $0f
         .byte $c2,$82,$13,$c5,$18,$c2
         .byte $1d
         .byte $c3,$00,$c5,$1b,$c2,$16
         .byte $c6,$00
         .byte $ff
//---------------------------------------
b04:      .byte $fe,$f1
         .byte $c2,$84,$11,$c5,$82,$1d
         .byte $c2,$11
         .byte $c3,$00,$c2,$29
         .byte $c5,$0c,$c2,$84
         .byte $0f
         .byte $c2,$82,$10,$c5,$1d,$c2
         .byte $11
         .byte $c3,$00,$c5,$1d,$c2,$84
         .byte $0f

         .byte $fe,$f1
         .byte $c2
         .byte $84,$11,$c5,$82,$1d
         .byte $c2,$11
         .byte $c3,$00,$c2,$29
         .byte $c5,$83,$0c,$e1
         .byte $c7,$87
         .byte $0f,$e1
         .byte $87,$0e,$e1
         .byte $ff
//---------------------------------------
b05:      .byte $c0,$84,$00,$c4,$82,$61
         .byte $30,$c1,$00
         .byte $c0,$00,$c4,$82,$62,$30
         .byte $c1,$00
         .byte $c4,$61,$30
         .byte $c0,$82,$00,$c4,$82,$30
         .byte $62,$30
         .byte $61,$30,$c0,$82,$00,$c1
         .byte $00,$c4,$82,$62
         .byte $30,$61,$30
         .byte $c0,$84,$00,$c4,$30
         .byte $c0,$82,$00,$c4,$62,$30
         .byte $c1
         .byte $00,$c4
         .byte $61,$30
         .byte $c0,$82,$00,$c4,$82,$30
         .byte $62,$30
         .byte $61,$30,$c0,$00,$c1
         .byte $00,$c4,$62,$30
         .byte $61,$30,$ff
//---------------------------------------
b06:      .byte $c0,$84,$00,$c4,$82,$61
         .byte $30,$c1,$00
         .byte $c0,$00,$c4,$82,$62,$30
         .byte $c1,$00
         .byte $c4,$61,$30
         .byte $c0,$82,$00,$c4,$82,$30
         .byte $62,$30
         .byte $61,$30,$c0,$82,$00,$c1
         .byte $00,$c4,$82,$62
         .byte $30,$61,$30
         .byte $c0,$84,$00,$c4,$30
         .byte $c0,$82,$00,$c4,$62,$30
         .byte $c1
         .byte $00,$c4
         .byte $61,$30
         .byte $c0,$88,$00,$00,$ff
//---------------------------------------
b07:      .byte $c2,$84,$00,$00,$00,$82
         .byte $00,$86,$00
         .byte $cb,$82,$00,$00
         .byte $cb,$00
         .byte $cc,$00
         .byte $cd,$00
         .byte $c5,$00,$ff

b08:
         .byte $c7
         .byte $82,$37,$33,$30
         .byte $37,$33,$30
         .byte $33,$35
         .byte $c8
         .byte $86,$fd,$06,$32,$33
         .byte $c7
         .byte $82,$30

         .byte $d1,$88,$6a,$3c

         .byte $ca
         .byte $82,$45,$84,$46
         .byte $82,$3e,$84,$3f
         .byte $82,$39,$84,$3a
         .byte $82,$32,$84,$33

         .byte $c8
         .byte $84,$fd,$08,$35,$37
         .byte $c7,$82,$36,$35
         .byte $ea

         .byte $ca,$82,$3c,$3e,$3f
         .byte $81,$41,$fb,$85,$43
         .byte $82,$41

         .byte $c7,$82
         .byte $30,$33,$35,$36,$37
         .byte $33,$35,$37,$3a
         .byte $37,$36,$35,$3a,$3c
         .byte $3f,$37,$35
         .byte $30,$32,$33

         .byte $ff
b09:


b0a:
b0b:
b0c:
b0d:

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
         .byte $93,$9b
         .text "song: "
         .byte $05
         .text "splash"
         .byte $0d,$9b
         .text "composed by "
         .byte $05
         .text "heatwave"
         .byte $9b
         .text " in 1995"
         .byte $0d
         .text "player by charles "
         .text "deenen"
         .byte $0d
         .text "player adapted by "
         .byte $05
         .text "youth"
         .byte $9b,$0d,$0d
         .text "for demonstration "
         .text "purposes "
         .byte $05
         .text "only"
         .byte $9b
         .text "..."
         .byte $0d
         .text "do "
         .byte $05
         .text "not"
         .byte $9b
         .text " use this, "
         .text "it's not finished yet!"
         .byte $0d,$0d,$00


