.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)
         .pc= $4000
player:
         sei
         lda #$00
         jsr $1000
kl:       lda #$62
sp1:      cmp $d012
         bne sp1
         dec $d020
         jsr $1006
         inc $d020
         lda $dc01
         and #$10
         bne kl
         jmp $9000
//---------------------------------------

         .pc= $1000

.var fbcc8    = $bcc8
.var fd400    = $d400
.var fd401    = $d401
.var fd402    = $d402
.var fd403    = $d403
.var fd404    = $d404
.var fd405    = $d405
.var fd406    = $d406

//---------------------------------------
.var a00      = $00
.var a3b      = $3b
.var a3c      = $3c
.var a3d      = $3d
.var ad416    = $d416
.var ad417    = $d417
.var ad418    = $d418

//---------------------------------------
.var p3b      = $3b
.var p40      = $40
.var p41      = $41
.var p61      = $41
.var p7d      = $7d

//---------------------------------------

         jmp i14c9
         jmp i14cf
         lda #$1f
         sta ad418
         bit a1549
         bmi i1036
         bvs i1035
         ldx #$02
i1014:    lda #$01
         sta f14db,x
         lda #$00
         sta f1532,x
         sta f153e,x
         sta f1538,x
         sta f153b,x
         dex
         bpl i1014
         lda a1547
         sta a1548
         lda #$80
         sta a1549
i1035:    rts
i1036:    ldx #$02
         dec a1548
         bpl i104c
         dec f14db
         dec a14dc
         dec a14dd
         lda a1547
         sta a1548
i104c:    lda #$00
         sta a154c
i1051:    lda f154d,x
         sta a154a
         lda f14db,x
         bpl i105f
         jmp i10d4
i105f:    bne i106d
         lda a1548
         beq i10a7
         cmp #$03
         bcs i106d
         jmp i1070
i106d:    jmp i120c
i1070:    lda f1538,x
         bne i10a4
         lda f150e,x
         beq i108f
         lda a1548
         cmp #$02
         beq i109f
         ldy f14e7,x
         lda f1614,y
         and #$f0
         sta f1505,x
         jmp i120c
i108f:    lda a1548
         bne i10a4
         ldy f14e7,x
         lda f1614,y
         and #$f0
         sta f1505,x
i109f:    lda #$fe
         sta f1508,x
i10a4:    jmp i120c
i10a7:    lda f1541,x
         sta a3b
         lda f1544,x
         sta a3c
         ldy f1532,x
i10b4:    lda (p3b),y
         bpl i10ca
         cmp #$ff
         bne i10c1
         ldy #$00
         jmp i10b4
i10c1:    and #$1f
         sta f14e4,x
         iny
         jmp i10b4
i10ca:    sta f1535,x
         tya
         sta f1532,x
         jmp i120c
i10d4:    lda #$00
         sta f153b,x
         sta f14f0,x
         cmp f1538,x
         bne i10f0
         sta f150b,x
         sta f14d5,x
         sta f14d8,x
         sta f14f9,x
         sta f14e1,x
i10f0:    ldy f1535,x
         lda f1707,y
         sta a3b
         lda f170c,y
         sta a3c
         ldy f153e,x
         lda (p3b),y
         sta a3d
         and #$1f
         sta f14db,x
         sta f150e,x
         lda a3d
         and #$20
         beq i1115
         inc f153b,x
i1115:    lda a3d
         and #$80
         beq i115b
         iny
         lda (p3b),y
         cmp #$80
         bcs i112d
         and #$1f
         asl
         asl
         asl
         sta f14e7,x
         jmp i115b
i112d:    sta a3d
         cmp #$c0
         bcc i1144
         and #$1f
         asl
         asl
         asl
         sta f14e7,x
         iny
         lda (p3b),y
         sta f14f3,x
         jmp i115b
i1144:    and #$1f
         sta f14ed,x
         inc f14f0,x
         lda a3d
         and #$20
         beq i1155
         inc f14f0,x
i1155:    iny
         lda (p3b),y
         sta f14ea,x
i115b:    iny
         lda (p3b),y
         sta f14de,x
         iny
         tya
         sta f153e,x
         lda (p3b),y
         cmp #$ff
         bne i1174
         inc f1532,x
         lda #$00
         sta f153e,x
i1174:    lda f14de,x
         beq i119c
         lda #$ff
         sta f1508,x
         lda #$09
         sta f1502,x
         lda f14de,x
         bmi i118c
         clc
         adc f14e4,x
i118c:    cmp f14e1,x
         beq i11c2
         sta f14e1,x
         lda #$ff
         sta f1517,x
         jmp i11a6
i119c:    lda #$fe
         sta f1508,x
         lda f1538,x
         bne i11c2
i11a6:    ldy f14e7,x
         lda f1615,y
         and #$0f
         sta f152c,x
         inc f152c,x
         lsr
         adc #$00
         sta f1511,x
         lda #$00
         sta f1514,x
         sta f1529,x
i11c2:    lda f1538,x
         beq i11ca
         jmp i120c
i11ca:    ldy f14e7,x
         lda f1614,y
         sta f1505,x
         lda f1617,y
         pha
         and #$0f
         sta f14ff,x
         pla
         and #$f0
         sta f14fc,x
         lda f1618,y
         sta f14f6,x
         lda f1616,y
         sta f152f,x
         lda f1619,y
         and #$40
         beq i1209
         lda #$00
         sta f1520,x
         lda f161a,y
         sta f151d,x
         asl
         asl
         tay
         lda f16fb,y
         sta a154b
i1209:    jmp i1423
i120c:    lda f153b,x
         sta f1538,x
         lda f14f6,x
         beq i125c
         asl
         asl
         tay
         lda f16df,y
         bmi i1234
         lda f14fc,x
         clc
         adc f16e0,y
         sta f14fc,x
         lda f14ff,x
         adc #$00
         sta f14ff,x
         jmp i1246
i1234:    lda f14fc,x
         sec
         sbc f16e0,y
         sta f14fc,x
         lda f14ff,x
         sbc #$00
         sta f14ff,x
i1246:    inc f14f9,x
         lda f14f9,x
         cmp f16e1,y
         bcc i125c
         lda #$00
         sta f14f9,x
         lda f16e2,y
         sta f14f6,x
i125c:    ldy f14e7,x
         lda f1619,y
         and #$20
         beq i1269
         jmp i13e2
i1269:    tya
         clc
         adc f150b,x
         tay
         inc f150b,x
         lda f150b,x
         cmp #$08
         bcc i127c
         dec f150b,x
i127c:    lda f1653,y
         sta f1502,x
         lda f1693,y
         sta f151a,x
         bmi i1291
         lda f14e1,x
         clc
         adc f1693,y
i1291:    asl
         tay
         lda f151a,x
         cmp f1517,x
         beq i12ad
         sta f1517,x
         lda f1553,y
         sta f14d5,x
         lda f1554,y
         sta f14d8,x
         jmp i1423
i12ad:    ldy f14e7,x
         lda f1619,y
         and #$10
         bne i12c9
         lda f14e1,x
         beq i12c6
         lda f14f0,x
         bne i12cc
         lda f1517,x
         beq i12d2
i12c6:    jmp i1423
i12c9:    jmp i136b
i12cc:    jmp i13af
i12cf:    jmp i1368
i12d2:    ldy f14e7,x
         lda f1615,y
         and #$0f
         beq i12cf
         lda f1619,y
         and #$0f
         cmp f150e,x
         bcs i12cf
         dec f152f,x
         lda f152f,x
         cmp #$ff
         bne i12cf
         inc f152f,x
         lda f14e1,x
         asl
         tay
         sec
         lda f1555,y
         sbc f1553,y
         sta f1523,x
         lda f1556,y
         sbc f1554,y
         sta f1526,x
         ldy f14e7,x
         lda f1615,y
         lsr
         lsr
         lsr
         lsr
         beq i1322
         tay
         dey
i1319:    lsr f1526,x
         ror f1523,x
         dey
         bpl i1319
i1322:    lda f1529,x
         bmi i133d
         lda f14d5,x
         clc
         adc f1523,x
         sta f14d5,x
         lda f14d8,x
         adc f1526,x
         sta f14d8,x
         jmp i1350
i133d:    lda f14d5,x
         sec
         sbc f1523,x
         sta f14d5,x
         lda f14d8,x
         sbc f1526,x
         sta f14d8,x
i1350:    inc f1511,x
         lda f1511,x
         cmp f152c,x
         bcc i1368
         lda f1529,x
         eor #$80
         sta f1529,x
         lda #$00
         sta f1511,x
i1368:    jmp i1423
i136b:    lda f1514,x
i136e:    clc
         adc f14f3,x
         tay
         lda f16d3,y
         cmp #$ff
         bne i1382
         lda #$00
         sta f1514,x
         jmp i136e
i1382:    clc
         adc f14e1,x
         asl
         tay
         lda f1553,y
         sta f14d5,x
         lda f1554,y
         sta f14d8,x
         ldy f14e7,x
         inc f1529,x
         lda f1619,y
         and #$0f
         cmp f1529,x
         bcs i13ac
         lda #$00
         sta f1529,x
         inc f1514,x
i13ac:    jmp i1423
i13af:    lda f14f0,x
         cmp #$01
         bne i13cc
         lda f14d5,x
         clc
         adc f14ea,x
         sta f14d5,x
         lda f14d8,x
         adc f14ed,x
         sta f14d8,x
         jmp i1423
i13cc:    lda f14d5,x
         sec
         sbc f14ea,x
         sta f14d5,x
         lda f14d8,x
         sbc f14ed,x
         sta f14d8,x
         jmp i1423
i13e2:    lda f1616,y
         clc
         adc f1514,x
         tay
         lda f16df,y
         cmp #$ff
         beq i1423
         cmp #$fe
         bne i1402
         iny
         lda f16df,y
         sta f1514,x
         ldy f14e7,x
         jmp i13e2
i1402:    sta f1502,x
         iny
         lda f14e1,x
         and #$7f
         clc
         adc f16df,y
         asl
         tay
         lda f1553,y
         sta f14d5,x
         lda f1554,y
         sta f14d8,x
         inc f1514,x
         inc f1514,x
i1423:    ldy f14e7,x
         lda f1619,y
         and #$40
         beq i1481
         lda a154c
         ora f1550,x
         sta a154c
         lda f151d,x
         asl
         asl
         tay
         lda f16fc,y
         bmi i1451
         and #$7f
         sta a3d
         lda a154b
         clc
         adc a3d
         sta a154b
         jmp i145e
i1451:    and #$7f
         sta a3d
         lda a154b
         sec
         sbc a3d
         sta a154b
i145e:    inc f1520,x
         lda f1520,x
         cmp f16fd,y
         bcc i1481
         lda #$00
         sta f1520,x
         lda f16fe,y
         sta f151d,x
         asl
         asl
         tay
         lda f16fb,y
         cmp #$ff
         beq i1481
         sta a154b
i1481:    ldy f14e7,x
         lda f1613,y
         ldy a154a
         sta fd405,y
         lda f1505,x
         sta fd406,y
         lda f1502,x
         and f1508,x
         sta fd404,y
         lda f14fc,x
         sta fd402,y
         lda f14ff,x
         sta fd403,y
         lda f14d5,x
         sta fd400,y
         lda f14d8,x
         sta fd401,y
         dex
         bmi i14ba
         jmp i1051
i14ba:    lda a154b
         sta ad416
         lda a154c
         ora #$f0
         sta ad417
         rts
i14c9:    lda #$00
         sta a1549
         rts
i14cf:    lda #$40
         sta a1549
         rts
//---------------------------------------
f14d5:    .byte $13,$04,$7a
f14d8:    .byte $03,$1f,$1f
f14db:    .byte $00
a14dc:    .byte $04
a14dd:    .byte $08
f14de:    .byte $06,$2a,$2e//"*.
f14e1:    .byte $12,$36,$3a//"6:
f14e4:    .byte $0c,$0c,$0c//"
f14e7:    .byte $08,$28,$30//"(0
f14ea:    .byte $50,$50,$50//"ppp
f14ed:    .byte $00,$00,$00//"...
f14f0:    .byte $00,$00,$00//"...
f14f3:    .byte $00,$04,$08//".
f14f6:    .byte $01,$02,$06//"
f14f9:    .byte $05,$05,$03//"
f14fc:    .byte $f0,$b0,$30//"p00
f14ff:    .byte $01,$09,$0f//"	
f1502:    .byte $40,$20,$61//". A
f1505:    .byte $ea,$c9,$69//"jII
f1508:    .byte $fe,$ff,$ff//"~..
f150b:    .byte $05,$05,$07//"
f150e:    .byte $01,$05,$0f//"
f1511:    .byte $00,$00,$01//"..
f1514:    .byte $00,$01,$00//"..
f1517:    .byte $00,$00,$00//"...
f151a:    .byte $00,$00,$00//"...
f151d:    .byte $01,$00,$00//"..
f1520:    .byte $06,$00,$00//"..
f1523:    .byte $27,$2e,$3b//"'.//
f1526:    .byte $00,$00,$00//"...
f1529:    .byte $00,$01,$80//". 
f152c:    .byte $01,$01,$05//"
f152f:    .byte $00,$00,$00
f1532:    .byte $02,$02,$02
f1535:    .byte $01,$02,$04
f1538:    .byte $00,$00,$00
f153b:    .byte $00,$00,$00
f153e:    .byte $21,$20,$0d
f1541:    .byte <t1,<t2,<t3
f1544:    .byte >t1,>t2,>t3
a1547:    .byte $02
a1548:    .byte $01
a1549:    .byte $80
a154a:    .byte $0e
a154b:    .byte $60
a154c:    .byte $00
f154d:    .byte $00,$07,$0e
f1550:    .byte $01,$02,$04
f1553:    .byte $16
f1554:    .byte $01
f1555:    .byte $27
f1556:    .byte $01,$38,$01,$4b//"8k
         .byte $01,$5f,$01,$73//"_S
         .byte $01,$8a,$01,$a1//"
         .byte $01,$ba,$01,$d4//":T
         .byte $01,$f0,$01,$0e//"p
         .byte $02,$2d,$02,$4e//"-n
         .byte $02,$71,$02,$96//"Q
         .byte $02,$bd,$02,$e7//"=g
         .byte $02,$13,$03,$42//"b
         .byte $03,$74,$03,$a9//"T)
         .byte $03,$e0,$03,$1b//"`
         .byte $04,$5a,$04,$9b//"z
         .byte $04,$e2,$04,$2c//"b,
         .byte $05,$7b,$05,$ce//"{N
         .byte $05,$27,$06,$85//"'
         .byte $06,$e8,$06,$51//"hq
         .byte $07,$c1,$07,$37//"A7
         .byte $08,$b4,$08,$37//"47
         .byte $09,$c4,$09,$57//"	D	w
         .byte $0a,$f5,$0a,$9c//"
         .byte $0b,$4e,$0c,$09//"n	
         .byte $0d,$d0,$0d,$a3//".P.#
         .byte $0e,$82,$0f,$6e//"N
         .byte $10,$68,$11,$6e//"HN
         .byte $12,$88,$13,$af//"/
         .byte $14,$eb,$15,$39//"k9
         .byte $17,$9c,$18,$13//"
         .byte $1a,$a1,$1b,$46//"!f
         .byte $1d,$04,$1f,$dc//"\
         .byte $20,$d0,$22,$dc//" P.\
         .byte $24,$10,$27,$5e//"$'^
         .byte $29,$d6,$2b,$72//")V+R
         .byte $2e,$38,$31,$26//".81&
         .byte $34,$42,$37,$8c//"4b7
         .byte $3a,$08,$3e,$b8//":>8
         .byte $41,$a0,$45,$b8//"a e8
         .byte $49,$20,$4e,$bc//"i n<
         .byte $52,$ac,$57,$e4//"r,wd
         .byte $5c,$70,$62,$4c//"\PBl
         .byte $68,$84,$6e,$18//"HN
         .byte $75,$10,$7c,$70//"U|P
         .byte $83,$40,$8b,$70//".P
         .byte $93,$40,$9c,$78//".X
         .byte $a5,$58,$af,$c8//"%x/H
         .byte $b9,$e0,$c4,$98//"9`D
         .byte $d0,$08,$dd,$30//"P]0
         .byte $ea,$20,$f8,$2e//"j x.
         .byte $fd
//---------------------------------------
f1613:    .byte $00
f1614:    .byte $00
f1615:    .byte $00
f1616:    .byte $00
f1617:    .byte $00
f1618:    .byte $00
f1619:    .byte $00
f161a:    .byte $00
//---------------------------------------
         .byte $00,$ec,$33
         .byte $00,$04,$01,$5c
         .byte $01
//---------------------------------------
         .byte $01,$f8,$00
         .byte $00,$08,$00,$40
         .byte $02
//---------------------------------------
         .byte $00,$83,$00
         .byte $00,$02,$00,$00
         .byte $00
//---------------------------------------
         .byte $00,$f7,$00
         .byte $00,$08,$00,$00
         .byte $00
//---------------------------------------
         .byte $01,$9a,$00
         .byte $00,$05,$01,$11
         .byte $00
//---------------------------------------
         .byte $01,$69,$33
         .byte $00,$04,$0a,$00
         .byte $00
//---------------------------------------
         .byte $00,$cd,$00
         .byte $00,$08,$03,$54
         .byte $07
//---------------------------------------
f1653:    .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $81,$40,$40,$40
         .byte $40,$40,$40,$40
//---------------------------------------
         .byte $81,$10,$40,$80
         .byte $80,$80,$80,$80
//---------------------------------------
         .byte $81,$17,$16,$16
         .byte $16,$16,$16,$16
//---------------------------------------
         .byte $81,$10,$40,$40
         .byte $40,$40,$40,$40
//---------------------------------------
         .byte $11,$21,$20,$20
         .byte $20,$20,$20,$40
//---------------------------------------
         .byte $11,$21,$41,$41
//---------------------------------------
         eor (p41,x)
         eor (p61,x)
         sta (p40,x)
         .byte $40
         .byte $40
         .byte $40
         .byte $40
         .byte $40
         .byte $40
f1693:    brk
         brk
         brk
         brk
         brk
         brk
         brk
         brk
         iny
         brk
         brk
         brk
         brk
         brk
         brk
         brk
         iny
         ora (p7d,x)
         iny
         iny
         iny
         iny
         iny
         iny
         asl a00
         iny
         ldy fbcc8,x
         iny
         iny
         brk
//---------------------------------------
         .byte $7d,$7a,$77,$74
         .byte $71,$6e,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
         .byte $00,$00,$d0,$00
         .byte $00,$00,$00,$00
         .byte $00,$00
f16d3:    .byte $00,$03,$07,$ff
         .byte $00,$04,$07,$ff
         .byte $00,$03,$08,$ff
f16df:    .byte $00
f16e0:    .byte $00
f16e1:    .byte $00
f16e2:    .byte $00,$00,$30,$20
         .byte $00,$00,$f0,$09
         .byte $03,$00,$10,$10
         .byte $00,$00,$f0,$0a
         .byte $05,$00,$10,$10
         .byte $06,$80,$10,$10
         .byte $05
f16fb:    .byte $ff
f16fc:    .byte $00
f16fd:    .byte $00
f16fe:    .byte $00,$c0,$90,$07
         .byte $00,$98,$00,$00
//---------------------------------------
         brk
//---------------------------------------
f1707:    .byte <b0,<b1,<b2,<b3
         .byte <b4,<b5,<b6
f170c:    .byte >b0,>b1,>b2,>b3
         .byte >b4,>b5,>b6
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//tracks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
t1:       .byte $8c,$05,$02,$02,$8d,$02
         .byte $02,$02,$02,$ff
//---------------------------------------
t2:       .byte $84,$01,$01,$85,$01,$01
         .byte $04,$04,$ff
//---------------------------------------
t3:       .byte $80,$03,$03,$03,$03,$03
         .byte $03,$8d,$06,$ff
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//blocks...
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
b0:       .byte $00,$00,$ff
//---------------------------------------
b1:       .byte $83,$c5,$00,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $83,$c5,$04,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $03,$2a
         .byte $83,$c5,$00,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $03,$2c
         .byte $83,$c5,$08,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e
         .byte $03,$2e,$ff
//---------------------------------------
b2:       .byte $85,$01,$0c,$01,$18
         .byte $83,$02,$ac,$87,$01
         .byte $0c,$03,$0c,$83,$02
         .byte $ac,$81,$01,$0c,$01,$18
         .byte $85,$01,$0c,$01,$18
         .byte $83,$02,$ac,$87,$01
         .byte $0c,$03,$0c,$83,$02
         .byte $ac,$81,$01,$0c,$81,$02
         .byte $ac
         .byte $85,$01,$0c,$01,$18
         .byte $83,$02,$ac,$87,$01
         .byte $0c,$03,$0c,$83,$02
         .byte $ac,$81,$01,$0c,$01,$18
         .byte $85,$01,$0c,$01,$18
         .byte $83,$02,$ac,$87,$01
         .byte $0c,$83,$02,$ac,$01
         .byte $ac,$03,$ac,$01,$ac,$ff
//---------------------------------------
b3:       .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $83,$04,$a8
         .byte $81,$03,$24,$01,$24
         .byte $ff
//---------------------------------------
b4:       .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$04,$2a
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$00,$2c
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $83,$04,$a8
         .byte $83,$c5,$08,$2e
         .byte $ff
//---------------------------------------
b5:       .byte $9f,$07,$0c
         .byte $9f,$07,$0c
         .byte $9f,$07,$0c
         .byte $9f,$07,$0c
         .byte $9f,$07,$0c
         .byte $9f,$07,$0c
         .byte $9f,$07,$0c
         .byte $9f,$07,$0c,$ff
//---------------------------------------
b6:       .byte $87,$06,$2b,$03,$29,$01
         .byte $27,$81,$00,$00
         .byte $83,$06,$27,$03,$29,$03
         .byte $2b,$1f
         .byte $24,$81,$03,$18,$01,$18
         .byte $87,$06,$2b,$03,$29,$01
         .byte $27,$81,$00,$00
         .byte $83,$06,$27,$03,$29,$03
         .byte $2b,$07,$2e,$03,$2e,$03
         .byte $30,$07,$2e,$03,$2b,$03
         .byte $29,$03,$27

         .byte $87,$06,$2b,$03,$29,$01
         .byte $27,$81,$00,$00
         .byte $83,$06,$27,$03,$29,$03
         .byte $2b,$1f
         .byte $30,$81,$03,$18,$01,$18
         .byte $87,$06,$30,$03,$33,$01
         .byte $35,$81,$00,$00
         .byte $83,$06,$35,$03,$35
         .byte $03,$37,$03,$38,$1f
         .byte $3a,$ff
//---------------------------------------


