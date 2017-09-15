* =$0801
:BasicUpstart(player)
//---------------------------------------
//PLAYER
//---------------------------------------

         .pc= $4000
player:
         sei
         lda #$00
         jsr init
bk:       lda #$62
p1:       cmp $d012
         bne p1
         dec $d020
         jsr play
         lda $dc01
         and #32
         bne goon
         dec $d020
         jsr play
         dec $d020
         jsr play
goon:     lda #$00
         sta $d020
         lda $dc01
         and #128
         bne goen
         lda #$00
         jsr init
goen:     lda $dc01
         and #4
         bne bk
exit:     jmp $9000

//---------------------------------------
.var fd400    = $d400
.var fd401    = $d401
.var fd402    = $d402
.var fd403    = $d403
.var fd404    = $d404
.var fd405    = $d405
.var fd406    = $d406
.var afd      = $fd
.var afe      = $fe
.var aff      = $ff
.var ad416    = $d416
.var ad417    = $d417
.var ad418    = $d418
.var p84      = $84
.var pfd      = $fd

.var c0       = $00
.var c0s      = c0+1
.var d0       = c0+2
.var d0s      = c0+3
.var e0       = c0+4
.var f0       = c0+5
.var f0s      = c0+6
.var g0       = c0+7
.var g0s      = c0+8
.var a0       = c0+9
.var a0s      = c0+10
.var b0       = c0+11

.var c1       = b0+1
.var c1s      = c1+1
.var d1       = c1+2
.var d1s      = c1+3
.var e1       = c1+4
.var f1       = c1+5
.var f1s      = c1+6
.var g1       = c1+7
.var g1s      = c1+8
.var a1       = c1+9
.var a1s      = c1+10
.var b1       = c1+11

.var c2       = b1+1
.var c2s      = c2+1
.var d2       = c2+2
.var d2s      = c2+3
.var e2       = c2+4
.var f2       = c2+5
.var f2s      = c2+6
.var g2       = c2+7
.var g2s      = c2+8
.var a2       = c2+9
.var a2s      = c2+10
.var b2       = c2+11

.var c3       = b2+1
.var c3s      = c3+1
.var d3       = c3+2
.var d3s      = c3+3
.var e3       = c3+4
.var f3       = c3+5
.var f3s      = c3+6
.var g3       = c3+7
.var g3s      = c3+8
.var a3       = c3+9
.var a3s      = c3+10
.var b3       = c3+11

.var c4       = b3+1
.var c4s      = c4+1
.var d4       = c4+2
.var d4s      = c4+3
.var e4       = c4+4
.var f4       = c4+5
.var f4s      = c4+6
.var g4       = c4+7
.var g4s      = c4+8
.var a4       = c4+9
.var a4s      = c4+10
.var b4       = c4+11

.var c5       = b4+1
.var c5s      = c5+1
.var d5       = c5+2
.var d5s      = c5+3
.var e5       = c5+4
.var f5       = c5+5
.var f5s      = c5+6
.var g5       = c5+7
.var g5s      = c5+8
.var a5       = c5+9
.var a5s      = c5+10
.var b5       = c5+11


.var end      = $ff
.var dur      = $80



//---------------------------------------
//                 CODE
//---------------------------------------
         .pc= $1000

init:     jmp i158c
stop:     jmp i1592
play:     lda #$1f
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
//                VARIABLES
//---------------------------------------
f159b:    .byte $00,$00,$00
f159e:    .byte $00
a159f:    .byte $00
a15a0:    .byte $00
f15a1:    .byte $00,$00,$00
f15a4:    .byte $00,$00,$00
f15a7:    .byte $00,$00,$00
f15aa:    .byte $00,$00,$00
f15ad:    .byte $00,$00,$00
f15b0:    .byte $00,$00,$00
f15b3:    .byte $00,$00,$00
f15b6:    .byte $00,$00,$00
f15b9:    .byte $00,$00,$00
f15bc:    .byte $00,$00,$00
f15bf:    .byte $00,$00,$00
f15c2:    .byte $00,$00,$00
f15c5:    .byte $00,$00,$00
f15c8:    .byte $00,$00,$00
f15cb:    .byte $00,$00,$00
f15ce:    .byte $00,$00,$00
f15d1:    .byte $00,$00,$00
f15d4:    .byte $00,$00,$00
f15d7:    .byte $00,$00,$00
f15da:    .byte $00,$00,$00
f15dd:    .byte $00,$00,$00
f15e0:    .byte $00,$00,$00
f15e3:    .byte $00,$00,$00
f15e6:    .byte $00,$00,$00
f15e9:    .byte $00,$00,$00
f15ec:    .byte $00,$00,$00
f15ef:    .byte $00,$00,$00
f15f2:    .byte $00,$00,$00
f15f5:    .byte $00,$00,$00
f15f8:    .byte $00,$00,$00
f15fb:    .byte $00,$00,$00
f15fe:    .byte $00,$00,$00
f1601:    .byte $00,$00,$00
f1604:    .byte $00,$00,$00
f1607:    .byte $00,$00,$00
f160a:    .byte $00,$00,$00
f160d:    .byte $00,$00,$00
//---------------------------------------
//            TRACK POINTERS
//---------------------------------------
f1610:    .byte <track1,<track2,<track3
f1613:    .byte >track1,>track2,>track3
//---------------------------------------
//                 SPEED
//---------------------------------------

a1616:    .byte $02

//---------------------------------------
//               VARIABLES
//---------------------------------------
a1617:    .byte $00
a1618:    .byte $00
a1619:    .byte $00
a161a:    .byte $00
a161b:    .byte $00
a161c:    .byte $00
//---------------------------------------
//                  ???
//---------------------------------------
f161d:    .byte $00,$07,$0e
f1620:    .byte $00,$00,$00 //$01,$02,$04
//---------------------------------------
f1623:
.label f1624    = *+1
.label f1625    = *+2
.label f1626    = *+3
//---------------------------------------
//         TONE-FREQUENCY TABLE
//---------------------------------------
         .byte $16,$01,$27,$01
         .byte $38,$01,$4b
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
//---------------------------------------
f16e3:
.label f16e4    = *+1
.label f16e5    = *+2
.label f16e6    = *+3
.label f16e7    = *+4
.label f16e8    = *+5
.label f16e9    = *+6
.label f16ea    = *+7

//---------------------------------------
//                 SOUNDS
//---------------------------------------

         .byte $00,$00,$00,$00 //Sound 0
         .byte $00,$00,$00,$00 //Silence
//---------------------------------------
         .byte $00,$65,$37,$59 //Sound 1
         .byte $67,$01,$40,$00 //Bass
//---------------------------------------
         .byte $01,$2a,$23,$0c //Sound 2
         .byte $03,$07,$10,$00 //Vibrato
//---------------------------------------
         .byte $01,$e5,$00,$00 //Sound 3
         .byte $08,$00,$00,$00 //Base
//---------------------------------------
         .byte $01,$c7,$00,$00 //Sound 4
         .byte $08,$00,$40,$00 //Snare
//---------------------------------------
         .byte $00,$76,$00,$00 //Sound 5
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $01,$54,$0f,$0c //Sound 6
         .byte $67,$07,$00,$00 //Solo
//---------------------------------------
         .byte $01,$54,$23,$12 //Sound 7
         .byte $c6,$71,$00,$00
//---------------------------------------
         .byte $00,$47,$00,$00 //Sound 8
         .byte $08,$00,$00,$00

//---------------------------------------
//                WAVEFORMS
//---------------------------------------
f172b:
         .byte $00,$00,$00,$00 //Sound 0
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $81,$41,$41,$41 //Sound 1
         .byte $41,$41,$41,$41
//---------------------------------------
         .byte $21,$11,$41,$41 //Sound 2
         .byte $41,$41,$41,$20
//---------------------------------------
         .byte $81,$10,$10,$40 //Sound 3
         .byte $40,$10,$40,$10
//---------------------------------------
         .byte $81,$11,$40,$80 //Sound 4
         .byte $40,$80,$80,$80
//---------------------------------------
         .byte $81,$14,$f0,$f0 //Sound 5
         .byte $f0,$f0,$f0,$f0
//---------------------------------------
         .byte $41,$41,$41,$41 //Sound 6
         .byte $41,$41,$41,$11
//---------------------------------------
         .byte $11,$11,$21,$21 //Sound 7
         .byte $41,$41,$41,$41
//---------------------------------------
         .byte $81,$40,$40,$80 //Sound 8
         .byte $80,$80,$80,$80

//---------------------------------------
//     MODULATIONS AT START OF SOUND
//---------------------------------------
f1773:
         .byte $00,$00,$00,$00 //Sound 0
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $c8,$00,$00,$00 //Sound 1
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $00,$00,$00,$00 //Sound 2
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $c8,$00,$7d,$7a //Sound 3
         .byte $77,$74,$71,$6e
//---------------------------------------
         .byte $c8,$03,$7e,$c8 //Sound 4
         .byte $7d,$c8,$c8,$c8
//---------------------------------------
         .byte $dc,$d9,$00,$00 //Sound 5
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $ff,$00,$00,$00 //Sound 6
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $0c,$02,$01,$00 //Sound 7
         .byte $00,$00,$00,$00
//---------------------------------------
         .byte $c8,$01,$7d,$c4 //Sound 8
         .byte $c4,$c4,$c4,$c4

//---------------------------------------
//              SPECIAL FX
//---------------------------------------
f17bb:
         .byte $02,$09,$05,$02,$ff //Fx 1
//---------------------------------------
         .byte $00,$00,$00,$00,$ff //Fx 2
//---------------------------------------
         .byte $0b,$07,$04,$00,$ff //Fx 3
//---------------------------------------
         .byte $0c,$07,$04,$00,$ff //Fx 4
//---------------------------------------
         .byte $0a,$07,$03,$00,$ff //Fx 5
//---------------------------------------
         .byte $0a,$08,$03,$00,$ff //Fx 6
//---------------------------------------
         .byte $0c,$09,$05,$00,$ff //Fx 7
//---------------------------------------
         .byte $08,$05,$01,$00,$ff //Fx 8
//---------------------------------------
         .byte $0a,$07,$04,$00,$ff //Fx 9
//---------------------------------------

f17e8:
.label f17e9    = *+1
.label f17ea    = *+2
.label f17eb    = *+3

         .byte $00,$00,$00,$00
         .byte $00,$30,$00,$01
         .byte $00,$70,$07,$03
         .byte $80,$40,$10,$04
         .byte $00,$40,$10,$03
         .byte $00,$f0,$07,$00
//---------------------------------------
f1800:
.label f1801    = *+1
.label f1802    = *+2
.label f1803    = *+3

//---------------------------------------
//                 FILTERS
//---------------------------------------

         .byte $ff,$00,$00,$00 //Filter 0
//---------------------------------------
         .byte $40,$84,$0f,$00 //Filter 1
//---------------------------------------
         .byte $a0,$00,$00,$00 //Filter 2

//---------------------------------------
//             BLOCK POINTERS
//---------------------------------------

f180c:    .byte <bl0,<bl1,<bl2,<bl3
         .byte <bl4,<bl5,<bl6,<bl7
         .byte <bl8,<bl9,<bla,<blb
         .byte <blc,<bld,<ble,<blf
         .byte <bl10,<bl11,<bl12,<bl13
         .byte <bl14,<bl15
f1822:    .byte >bl0,>bl1,>bl2,>bl3
         .byte >bl4,>bl5,>bl6,>bl7
         .byte >bl8,>bl9,>bla,>blb
         .byte >blc,>bld,>ble,>blf
         .byte >bl10,>bl11,>bl12,>bl13
         .byte >bl14,>bl15
//---------------------------------------

         .text "jarre mix, "
         .text "by mad b/rd. player by "
         .text "mon."

//---------------------------------------
//TRACKS
//---------------------------------------

track1:                            //Drums
       // .byte $8c,$00,end

         .byte $8c,1,1,1,1  //Oxygene
         .byte 1,1,1,1
         .byte $87,1,1,1,1
         .byte $8c,1,1,1,1

         .byte 1,1,1,1
         .byte 1,1,1,1
         .byte $87,1,1,1,1
         .byte $8c,1,1,1,1


         .byte 4,4,4,4 //RendezVous
         .byte 4,4,4,4
         .byte 4,4,4,4
         .byte 4,4,4,4

         .byte 4,4,4,4
         .byte 4,4,4,4

         .byte end
//---------------------------------------
track2:                             //Bass
       // .byte $8c,$00,end

         .byte $8c,2,2         //Oxygene

         .byte $91,6,6,6
         .byte $8c,6

         .byte $91,6,6,6
         .byte $8c,6

         .byte $8a,6,6
         .byte $91,6,6


         .byte end
//---------------------------------------
track3:                           //Melody
       // .byte $8c,$00,end
         .byte $8c,3,3     //Oxygene

         .byte $8c,5       //RendezVous
         .byte end

//---------------------------------------
//BLOCKS
//---------------------------------------

bl0:                             //Silence
         .byte $1f,$00
         .byte $1f,$00,end
//---------------------------------------
bl1:                        //Oxygene Drum
         .byte $84,$03,$ac
         .byte $82,$02,$30
         .byte $84,$04,$ac
         .byte $82,$02,$30
         .byte end
//---------------------------------------
bl2:
         .byte $84,$01,d1  //Oxygene Bass
         .byte 2,d1,4,c1,7,d1,2,a0
         .byte 4,c1,2,a0

         .byte 4,d1,2,d1,4,c1,7,d1
         .byte 2,d1,4,c1,2,a0

         .byte 4,d1,2,d1,4,c1,7,d1
         .byte 2,a0,4,c1,2,a0

         .byte 4,d1,2,d1,4,c1,7,d1
         .byte 2,d1,4,c1,2,a0

         .byte 4,a1,2,a1,4,g1,7,a1
         .byte 2,e1,4,g1,2,e1

         .byte 4,a1,2,a1,4,g1,7,a1
         .byte 2,a1,4,g1,2,e1

         .byte 4,g1,2,g1,4,f1,7,d1
         .byte 2,g1,4,f1,2,d1

         .byte 4,g1,2,g1,4,f1,7,d1
         .byte 2,g1,4,f1,2,d1


         .byte end
//---------------------------------------
bl3:
         .byte $8c,6,d4         //Oxygene
         .byte 2,a3
         .byte 4,f3
         .byte 7,a3
         .byte $1f,d3
         .byte $82,0,0

         .byte $8c,6,d4
         .byte 2,a3
         .byte 4,f3
         .byte 7,a3
         .byte $1f,d3
         .byte $82,0,0

         .byte $8c,6,c4
         .byte 2,b3
         .byte 4,a3
         .byte 7,b3
         .byte $1f,e3
         .byte $82,0,0

         .byte $84,6,b3
         .byte 2,a3
         .byte 4,g3
         .byte $0f,d3
         .byte 2,d3

         .byte 4,b3
         .byte 2,a3
         .byte 4,g3
         .byte $0f,d3
         .byte $82,4,$ac

         .byte end
//---------------------------------------
bl4:                     //RendezVous Drum
         .byte $87,3,$ac
         .byte $87,4,$ac
         .byte end
//---------------------------------------
bl5:
         .byte $8b,7,c3      //Rendezvous
         .byte 3,f3
         .byte $0b,a3
         .byte 3,c3
         .byte 7,a3s
         .byte 3,a3
         .byte $0f,c3

         .byte 3,f3
         .byte 7,a3s
         .byte 3,a3
         .byte $0f,c3

         .byte 3,a3
         .byte $0f,a3
         .byte $0f,g3
                              //----
         .byte $0b,c3
         .byte 3,f3
         .byte $0b,a3
         .byte 3,c3
         .byte 7,a3s
         .byte 3,a3
         .byte $0f,c3

         .byte 3,f3
         .byte 7,a3s
         .byte 3,a3
         .byte $0f,c3

         .byte 3,a3
         .byte $0f,a3
         .byte $0b,g3
         .byte 3,c3

         .byte $1f,f3
         .byte $9b,0,0
         .byte $83,7,c3

         .byte $1f,f3
         .byte $9f,0,0


         .byte end
//---------------------------------------
bl6:                     //RendezVous Bass
         .byte $83,1,c1
         .byte 3,c1
         .byte 3,c1
         .byte 3,c1

         .byte 3,c1
         .byte 3,c1
         .byte 3,c1
         .byte 3,c1

         .byte end
//---------------------------------------
bl7:
bl8:
bl9:
bla:
blb:
blc:
bld:
ble:
blf:
bl10:
bl11:
bl12:
bl13:
bl14:
bl15:
         .byte end
//---------------------------------------


