* =$0801
:BasicUpstart(player)
         .pc= $4000
player:
         sei
         lda #$00
         jsr $1000
bk:       lda #$62
p1:       cmp $d012
         bne p1
         dec $d020
         jsr $1006
         inc $d020
         lda $dc01
         and #4
         bne bk
         jmp $9000
//---------------------------------------

         .pc= $1000

//---------------------------------------
.var fd400    = $d400
.var fd401    = $d401
.var fd402    = $d402
.var fd403    = $d403
.var fd404    = $d404
.var fd405    = $d405
.var fd406    = $d406
//---------------------------------------
.var afd      = $fd
.var afe      = $fe
.var aff      = $ff
.var ad416    = $d416
.var ad417    = $d417
.var ad418    = $d418
//---------------------------------------
.var p84      = $84
.var pfd      = $fd
//---------------------------------------
         jmp i158c
         jmp i1592
         lda #$1f
         sta ad418
         bit a1619
         bmi i1044
         bvs i1043
         ldx #$02
i1014:    lda #$01
         sta f159e,x
         lda #$00
         sta f1601,x
         sta f160d,x
         sta f160a,x
         sta f15e6,x
         sta f15cb,x
         sta f15aa,x
         dex
         bpl i1014
         ldy #$14
i1032:    sta fd400,y
         dey
         bpl i1032
         lda a1616
         sta a1618
         lda #$80
         sta a1619
i1043:    rts
i1044:    ldx #$02
         dec a1618
         bpl i105a
         dec f159e
         dec a159f
         dec a15a0
         lda a1616
         sta a1618
i105a:    lda #$00
         sta a161c
i105f:    lda f161d,x
         sta a161a
         lda f159e,x
         bpl i106d
         jmp i10ea
i106d:    bne i107b
         lda a1618
         beq i10b6
         cmp #$03
         bcs i107b
         jmp i107e
i107b:    jmp i123e
i107e:    lda f1607,x
         bne i10b3
         lda a1616
         cmp #$03
         bcs i108f
         lda f15d1,x
         beq i109e
i108f:    lda a1618
         cmp #$02
         beq i10ae
         lda #$00
         sta f15c8,x
         jmp i123e
i109e:    lda a1618
         bne i10b3
         ldy f15aa,x
         lda f16e4,y
         and #$f0
         sta f15c8,x
i10ae:    lda #$fe
         sta f15cb,x
i10b3:    jmp i123e
i10b6:    lda f1610,x
         sta afd
         lda f1613,x
         sta afe
         ldy f1601,x
i10c3:    lda (pfd),y
         bpl i10e0
         cmp #$ff
         bne i10d0
         ldy #$00
         jmp i10c3
i10d0:    cmp #$fe
         bne i10d7
         jmp i1592
i10d7:    and #$1f
         sta f15a7,x
         iny
         jmp i10c3
i10e0:    sta f1604,x
         tya
         sta f1601,x
         jmp i123e
i10ea:    lda #$00
         sta f160a,x
         sta f15e6,x
         sta f15b3,x
         cmp f1607,x
         bne i110e
         sta f15ce,x
         sta f1598,x
         sta f159b,x
         sta f15bc,x
         sta f15a4,x
         lda #$09
         sta f15c5,x
i110e:    ldy f1604,x
         lda f180c,y
         sta afd
         lda f1822,y
         sta afe
         ldy f160d,x
         lda (pfd),y
         sta aff
         and #$1f
         sta f159e,x
         sta f15d1,x
         lda aff
         and #$20
         beq i1133
         inc f160a,x
i1133:    lda aff
         and #$40
         beq i113c
         inc f15e6,x
i113c:    lda aff
         and #$80
         beq i1182
         iny
         lda (pfd),y
         cmp #$80
         bcs i1154
         and #$1f
         asl
         asl
         asl
         sta f15aa,x
         jmp i1182
i1154:    sta aff
         cmp #$c0
         bcc i116b
         and #$1f
         asl
         asl
         asl
         sta f15aa,x
         iny
         lda (pfd),y
         sta f15b6,x
         jmp i1182
i116b:    and #$1f
         sta f15b0,x
         inc f15b3,x
         lda aff
         and #$20
         beq i117c
         inc f15b3,x
i117c:    iny
         lda (pfd),y
         sta f15ad,x
i1182:    iny
         lda (pfd),y
         sta f15a1,x
         iny
         tya
         sta f160d,x
         lda (pfd),y
         cmp #$ff
         bne i119b
         inc f1601,x
         lda #$00
         sta f160d,x
i119b:    lda f15a1,x
         beq i11be
         lda #$ff
         sta f15cb,x
         lda f15a1,x
         bmi i11ae
         clc
         adc f15a7,x
i11ae:    cmp f15a4,x
         beq i11ea
         sta f15a4,x
         lda #$ff
         sta f15da,x
         jmp i11c8
i11be:    lda #$fe
         sta f15cb,x
         lda f1607,x
         bne i11ea
i11c8:    ldy f15aa,x
         lda f16e5,y
         and #$0f
         sta f15f5,x
         inc f15f5,x
         lsr
         adc #$00
         sta f15d4,x
         lda #$00
         sta f15d7,x
         sta f15f2,x
         sta f15fb,x
         sta f15fe,x
i11ea:    lda f1607,x
         beq i11f7
         lda #$02
         sta f1607,x
         jmp i123e
i11f7:    ldy f15aa,x
         lda f16e4,y
         sta f15c8,x
         lda f16e7,y
         pha
         and #$0f
         sta f15c2,x
         pla
         and #$f0
         sta f15bf,x
         lda f16e8,y
         sta f15b9,x
         lda f16e6,y
         sta f15f8,x
         lda f16e9,y
         and #$40
         beq i123b
         lda f15e9,x
         bne i123b
         lda #$00
         sta f15e3,x
         lda f16ea,y
         sta f15e0,x
         asl
         asl
         tay
         lda f1800,y
         sta a161b
i123b:    jmp i14cd
i123e:    lda f15b9,x
         beq i1288
         asl
         asl
         tay
         lda f17e8,y
         bmi i1260
         lda f15bf,x
         clc
         adc f17e9,y
         sta f15bf,x
         lda f15c2,x
         adc #$00
         sta f15c2,x
         jmp i1272
i1260:    lda f15bf,x
         sec
         sbc f17e9,y
         sta f15bf,x
         lda f15c2,x
         sbc #$00
         sta f15c2,x
i1272:    inc f15bc,x
         lda f15bc,x
         cmp f17ea,y
         bcc i1288
         lda #$00
         sta f15bc,x
         lda f17eb,y
         sta f15b9,x
i1288:    lda f1607,x
         cmp #$02
         beq i12e0
         ldy f15aa,x
         lda f16e9,y
         and #$20
         beq i129c
         jmp i148c
i129c:    tya
         clc
         adc f15ce,x
         tay
         inc f15ce,x
         lda f15ce,x
         cmp #$08
         bcc i12af
         dec f15ce,x
i12af:    lda f172b,y
         sta f15c5,x
         lda f1773,y
         sta f15dd,x
         bmi i12c4
         lda f15a4,x
         clc
         adc f1773,y
i12c4:    asl
         tay
         lda f15dd,x
         cmp f15da,x
         beq i12e0
         sta f15da,x
         lda f1623,y
         sta f1598,x
         lda f1624,y
         sta f159b,x
         jmp i14cd
i12e0:    ldy f15aa,x
         lda f16e9,y
         and #$1f
         cmp #$1f
         beq i1302
         and #$10
         bne i1305
         lda f15a4,x
         beq i12ff
         lda f15b3,x
         bne i1308
         lda f15da,x
         beq i130e
i12ff:    jmp i14cd
i1302:    jmp i1469
i1305:    jmp i13de
i1308:    jmp i1436
i130b:    jmp i13db
i130e:    ldy f15aa,x
         lda f16e5,y
         and #$0f
         beq i130b
         lda f16e9,y
         and #$80
         bne i1329
         lda f16e9,y
         and #$0f
         cmp f15d1,x
         bcs i130b
i1329:    dec f15f8,x
         lda f15f8,x
         cmp #$ff
         bne i130b
         inc f15f8,x
         lda f15a4,x
         asl
         tay
         sec
         lda f1625,y
         sbc f1623,y
         sta f15ec,x
         lda f1626,y
         sbc f1624,y
         sta f15ef,x
         ldy f15aa,x
         lda f16e5,y
         lsr
         lsr
         lsr
         lsr
         beq i1365
         tay
         dey
i135c:    lsr f15ef,x
         ror f15ec,x
         dey
         bpl i135c
i1365:    lda f15ec,x
         clc
         adc f15fb,x
         sta f15ec,x
         lda f15ef,x
         adc f15fe,x
         sta f15ef,x
         lda f15f2,x
         bmi i1393
         lda f1598,x
         clc
         adc f15ec,x
         sta f1598,x
         lda f159b,x
         adc f15ef,x
         sta f159b,x
         jmp i13a6
i1393:    lda f1598,x
         sec
         sbc f15ec,x
         sta f1598,x
         lda f159b,x
         sbc f15ef,x
         sta f159b,x
i13a6:    inc f15d4,x
         lda f15d4,x
         cmp f15f5,x
         bcc i13db
         lda f15f2,x
         eor #$80
         sta f15f2,x
         lda #$00
         sta f15d4,x
         ldy f15aa,x
         lda f16e9,y
         and #$80
         beq i13db
         lda f16e9,y
         asl
         asl
         asl
         asl
         clc
         adc f15fb,x
         sta f15fb,x
         bcc i13db
         inc f15fe,x
i13db:    jmp i14cd
i13de:    lda f15d7,x
i13e1:    clc
         adc f15b6,x
         tay
         lda f17bb,y
         beq i1411
         cmp #$ff
         bne i13f7
         lda #$00
         sta f15d7,x
         jmp i13e1
i13f7:    clc
         adc f15a4,x
         asl
         tay
         lda f1623,y
         pha
         lda f1624,y
         ldy a161a
         sta fd401,y
         pla
         sta fd400,y
         dec a1617
i1411:    ldy f15aa,x
         inc f15f2,x
         lda f16e9,y
         and #$0f
         cmp f15f2,x
         bcs i142e
         lda #$00
         sta f15f2,x
         inc f15d7,x
         lda a1617
         bpl i1431
i142e:    jmp i14cd
i1431:    lda f15b3,x
         beq i142e
i1436:    lda f15b3,x
         cmp #$01
         bne i1453
         lda f1598,x
         clc
         adc f15ad,x
         sta f1598,x
         lda f159b,x
         adc f15b0,x
         sta f159b,x
         jmp i14cd
i1453:    lda f1598,x
         sec
         sbc f15ad,x
         sta f1598,x
         lda f159b,x
         sbc f15b0,x
         sta f159b,x
         jmp i14cd
i1469:    lda f1598,x
         sec
         sbc f16e5,y
         sta f1598,x
         lda f159b,x
         sbc f16e6,y
         bcc i1481
         sta f159b,x
         jmp i14cd
i1481:    lda #$00
         sta f1598,x
         sta f159b,x
         jmp i14cd
i148c:    lda f16e6,y
         clc
         adc f15d7,x
         tay
         lda f17e8,y
         cmp #$ff
         beq i14cd
         cmp #$fe
         bne i14ac
         iny
         lda f17e8,y
         sta f15d7,x
         ldy f15aa,x
         jmp i148c
i14ac:    sta f15c5,x
         iny
         lda f15a4,x
         and #$7f
         clc
         adc f17e8,y
         asl
         tay
         lda f1623,y
         sta f1598,x
         lda f1624,y
         sta f159b,x
         inc f15d7,x
         inc f15d7,x
i14cd:    ldy f15aa,x
         lda f16e9,y
         and #$40
         beq i152b
         lda a161c
         ora f1620,x
         sta a161c
         lda f15e0,x
         asl
         asl
         tay
         lda f1801,y
         bmi i14fb
         and #$7f
         sta aff
         lda a161b
         clc
         adc aff
         sta a161b
         jmp i1508
i14fb:    and #$7f
         sta aff
         lda a161b
         sec
         sbc aff
         sta a161b
i1508:    inc f15e3,x
         lda f15e3,x
         cmp f1802,y
         bcc i152b
         lda #$00
         sta f15e3,x
         lda f1803,y
         sta f15e0,x
         asl
         asl
         tay
         lda f1800,y
         cmp #$ff
         beq i152b
         sta a161b
i152b:    ldy a161a
         lda a1617
         bmi i153f
         lda f1598,x
         sta fd400,y
         lda f159b,x
         sta fd401,y
i153f:    lda f15bf,x
         sta fd402,y
         lda f15c8,x
         sta fd406,y
         lda f15c2,x
         sta fd403,y
         ldy f15aa,x
         lda f16e3,y
         ldy a161a
         sta fd405,y
         lda f15c5,x
         and f15cb,x
         sta fd404,y
         lda f160a,x
         sta f1607,x
         lda f15e6,x
         sta f15e9,x
         lda #$00
         sta a1617
         dex
         bmi i157d
         jmp i105f
i157d:    lda a161b
         sta ad416
         lda a161c
         ora #$f0
         sta ad417
         rts
i158c:    lda #$00
         sta a1619
         rts
i1592:    lda #$40
         sta a1619
         rts
f1598:    lda (p84,x)
         brk
//---------------------------------------
f159b:    .byte $1b,$6e,$00
f159e:    .byte $03
a159f:    .byte $01
a15a0:    .byte $03
f15a1:    .byte $00,$d0,$00
f15a4:    .byte $38,$d0,$00
f15a7:    .byte $0c,$0c,$0c
f15aa:    .byte $10,$28,$30
f15ad:    .byte $00,$00,$c0
f15b0:    .byte $00,$00,$00
f15b3:    .byte $00,$00,$00
f15b6:    .byte $00,$00,$00
f15b9:    .byte $00,$00,$02
f15bc:    .byte $00,$00,$00
f15bf:    .byte $90,$00,$00
f15c2:    .byte $0c,$00,$03
f15c5:    .byte $41,$f0,$09
f15c8:    .byte $58,$76,$54
f15cb:    .byte $fe,$ff,$fe
f15ce:    .byte $07,$07,$00
f15d1:    .byte $03,$03,$03
f15d4:    .byte $00,$00,$02
f15d7:    .byte $03,$00,$00
f15da:    .byte $00,$00,$00
f15dd:    .byte $00,$00,$00
f15e0:    .byte $00,$00,$00
f15e3:    .byte $00,$00,$00
f15e6:    .byte $00,$00,$00
f15e9:    .byte $00,$00,$00
f15ec:    .byte $00,$00,$3b
f15ef:    .byte $00,$00,$00
f15f2:    .byte $01,$00,$00
f15f5:    .byte $01,$01,$05
f15f8:    .byte $00,$00,$10
f15fb:    .byte $00,$00,$00
f15fe:    .byte $00,$00,$00
f1601:    .byte $01,$01,$01
f1604:    .byte $01,$02,$03
f1607:    .byte $00,$00,$00
f160a:    .byte $00,$00,$00
f160d:    .byte $0d,$0c,$09
//---------------------------------------
f1610:    .byte <t1,<t2,<t3
f1613:    .byte >t1,>t2,>t3
//---------------------------------------
a1616:    .byte $03         //speed
//---------------------------------------
a1617:    .byte $00
a1618:    .byte $03
a1619:    .byte $80
a161a:    .byte $00
a161b:    .byte $a0
a161c:    .byte $01
f161d:    .byte $00,$07,$0e
f1620:    .byte $01,$02,$04
f1623:    .byte $16
f1624:    .byte $01
f1625:    .byte $27
f1626:    .byte $01,$38,$01,$4b
         .byte $01,$5f,$01,$73
         .byte $01,$8a,$01,$a1
         .byte $01,$ba,$01,$d4
         .byte $01,$f0,$01,$0e
         .byte $02,$2d,$02,$4e
         .byte $02,$71,$02,$96
         .byte $02,$bd,$02,$e7
         .byte $02,$13,$03,$42
         .byte $03,$74,$03,$a9
         .byte $03,$e0,$03,$1b
         .byte $04,$5a,$04,$9b
         .byte $04,$e2,$04,$2c
         .byte $05,$7b,$05,$ce
         .byte $05,$27,$06,$85
         .byte $06,$e8,$06,$51
         .byte $07,$c1,$07,$37
         .byte $08,$b4,$08,$37
         .byte $09,$c4,$09,$57
         .byte $0a,$f5,$0a,$9c
         .byte $0b,$4e,$0c,$09
         .byte $0d,$d0,$0d,$a3
         .byte $0e,$82,$0f,$6e
         .byte $10,$68,$11,$6e
         .byte $12,$88,$13,$af
         .byte $14,$eb,$15,$39
         .byte $17,$9c,$18,$13
         .byte $1a,$a1,$1b,$46
         .byte $1d,$04,$1f,$dc
         .byte $20,$d0,$22,$dc
         .byte $24,$10,$27,$5e
         .byte $29,$d6,$2b,$72
         .byte $2e,$38,$31,$26
         .byte $34,$42,$37,$8c
         .byte $3a,$08,$3e,$b8
         .byte $41,$a0,$45,$b8
         .byte $49,$20,$4e,$bc
         .byte $52,$ac,$57,$e4
         .byte $5c,$70,$62,$4c
         .byte $68,$84,$6e,$18
         .byte $75,$10,$7c,$70
         .byte $83,$40,$8b,$70
         .byte $93,$40,$9c,$78
         .byte $a5,$58,$af,$c8
         .byte $b9,$e0,$c4,$98
         .byte $d0,$08,$dd,$30
         .byte $ea,$20,$f8,$2e
         .byte $fd
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//sounds...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f16e3:    .byte $00
f16e4:    .byte $00
f16e5:    .byte $00
f16e6:    .byte $00
f16e7:    .byte $00
f16e8:    .byte $00
f16e9:    .byte $00
f16ea:    .byte $00
//---------------------------------------
s1:       .byte $00,$c2,$34
         .byte $59,$07,$01,$40
         .byte $01
//---------------------------------------
s2:       .byte $01,$4a,$00
         .byte $00,$08,$01,$11
         .byte $00
//---------------------------------------
s3:       .byte $01,$e5,$00
         .byte $00,$08,$00,$00
         .byte $00
//---------------------------------------
s4:       .byte $01,$c7,$00
         .byte $00,$08,$00,$40
         .byte $02
//---------------------------------------
s5:       .byte $00,$76,$00
         .byte $00,$00,$00,$00
         .byte $00
//---------------------------------------
s6:       .byte $01,$54,$23
         .byte $08,$03,$07,$00
         .byte $00
//---------------------------------------
s7:       .byte $01,$54,$23
         .byte $12,$03,$02,$00
         .byte $00
//---------------------------------------
s8:       .byte $00,$77,$00
         .byte $00,$08,$00,$00
         .byte $00
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f172b:    .byte $00,$00,$00,$00 //s0
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $81,$41,$41,$41 //s1
         .byte $41,$41,$41,$41
//---------------------------------------
         .byte $11,$21,$41,$41 //s2
         .byte $41,$41,$41,$20
//---------------------------------------
         .byte $81,$10,$10,$40 //s3
         .byte $40,$10,$40,$10
//---------------------------------------
         .byte $81,$11,$40,$80 //s4
         .byte $40,$80,$80,$80
//---------------------------------------
         .byte $81,$14,$f0,$f0 //s5
         .byte $f0,$f0,$f0,$f0
//---------------------------------------
         .byte $41,$41,$41,$41 //s6
         .byte $41,$41,$41,$41
//---------------------------------------
         .byte $11,$21,$41,$41 //s7
         .byte $41,$41,$41,$41
//---------------------------------------
         .byte $81,$40,$40,$80 //s8
         .byte $80,$80,$80,$80
//---------------------------------------
f1773:    .byte $00,$00,$00,$00 //s0
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $c8,$00,$00,$00 //s1
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $00,$00,$00,$00 //s2
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $c8,$00,$7d,$7a //s3
         .byte $77,$74,$71,$6e
//---------------------------------------
         .byte $c8,$03,$7e,$c8 //s4
         .byte $7d,$c8,$c8,$c8
//---------------------------------------
         .byte $dc,$d9,$00,$00 //s5
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $01,$02,$01,$00 //s6
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $02,$01,$00,$00 //s7
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $c8,$01,$7d,$c4 //s8
         .byte $c4,$c4,$c4,$c4
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//hoogte ratels...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
f17bb:    .byte $00,$0c,$07,$00   //1
         .byte $ff
//---------------------------------------
         .byte $00,$00,$00       //2
         .byte $00,$ff
//---------------------------------------
         .byte $0b,$07           //3
         .byte $04,$00,$ff
//---------------------------------------
         .byte $0c               //4
         .byte $07,$04,$00,$ff
//---------------------------------------
         .byte $0a,$07,$03,$00   //4
         .byte $ff
//---------------------------------------
         .byte $0a,$08,$03       //5
         .byte $00,$ff
//---------------------------------------
         .byte $0c,$09           //6
         .byte $05,$00,$ff
//---------------------------------------
         .byte $08               //7
         .byte $05,$01,$00,$ff
//---------------------------------------
         .byte $0a,$07,$04,$00   //8
         .byte $ff
//---------------------------------------
f17e8:    .byte $00
f17e9:    .byte $00
f17ea:    .byte $00
f17eb:    .byte $00,$00,$30,$00
         .byte $01,$00,$70,$07
         .byte $03,$80,$40,$10
         .byte $04,$00,$40,$10
         .byte $03,$00,$f0,$07
//---------------------------------------
         brk
//---------------------------------------
f1800:    .byte $ff
f1801:    .byte $00
f1802:    .byte $00
f1803:    .byte $00,$40,$84
//---------------------------------------
         .byte $0f
         brk
         ldy #$00
         brk
         brk
//---------------------------------------
f180c:    .byte <b0,<b1,<b2,<b3
         .byte <b4,<b5,<b6,<b7
         .byte <b8,<b9,<ba,<bb
         .byte <bc,<bd,<be,<bf
         .byte <b10,<b11,<b12,<b13
         .byte <b14,<b15
f1822:    .byte >b0,>b1,>b2,>b3
         .byte >b4,>b5,>b6,>b7
         .byte >b8,>b9,>ba,>bb
         .byte >bc,>bd,>be,>bf
         .byte >b10,>b11,>b12,>b13
         .byte >b14,>b15
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//tracks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
t1:       .byte $80,$00,$00,$04,$04
         .byte $ff
//---------------------------------------
t2:       .byte $8c,$02,$8a,$02
         .byte $85,$02,$87,$02
         .byte $ff
//---------------------------------------
t3:       .byte $8c,$03,$8a,$03
         .byte $85,$03,$87,$03
         .byte $ff
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//blocks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
b0:       .byte $1f,$00
         .byte $0f,$00,$ff

//----------------DRUM-1-----------------

b1:       .byte $87,$03,$ac
         .byte $85,$04,$ac
         .byte $85,$03,$ac
         .byte $83,$03,$ac
         .byte $85,$04,$ac
         .byte $81,$04,$ac
         .byte $ff

//----------------BASS-1-----------------

b2:       .byte $83,$01,$0c,$01,$0c

         .byte $83,$04,$ac

         .byte $81,$01,$0c
         .byte $81,$01,$0c
         .byte $81,$01,$0c,$01,$18

         .byte $81,$04,$ac

         .byte $81,$01,$0c
         .byte $81,$01,$18
         .byte $ff
//-----------------TRING-1---------------

b3:       .byte $85,$03,$ac
         .byte $85,$02,$30
         .byte $85,$03,$ac
         .byte $85,$02,$30
         .byte $ff
//------------------SOLO-1---------------
b4:       .byte $8b,$06,$34

         .byte $81,$06,$34
         .byte $81,$06,$35
         .byte $81,$06,$37
         .byte $83,$06,$35
         .byte $81,$06,$34
         .byte $8b,$06,$3a

         .byte $81,$06,$34
         .byte $81,$06,$35
         .byte $81,$06,$37
         .byte $83,$06,$35
         .byte $81,$06,$34
         .byte $8b,$06,$39

         .byte $81,$06,$34
         .byte $81,$06,$35
         .byte $81,$06,$37
         .byte $81,$06,$34
         .byte $81,$06,$35
         .byte $81,$06,$37

         .byte $8b,$06,$30
         .byte $85,$06,$32

         .byte $81,$06,$30
         .byte $81,$06,$32
         .byte $81,$06,$33

         .byte $ff
//---------------------------------------
b5:
b6:
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
         .byte $ff
//---------------------------------------

