.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)
.encoding "petscii_mixed"
         .pc= $4000
player:
         sei
         lda #$00
         jsr music
lus:      lda #$62
lus1:     cmp $d012
         bne lus1
         dec $d020
         jsr music+3
         inc $d020
         lda $dc01
         and #$10
         bne lus
         jmp $9000
//---------------------------------------
.var musicadd = $1000
//---------------------------------------
         .pc= musicadd
//---------------------------------------
music:    jmp l1040
         jmp l10da
//---------------------------------------
l1006:    .byte $01,$02,$04
l1009:    .byte $0f         //$d418
l100a:    .byte $f1         //$d417
l100b:    .byte $00
l100c:    .byte $13,$00,$60 //$d400
l100f:    .byte $1a,$0e,$29,$fc,$3e //d401
l1014:    .byte $27,$24,$33
l1017:    .byte $18,$18,$18
l101a:    .byte $fe,$fe,$fe
l101d:    .byte $18,$00,$60
//---------------------------------------
l1020:    .text "-player+ed'[c]jch/tune"
         .text " by xayne-"
//---------------------------------------
l1040:    asl
         asl
         asl
         tay
         ldx #$00
l1046:    lda l17ef,y
         sta l174e,x
         sta l1754,x
         lda l17f0,y
         sta l1751,x
         sta l1757,x
         iny
         iny
         inx
         cpx #$03
         bne l1046
         ldx #$00
         stx l174d
         lda l17ef,y
         sta l100b
         sta l177b
         sta l177c
         sta l177d
l1073:    sta l17d9,x
         inc l174d
         lda l100b
         clc
         adc l17ef,y
         sta l100b
         clc
         adc l174d
         inx
         cpx #$10
         bne l1073
         lda l1020
         beq l10bc
         ldx #$02
l1093:    lda l17f0,y
         sta l174d
         and l175a,x
         sta l1006,x
         dex
         bpl l1093
         bit l174d
         bpl l10bc
         ldx #$00
l10a9:    lda l17f1,y
         sta l1754,x
         lda l17f2,y
         sta l1757,x
         iny
         iny
         inx
         cpx #$03
         bne l10a9
l10bc:    ldy #$00
         tya
l10bf:    sta $d400,y
         iny
         cpy #$1b
         bne l10bf
         tay
l10c8:    sta l177e,y
         sta l1766,y
         iny
         cpy #$0c
         bne l10c8
         lda l1009
         sta $d418
         rts
         //
l10da:    ldx #$02
l10dc:    lda l1769,x
         cmp #$02
         bne l110f
         ldy l1772,x
         lda l194b,y
         ldy l1760,x
         sta $d405,y
         ldy l1772,x
         lda l194c,y
         ldy l1760,x
         sta $d406,y
         lda l18fe
         beq l1109
         lda l18fd
         sta $d404,y
         jmp l110f
l1109:    lda l1778,x
         sta $d404,y
l110f:    dex
         bpl l10dc
         lda $fb
         pha
         lda $fc
         pha
         ldx #$02
l111a:    lda l1006,x
         bne l1122
         jmp l1680
l1122:    lda l176f,x
         beq l112f
         dec l176f,x
         bne l113f
         jmp l12bd
l112f:    ldy l1772,x
         lda l194e,y
         and #$0f
         cmp l177b,x
         beq l1142
         dec l177b,x
l113f:    jmp l139a
l1142:    sta l176f,x
         lda l1775,x
         sta l177b,x
         lda l174e,x
         sta $fb
         lda l1751,x
         sta $fc
         ldy #$00
         tya
         sta l176c,x
         lda ($fb),y
         bpl l116e
         asl
         sta l1781,x
         inc l174e,x
         bne l116b
         inc l1751,x
l116b:    iny
         lda ($fb),y
l116e:    tay
         lda l1ad0,y
         sta $fb
         lda l1ae9,y
         sta $fc
l1179:    ldy l1766,x
         lda ($fb),y
         bmi l11a8
         beq l119e
         cmp #$7e
         beq l1194
         sta l177e,x
         lda l17ca,x
         beq l1197
         dec l17ca,x
         jmp l1197
l1194:    inc l176c,x
l1197:    lda #$ff
         sta l1763,x
         bne l120a
l119e:    lda #$fe
         sta l1763,x
         inc l176c,x
         bne l120a
l11a8:    pha
         and #$e0
         cmp #$80
         bne l11c8
         pla
         pha
         and #$10
         sta l176c,x
         pla
         and #$0f
         tay
         lda l17d9,y
         sta l177b,x
         sta l1775,x
         inc l1766,x
         bne l1179
l11c8:    cmp #$a0
         bne l11d8
         pla
         asl
         asl
         asl
         sta l1772,x
l11d3:    inc l1766,x
         bne l1179
l11d8:    pla
         and #$3f
         asl
         tay
         lda l1a04,y
         sta l17c1,x
         lda l1a03,y
         pha
         and #$1f
         sta l17c4,x
         pla
         pha
         and #$80
         sta l17c7,x
         lda #$01
         sta l17ca,x
         lda #$00
         sta l17d0,x
         sta l17d3,x
         pla
         and #$20
         bne l11d3
         inc l17ca,x
         bne l11d3
l120a:    inc l1766,x
         ldy l1766,x
         lda ($fb),y
         cmp #$7f
         bne l1243
         lda #$00
         sta l1766,x
         tay
         lda l174e,x
         clc
         adc #$01
         sta l174e,x
         sta $fb
         lda l1751,x
         adc #$00
         sta l1751,x
         sta $fc
         lda ($fb),y
         cmp #$ff
         bne l1243
         lda l1754,x
         sta l174e,x
         lda l1757,x
         sta l1751,x
l1243:    cmp #$fe
         bne l1255
         lda #$00
         sta l1006,x
         ldy l1760,x
         sta $d404,y
         jmp l1680
l1255:    lda l176c,x
         beq l127d
         lda l176f,x
         bne l127a
         lda l1763,x
         sta l101a,x
         lda l177e,x
         sta l1014,x
         lda l1781,x
         sta l1017,x
         lda l17ca,x
         sta l17cd,x
         sta l1769,x
l127a:    jmp l139a
l127d:    ldy l1760,x
         lda l18fc
         sta $d405,y
         sta $d406,y
         lda l176f,x
         beq l12bd
         jmp l1680
         ldy l1760,x
         lda l1778,x
         and #$fe
         sta $d404,y
         ldy l1772,x
         lda l194b,y
         ldy l1760,x
         sta $d405,y
         ldy l1772,x
         lda l194c,y
         ldy l1760,x
         sta $d406,y
         lda l1778,x
         sta $d404,y
         jmp l1304
l12bd:    lda l1763,x
         sta l101a,x
         lda l177e,x
         sta l1014,x
         lda l1781,x
         sta l1017,x
         lda l17ca,x
         sta l17cd,x
         sta l1769,x
         lda l176c,x
         beq l12e0
         jmp l139a
l12e0:    ldy l1760,x
         lda l18fb
         sta $d405,y
         sta $d406,y
         lda l18fe
         beq l12fc
         lda l18fd
         and #$fe
         sta $d404,y
         jmp l1304
l12fc:    lda l1778,x
         and #$fe
         sta $d404,y
l1304:    ldy l1772,x
         tya
         sta l101d,x
         lda l1952,y
         sta l17be,x
         lda l1951,y
         sta l17ab,x
         tay
         lda #$00
         sta l17ae,x
         lda l1915,y
         and #$80
         cmp #$80
         beq l1335
         lda l1916,y
         pha
         and #$f0
         sta l17b1,x
         pla
         and #$0f
         sta l17b4,x
l1335:    ldy l1772,x
         lda l194f,y
         ldy #$00
         and #$0f
         beq l1359
         cmp #$08
         beq l1358
         asl
         asl
         asl
         asl
         ora l1009
         sta $d418
         iny
         lda l100a
         ora l175a,x
         bne l135f
l1358:    iny
l1359:    lda l100a
         and l175d,x
l135f:    sta $d417
         sta l100a
         cpy #$01
         bne l1387
         ldy l1772,x
         lda l1950,y
         sta l17bb
         tay
         lda l18fd,y
         and #$80
         cmp #$80
         bne l1382
         lda l18fe,y
         sta l17bd
l1382:    lda #$00
         sta l17bc
l1387:    lda #$03
         sta l1769,x
         lda l18fe
         bne l1394
         jmp l14c7
l1394:    dec l1769,x
         jmp l1680
l139a:    lda l17ae,x
         beq l13a5
         dec l17ae,x
         jmp l13f0
l13a5:    ldy l17ab,x
         lda l1913,y
         pha
         lsr
         lsr
         lsr
         lsr
         sta l179f,x
         pla
         and #$0f
         sta l17a2,x
         lda l1914,y
         sta l17a5,x
         lda l1915,y
         sta l174d
         and #$3f
         asl
         sta l17ae,x
         bit l174d
         bpl l13e4
         lda l1916,y
         pha
         and #$f0
         sta l17b1,x
         pla
         and #$0f
         sta l17b4,x
         lda #$00
         sta l17a8,x
l13e4:    bit l174d
         bvs l13f0
         tya
         clc
         adc #$04
         sta l17ab,x
l13f0:    lda l17a8,x
         bne l140e
         lda l17b1,x
         clc
         adc l17a5,x
         sta l17b1,x
         lda l17b4,x
         adc #$00
         sta l17b4,x
         cmp l17a2,x
         bne l142d
         beq l1425
l140e:    lda l17b1,x
         sec
         sbc l17a5,x
         sta l17b1,x
         lda l17b4,x
         sbc #$00
         sta l17b4,x
         cmp l179f,x
         bne l142d
l1425:    lda l17a8,x
         eor #$01
         sta l17a8,x
l142d:    cpx #$00
         beq l1434
         jmp l14c7
l1434:    lda l17bc
         beq l143f
         dec l17bc
         jmp l149a
l143f:    ldy l17bb
         lda l18fb,y
         pha
         and #$f0
         sta l17b7
         pla
         asl
         asl
         asl
         asl
         sta l17b8
         lda l18fc,y
         sta l17b9
         lda l18fd,y
         sta l174d
         and #$3f
         asl
         sta l17bc
         bit l174d
         bpl l148e
         lda l100a
         and #$0f
         sta l174d
         lda l18fe,y
         pha
         and #$f0
         sta l17bd
         pla
         asl
         asl
         asl
         asl
         ora l174d
         sta l100a
         sta $d417
         lda #$00
         sta l17ba
l148e:    bit l174d
         bvs l149a
         tya
         clc
         adc #$04
         sta l17bb
l149a:    lda l17ba
         bne l14b0
         lda l17bd
         clc
         adc l17b9
         sta l17bd
         cmp l17b8
         bcc l14c7
         bcs l14bf
l14b0:    lda l17bd
         sec
         sbc l17b9
         sta l17bd
         cmp l17b7
         bcs l14c7
l14bf:    lda l17ba
         eor #$01
         sta l17ba
l14c7:    ldy l1772,x
         lda l194f,y
         and #$f0
         cmp #$10
         bne l14f2
         ldy l17be,x
         lda l17ff,y
         cmp #$7f
         bne l14e7
         lda l187d,y
         sta l17be,x
         tay
         lda l17ff,y
l14e7:    sta l100f,x
         lda #$00
         sta l100c,x
         jmp l1531
l14f2:    ldy l17be,x
         lda l17ff,y
         bmi l150a
         cmp #$7f
         bne l1510
         lda l187d,y
         sta l17be,x
         tay
         lda l17ff,y
         bpl l1510
l150a:    asl
         ldy #$01
         jmp l151b
l1510:    clc
         adc l1014,x
         asl
         clc
         adc l1017,x
         ldy #$00
l151b:    sty l174d
         tay
         lda l168d,y
         clc
         adc l17d6,x
         sta l100c,x
         lda l168e,y
         adc #$00
         sta l100f,x
l1531:    ldy l17be,x
         lda l187d,y
         sta l1778,x
         inc l17be,x
         lda l17cd,x
         beq l1595
         lda l17c7,x
         bne l155d
         lda l17d0,x
         clc
         adc l17c1,x
         sta l17d0,x
         lda l17d3,x
         adc l17c4,x
         sta l17d3,x
         jmp l1570
l155d:    lda l17d0,x
         sec
         sbc l17c1,x
         sta l17d0,x
         lda l17d3,x
         sbc l17c4,x
         sta l17d3,x
l1570:    lda l174d
         bne l1588
         lda l100c,x
         clc
         adc l17d0,x
         sta l100c,x
         lda l100f,x
         adc l17d3,x
         sta l100f,x
l1588:    lda l1769,x
         cmp #$01
         beq l1592
         dec l1769,x
l1592:    jmp l1656
l1595:    lda l1769,x
         beq l15d8
         cmp #$01
         beq l15a4
         dec l1769,x
         jmp l1656
l15a4:    ldy l1772,x
         lda l194e,y
         lsr
         lsr
         lsr
         lsr
         sta l1787,x
         sec
         sbc #$01
         sta l1784,x
         lda #$00
         sta l1790,x
         sta l1796,x
         sta l1799,x
         lda l194d,y
         pha
         and #$f0
         sta l179c,x
         pla
         and #$0f
         asl
         sta l1793,x
         dec l1769,x
         jmp l1656
l15d8:    lda l1787,x
         beq l1656
         dec l1793,x
         bmi l15e5
         jmp l1656
l15e5:    inc l1793,x
         lda l100f,x
         lsr
         lsr
         lsr
         sta l100b
         lda l179c,x
         clc
         adc l100b
         sta l178a,x
         lda #$00
         adc #$00
         sta l178d,x
         dec l1784,x
         bpl l1615
         lda l1790,x
         eor #$01
         sta l1790,x
         lda l1787,x
         sta l1784,x
l1615:    lda l1790,x
         bne l1630
         lda l1796,x
         clc
         adc l178a,x
         sta l1796,x
         lda l1799,x
         adc l178d,x
         sta l1799,x
         jmp l1643
l1630:    lda l1796,x
         sec
         sbc l178a,x
         sta l1796,x
         lda l1799,x
         sbc l178d,x
         sta l1799,x
l1643:    lda l100c,x
         clc
         adc l1796,x
         sta l100c,x
         lda l100f,x
         adc l1799,x
         sta l100f,x
l1656:    ldy l1760,x
         lda l17b1,x
         sta $d402,y
         lda l17b4,x
         sta $d403,y
         lda l17bd
         sta $d416
         lda l100c,x
         sta $d400,y
         lda l100f,x
         sta $d401,y
         lda l1778,x
         and l101a,x
         sta $d404,y
l1680:    dex
         bmi l1686
         jmp l111a
l1686:    pla
         sta $fc
         pla
         sta $fb
         rts
         //
//---------------------------------------
//Note-frequenties...
//---------------------------------------
l168d:    .byte $16
l168e:    .byte $01,$27,$01,$38,$01
         .byte $4b,$01,$5f,$01,$73,$01
         .byte $8a,$01,$a1,$01,$ba,$01
         .byte $d4,$01,$f0,$01,$0e,$02
         .byte $2d,$02,$4e,$02,$71,$02
         .byte $96,$02,$bd,$02,$e7,$02
         .byte $13,$03,$42,$03,$74,$03
         .byte $a9,$03,$e0,$03,$1b,$04
         .byte $5a,$04,$9b,$04,$e2,$04
         .byte $2c,$05,$7b,$05,$ce,$05
         .byte $27,$06,$85,$06,$e8,$06
         .byte $51,$07,$c1,$07,$37,$08
         .byte $b4,$08,$37,$09,$c4,$09
         .byte $57,$0a,$f5,$0a,$9c,$0b
         .byte $4e,$0c,$09,$0d,$d0,$0d
         .byte $a3,$0e,$82,$0f,$6e,$10
         .byte $68,$11,$6e,$12,$88,$13
         .byte $af,$14,$eb,$15,$39,$17
         .byte $9c,$18,$13,$1a,$a1,$1b
         .byte $46,$1d,$04,$1f,$dc,$20
         .byte $d0,$22,$dc,$24,$10,$27
         .byte $5e,$29,$d6,$2b,$72,$2e
         .byte $38,$31,$26,$34,$42,$37
         .byte $8c,$3a,$08,$3e,$b8,$41
         .byte $a0,$45,$b8,$49,$20,$4e
         .byte $bc,$52,$ac,$57,$e4,$5c
         .byte $70,$62,$4c,$68,$84,$6e
         .byte $18,$75,$10,$7c,$70,$83
         .byte $40,$8b,$70,$93,$40,$9c
         .byte $78,$a5,$58,$af,$c8,$b9
         .byte $e0,$c4,$98,$d0,$08,$dd
         .byte $30,$ea,$20,$f8,$2e,$fd
//---------------------------------------
l174d:    .byte $01
//---------------------------------------
//Voice-addresses...
//---------------------------------------
l174e:    .byte <v1,<v2,<v3
l1751:    .byte >v1,>v2,>v3
         //
l1754:    .byte <v1,<v2,<v3
l1757:    .byte >v1,>v2,>v3
         //
//---------------------------------------
//Registers used...
//---------------------------------------
l175a:    .byte $01,$02,$04
l175d:    .byte $fe,$fd,$fb //$d417
l1760:    .byte $00,$07,$0e
l1763:    .byte $fe,$fe,$fe
l1766:    .byte $00,$00,$00
l1769:    .byte $00,$00,$00
l176c:    .byte $00,$00,$00
l176f:    .byte $00,$00,$00
l1772:    .byte $18,$00,$60
l1775:    .byte $08,$08,$2f
l1778:    .byte $41,$40,$11 //$d404
l177b:    .byte $02
l177c:    .byte $02
l177d:    .byte $02
l177e:    .byte $00,$00,$00
l1781:    .byte $00,$00,$00
l1784:    .byte $00,$00,$00
l1787:    .byte $00,$00,$00
l178a:    .byte $20,$00,$83
l178d:    .byte $00,$00,$00
l1790:    .byte $00,$00,$00
l1793:    .byte $02,$00,$00
l1796:    .byte $00,$00,$00
l1799:    .byte $00,$00,$00
l179c:    .byte $20,$00,$00
l179f:    .byte $05,$00,$00
l17a2:    .byte $00,$00,$00
l17a5:    .byte $40,$00,$00
l17a8:    .byte $00,$00,$00
l17ab:    .byte $08,$00,$00
l17ae:    .byte $03,$74,$5c
l17b1:    .byte $00,$00,$00 //$d402
l17b4:    .byte $06,$08,$08 //$d403
l17b7:    .byte $10
l17b8:    .byte $10
l17b9:    .byte $0f
l17ba:    .byte $01
l17bb:    .byte $08
l17bc:    .byte $00
l17bd:    .byte $af         //$d416
l17be:    .byte $1a,$29,$2e
l17c1:    .byte $f0,$00,$00
l17c4:    .byte $00,$00,$03
l17c7:    .byte $00,$00,$80
l17ca:    .byte $00,$00,$00
l17cd:    .byte $00,$00,$00
l17d0:    .byte $c0,$00,$00
l17d3:    .byte $03,$00,$e5
l17d6:    .byte $00,$01,$02
//---------------------------------------
l17d9:    .byte $02,$05,$08,$0b,$0e,$11
         .byte $14,$17,$1a,$1d,$20,$23
         .byte $26,$29,$2c,$2f,$00,$00
         .byte $00,$fc,$3c,$01
//---------------------------------------
l17ef:    .byte <v1
l17f0:    .byte >v1
l17f1:    .byte <v2
l17f2:    .byte >v2
         .byte <v3,>v3
         .byte $02,$07,<v1,>v1,<v2,>v2
         .byte <v3,>v3,$ff,$ff
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
l17ff:    .byte $df,$10
         .byte $08,$10,$40,$40,$7f
//---------------------------------------
         .byte $40
         .byte $10,$0a,$08,$06,$04,$00
         .byte $7f
//---------------------------------------
         .byte $df,$00,$04,$07,$7f
//---------------------------------------
         .byte $df,$00,$02,$06,$7f
//---------------------------------------
         .byte $df
         .byte $00,$7f
//---------------------------------------
         .byte $00,$7f
//---------------------------------------
         .byte $df,$00
         .byte $03,$07,$7f
//---------------------------------------
         .byte $df,$00,$03
         .byte $05,$7f
//---------------------------------------
         .byte $df,$2f,$2c,$28
         .byte $7f
//---------------------------------------
         .byte $df,$00,$7f,$01,$00
         .byte $00,$7f,$00,$00,$00,$03
         .byte $03,$03,$05,$05,$05,$7f
         .byte $00,$04,$07,$09,$0c,$10
         .byte $13,$15,$13,$10,$0c,$09
         .byte $07,$04,$00,$7f,$00,$02
         .byte $06,$09,$0c,$0e,$12,$15
         .byte $12,$0e,$0c,$09,$06,$02
         .byte $00,$7f,$00,$03,$07,$0a
         .byte $0c,$0f,$13,$16,$13,$0f
         .byte $0c,$0a,$07,$03,$00,$7f
         .byte $00,$03,$05,$0a,$0c,$0f
         .byte $11,$16,$11,$0f,$0c,$0a
         .byte $05,$03,$00,$7f
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
l187d:    .byte $81,$41,$40,$40,$80,$80
         .byte $04
//---------------------------------------
         .byte $81,$11,$41,$40,$40
         .byte $40,$00,$0d
//---------------------------------------
         .byte $81,$41,$41
         .byte $41,$10,$81,$41,$41,$41
         .byte $15
//---------------------------------------
         .byte $81,$40,$1a,$00,$1c
//---------------------------------------
         .byte $81,$41,$41,$41,$1f
//---------------------------------------
         .byte $81
         .byte $11,$11,$11,$24
//---------------------------------------
         .byte $81,$16
         .byte $16,$16,$29
//---------------------------------------
         .byte $81,$11,$2e
//---------------------------------------
         .byte $21,$21,$41,$32
//---------------------------------------
         .byte $11,$11
         .byte $11,$11,$11,$11,$11,$11
         .byte $11,$34
//---------------------------------------
         .byte $41,$41,$41,$41
         .byte $41,$41,$41,$41,$41,$41
         .byte $41,$41,$41,$41,$41
//---------------------------------------
         .byte $3e
         .byte $41,$41,$41,$41,$41,$41
         .byte $41,$41,$41,$41,$41,$41
         .byte $41,$41,$41,$4e
//---------------------------------------
         .byte $41,$41
         .byte $41,$41,$41,$41,$41,$41
         .byte $41,$41,$41,$41,$41,$41
         .byte $41,$5e
//---------------------------------------
         .byte $41,$41,$41,$41
         .byte $41,$41,$41,$41,$41,$41
         .byte $41,$41,$41,$41,$41,$6e
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
l18fb:    .byte $0f            //$d405+6
l18fc:    .byte $00            //$d405+6
l18fd:    .byte $09            //$d404
l18fe:    .byte $01,$11,$0f
         .byte $80,$af,$11,$0f,$cf,$6f
         .byte $11,$0f,$80,$af,$1c,$0b
         .byte $cf,$5f,$00,$00,$00,$00
//---------------------------------------
l1913:    .byte $00
l1914:    .byte $00
l1915:    .byte $ff
l1916:    .byte $08,$50,$40
         .byte $83,$05,$50,$40,$4f,$00
         .byte $25,$30,$83,$03,$25,$30
         .byte $4f,$00,$00,$10,$83,$01
         .byte $0f,$80,$83,$10,$f4,$20
         .byte $ff,$70,$00,$10,$84,$01
         .byte $0f,$80,$04,$00,$0f,$a0
         .byte $04,$00,$0f,$d0,$09,$00
         .byte $01,$20,$ff,$01,$00,$00
         .byte $00,$00
//---------------------------------------
//Presets...
//---------------------------------------
l194b:    .byte $00 //$d405
l194c:    .byte $b8 //$d406
l194d:    .byte $00
l194e:    .byte $00
l194f:    .byte $10 //$d418
l1950:    .byte $00
l1951:    .byte $00
l1952:    .byte $00
//---------------------------------------
         .byte $00,$f7,$00,$00
         .byte $10,$00,$00
         .byte $07
//---------------------------------------
         .byte $00,$00
         .byte $00,$00,$00,$00,$00,$00
//---------------------------------------
         .byte $07,$b8,$00,$02,$03,$0c
         .byte $0c,$0f
//---------------------------------------
         .byte $07,$b8,$00,$02
         .byte $03,$0c,$0c,$14
//---------------------------------------
         .byte $08,$cd
         .byte $22,$32,$07,$02,$04,$19
//---------------------------------------
         .byte $0f,$f8,$00,$02,$01,$04
         .byte $04,$19
//---------------------------------------
         .byte $07,$b8,$00,$02
         .byte $03,$0c,$0c,$1e
//---------------------------------------
         .byte $07,$b8
         .byte $00,$00,$00,$00,$0c,$23
//---------------------------------------
         .byte $00,$e4,$00,$02,$10,$00
         .byte $00,$28
//---------------------------------------
         .byte $20,$f8,$00,$02
         .byte $00,$00,$00,$2d
//---------------------------------------
         .byte $20,$98
         .byte $00,$02,$00,$00,$00,$2d
//---------------------------------------
         .byte $20,$58,$00,$02,$00,$00
         .byte $00,$2d
//---------------------------------------
         .byte $20,$ab,$83,$32
         .byte $00,$00,$14,$30
//---------------------------------------
         .byte $a0,$bc
         .byte $83,$32,$00,$00,$14,$30
//---------------------------------------
         .byte $00,$01,$00,$00,$00,$00
         .byte $20,$1c
//---------------------------------------
         .byte $90,$bc,$83,$32
         .byte $00,$00,$14,$30
//---------------------------------------
         .byte $00,$da
         .byte $00,$00,$00,$00,$00,$34
//---------------------------------------
         .byte $cb,$cc,$00,$00,$00,$00
         .byte $20,$3e
//---------------------------------------
         .byte $cb,$cc,$00,$00
         .byte $00,$00,$20,$4e
//---------------------------------------
         .byte $cb,$cc
         .byte $00,$00,$00,$00,$20,$5e
//---------------------------------------
         .byte $cb,$cc,$00,$00,$00,$00
         .byte $20,$6e
//---------------------------------------
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
l1a03:    .byte $00
l1a04:    .byte $00,$00,$00,$00,$00
         .byte $00,$00,$00,$00,$00,$00
         .byte $00,$00,$00,$00,$00,$00
         .byte $fe,$fe,$00,$00
//---------------------------------------
//Voice-editor...
//---------------------------------------
v1:       .byte $8c,$00
         .byte $ff,$02,$03,$04,$01,$02
         .byte $03,$04,$01,$02,$03,$0b
         .byte $01,$02,$03,$04,$01,$02
         .byte $03,$0b,$01,$02,$03,$04
         .byte $01,$02,$03,$04,$01,$02
         .byte $03,$04,$01,$03,$01,$03
         .byte $01,$03,$01,$03,$01,$02
         .byte $03,$04,$01,$02,$03,$04
         .byte $01,$02,$03,$04,$01,$02
         .byte $03,$04,$01,$02,$03,$04
         .byte $01,$02,$03,$04,$ff
//---------------------------------------
v2:       .byte $8c
         .byte $05,$ff,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$05
         .byte $05,$05,$05,$05,$05,$ff
//---------------------------------------
v3:       .byte $98,$04,$ff,$07,$06,$07
         .byte $08,$09,$08,$0a,$06,$07
         .byte $06,$07,$80,$0f,$10,$11
         .byte $13,$0f,$10,$11,$12,$8c
         .byte $0c,$0d,$0c,$0e,$0c,$0d
         .byte $0c,$0e,$06,$07,$06,$07
         .byte $15,$16,$17,$18,$15,$16
         .byte $17,$18,$14,$14,$14,$14
         .byte $ff
//---------------------------------------
//Sequence-addresses...
//---------------------------------------
l1ad0:    .byte <s0,<s1,<s2,<s3,<s4,<s5
         .byte <s6,<s7,<s8,<s9,<sa,<sb
         .byte <sc,<sd,<se,<sf,<s10
         .byte <s11,<s12,<s13,<s14,<s15
         .byte <s16,<s17,<s18
         //
l1ae9:    .byte >s0,>s1,>s2,>s3,>s4,>s5
         .byte >s6,>s7,>s8,>s9,>sa,>sb
         .byte >sc,>sd,>se,>sf,>s10
         .byte >s11,>s12,>s13,>s14,>s15
         .byte >s16,>s17,>s18
//---------------------------------------
//Sequence-editor...
//---------------------------------------
s0:       .byte $80,$00,$7f
//---------------------------------------
s1:       .byte $a5,$80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$13,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$16,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$15,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$13,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$11,$80,$00
         .byte $80,$13,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$13,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$16,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$18,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$16,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$0c,$80,$00
         .byte $80,$15,$80,$00
         .byte $80,$13,$80,$00,$7f
//---------------------------------------
s2:       .byte $a5,$80
         .byte $0c,$82,$00,$a4,$80,$27
         .byte $82,$00,$a5,$80,$0c,$00
         .byte $a4,$27,$82,$00,$a5,$80
         .byte $0c,$00,$a4,$27,$82,$00
         .byte $a5,$80,$0c,$00,$a4,$27
         .byte $82,$00,$a5,$80,$0c,$00
         .byte $a4,$27,$82,$00,$7f
//---------------------------------------
s3:       .byte $a5
         .byte $80,$0a,$82,$00,$a7,$80
         .byte $26,$82,$00,$a5,$80,$0a
         .byte $00,$a7,$26,$82,$00,$a5
         .byte $80,$0a,$00,$a7,$26,$82
         .byte $00,$a5,$80,$0a,$00,$a7
         .byte $26,$82,$00,$a5,$80,$0a
         .byte $00,$a7,$26,$82,$00,$7f
//---------------------------------------
s4:       .byte $a9,$80,$00,$82,$00,$a8
         .byte $80,$26,$82,$00,$a9,$80
         .byte $00,$00,$a8,$26,$82,$00
         .byte $a9,$80,$00,$00,$a8,$26
         .byte $82,$00,$a9,$80,$00,$00
         .byte $a8,$26,$82,$00,$a9,$80
         .byte $00,$00,$a8,$26,$82,$00
         .byte $7f
//---------------------------------------
s5:       .byte $a1,$80,$24,$82,$00
         .byte $a9,$80,$3c,$00,$3c,$00
         .byte $a0,$24,$82,$00,$a9,$80
         .byte $3c,$00,$3c,$00,$a1,$24
         .byte $82,$00,$a9,$80,$3c,$00
         .byte $3c,$00,$a0,$24,$82,$00
         .byte $a9,$80,$3c,$00,$3c,$00
         .byte $7f
//---------------------------------------
s6:       .byte $aa,$80,$3a,$00,$ab
         .byte $3a,$00,$ac,$3a,$00,$aa
         .byte $37,$00,$ab,$37,$00,$ac
         .byte $37,$00,$aa,$33,$00,$ab
         .byte $33,$00,$ac,$33,$8f,$00
         .byte $8e,$00,$aa,$80,$3a,$00
         .byte $ab,$3a,$00,$ac,$3a,$82
         .byte $00,$aa,$80,$3c,$00,$ab
         .byte $3c,$00,$ac,$3c,$82,$00
         .byte $7f
//---------------------------------------
s7:       .byte $aa,$80,$39,$00,$ab
         .byte $39,$00,$ac,$39,$00,$aa
         .byte $35,$00,$ab,$35,$00,$ac
         .byte $35,$00,$aa,$32,$00,$ab
         .byte $32,$00,$ac,$32,$8a,$00
         .byte $aa,$80,$30,$00,$ac,$30
         .byte $00,$aa,$32,$00,$ab,$32
         .byte $00,$ac,$32,$8f,$00,$8a
         .byte $00,$7f
//---------------------------------------
s8:       .byte $ae,$85,$27,$8f
         .byte $00,$85,$00,$ad,$80,$29
         .byte $82,$00,$80,$2b,$84,$00
         .byte $80,$29,$84,$00,$80,$2b
         .byte $86,$00,$b0,$84,$29,$80
         .byte $00,$ad,$26,$84,$00,$7f
//---------------------------------------
s9:       .byte $80,$29,$84,$00,$80,$2b
         .byte $8f,$00,$88,$00,$aa,$80
         .byte $3a,$00,$ab,$3a,$00,$ac
         .byte $3a,$00,$aa,$37,$00,$ab
         .byte $37,$00,$ac,$37,$00,$aa
         .byte $35,$00,$ab,$35,$00,$ac
         .byte $35,$00,$aa,$32,$00,$ab
         .byte $32,$00,$ac,$32,$00,$aa
         .byte $30,$00,$ac,$30,$00,$aa
         .byte $2e,$00,$ac,$2e,$00,$7f
//---------------------------------------
sa:       .byte $80,$29,$8e,$00,$b1,$80
         .byte $26,$8e,$00,$aa,$80,$30
         .byte $00,$ab,$30,$00,$ac,$30
         .byte $00,$aa,$32,$00,$ab,$32
         .byte $00,$ac,$32,$00,$aa,$35
         .byte $00,$ab,$35,$00,$ac,$35
         .byte $00,$aa,$37,$00,$ab,$37
         .byte $00,$ac,$37,$00,$aa,$3a
         .byte $00,$ac,$3a,$00,$aa,$3c
         .byte $00,$ac,$3c,$00,$7f
//---------------------------------------
sb:       .byte $a5
         .byte $80,$0a,$82,$00,$a8,$80
         .byte $26,$82,$00,$a5,$80,$0a
         .byte $00,$a8,$26,$82,$00,$a5
         .byte $80,$0a,$00,$a8,$26,$82
         .byte $00,$a5,$80,$0a,$00,$a8
         .byte $26,$82,$00,$a5,$80,$0a
         .byte $00,$a8,$26,$82,$00,$7f
//---------------------------------------
sc:       .byte $aa,$80,$33,$00,$ab,$33
         .byte $00,$ac,$33,$00,$aa,$35
         .byte $00,$ab,$35,$00,$ac,$35
         .byte $00,$aa,$37,$00,$ab,$37
         .byte $00,$ac,$37,$82,$00,$aa
         .byte $80,$3a,$00,$ab,$3a,$00
         .byte $ac,$3a,$00,$aa,$37,$00
         .byte $ab,$37,$00,$ac,$37,$00
         .byte $7f
//---------------------------------------
sd:       .byte $aa,$80,$39,$00,$ab
         .byte $39,$00,$ac,$39,$00,$aa
         .byte $35,$00,$ab,$35,$00,$ac
         .byte $35,$00,$aa,$32,$00,$ab
         .byte $32,$00,$ac,$32,$82,$00
         .byte $aa,$80,$30,$00,$ab,$30
         .byte $00,$ac,$30,$00,$aa,$32
         .byte $00,$ab,$32,$00,$ac,$32
         .byte $00,$7f
//---------------------------------------
se:       .byte $aa,$80,$39,$00
         .byte $ab,$39,$00,$ac,$39,$8e
         .byte $00,$80,$32,$00,$ab,$32
         .byte $00,$aa,$32,$00,$ac,$35
         .byte $00,$ab,$35,$00,$aa,$35
         .byte $00,$7f
//---------------------------------------
sf:       .byte $ad,$80,$3a,$84
         .byte $00,$80,$37,$84,$00,$80
         .byte $33,$86,$00,$b0,$83,$3a
         .byte $ad,$80,$39,$82,$00,$80
         .byte $37,$82,$00,$7f
//---------------------------------------
s10:      .byte $80,$39
         .byte $84,$00,$80,$3a,$84,$00
         .byte $80,$3c,$86,$00,$80,$3a
         .byte $84,$00,$ae,$85,$39,$7f
//---------------------------------------
s11:      .byte $ad,$80,$39,$84,$00,$80
         .byte $35,$84,$00,$80,$32,$88
         .byte $00,$ac,$80,$3c,$00,$ab
         .byte $3c,$00,$aa,$3c,$00,$ad
         .byte $35,$82,$00,$7f
//---------------------------------------
s12:      .byte $80,$37
         .byte $8f,$00,$82,$00,$aa,$80
         .byte $3e,$00,$ab,$3e,$00,$ac
         .byte $3e,$00,$aa,$41,$00,$ab
         .byte $41,$00,$ac,$41,$00,$7f
//---------------------------------------
s13:      .byte $80,$37,$8f,$00,$8e,$00
         .byte $7f
//---------------------------------------
s14:      .byte $8f,$00,$00,$00,$00
         .byte $7f
//---------------------------------------
s15:      .byte $b2,$88,$27,$8f,$00
         .byte $86,$00,$7f
//---------------------------------------
s16:      .byte $b3,$88,$27
         .byte $8f,$00,$86,$00,$7f
//---------------------------------------
s17:      .byte $b4
         .byte $88,$26,$8f,$00,$86,$00
         .byte $7f
//---------------------------------------
s18:      .byte $b5,$88,$26,$8f,$00
         .byte $86,$00,$7f
//---------------------------------------

