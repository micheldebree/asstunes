.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)

//---------------------------------------
//LAXITY 3x Player, re-assembled by
//                  Youth/HeatWave
//---------------------------------------
.var musicloc = $1000
.var musicstr = musicloc
.var speed    = 3
//---------------------------------------

.var afd      = $fd
.var afe      = $fe
.var aff      = $ff

         .pc= musicloc-3

         jmp player
init:     jmp i1557
         jmp i155d
//---------------------------------------
         .text " - muze by heatwave  - "
         .text "{cm asterisk}{cm b}{cm u}{cm +}{cm -}{cm e}{cm u}{cm e}{cm q}"
         .text " - player by laxity! - "
//---------------------------------------
play:     lda #$1f
         sta $d418
         bit a1572
         bmi i1047
         bvs i1046
         ldx #$02
i1014:    lda #$01
         sta f157c,x
         lda #$00
         sta f15df,x
         sta f15ee,x
         sta f15e8,x
         sta f15c4,x
         sta f15a9,x
         sta f1588,x
         sta f15eb,x
         dex
         bpl i1014
         ldy #$14
i1035:    sta $d400,y
         dey
         bpl i1035
         lda a156f
         sta a1570
         lda #$80
         sta a1572
i1046:    rts
i1047:    ldx #$02
         dec a1570
         bpl i105d
         dec a157c
         dec a157d
         dec a157e
         lda a156f
         sta a1570
i105d:    lda #$00
         sta a1575
i1062:    lda f1569,x
         sta a1573
         lda f157c,x
         bpl i1070
         jmp i10fa
i1070:    bne i107e
         lda a1570
         beq i10b9
         cmp #$03
         bcs i107e
         jmp i1081
i107e:    jmp i1258
i1081:    lda f15e5,x
         bne i10b6
         lda a156f
         cmp #$03
         bcs i1092
         lda f15af,x
         beq i10a1
i1092:    lda a1570
         cmp #$02
         beq i10b1
         lda #$00
         sta f15a6,x
         jmp i1258
i10a1:    lda a1570
         bne i10b6
         ldy f1588,x
         lda f16b2,y
         and #$f0
         sta f15a6,x
i10b1:    lda #$fe
         sta f15a9,x
i10b6:    jmp i1258
i10b9:    lda f1563,x
         sta afd
         lda f1566,x
         sta afe
         ldy f15df,x
i10c6:    lda (afd),y
         bpl i10f0
         cmp #$ff
         bne i10d3
         ldy #$00
         jmp i10c6
i10d3:    cmp #$fe
         bne i10da
         jmp i155d
i10da:    cmp #$c0
         bcs i10e7
         and #$1f
         sta f1585,x
         iny
         jmp i10c6
i10e7:    and #$1f
         sta f15eb,x
         iny
         jmp i10c6
i10f0:    sta f15e2,x
         tya
         sta f15df,x
         jmp i1258
i10fa:    lda #$00
         sta f15e8,x
         sta f15c4,x
         sta f1591,x
         cmp f15e5,x
         bne i111e
         sta f15ac,x
         sta f1576,x
         sta f1579,x
         sta f159a,x
         sta f1582,x
         lda #$09
         sta f15a3,x
i111e:    ldy f15e2,x
         lda f1859,y
         sta afd
         lda f1874,y
         sta afe
         ldy f15ee,x
         lda (afd),y
         sta aff
         and #$1f
         sta f157c,x
         sta f15af,x
         lda aff
         and #$20
         beq i1143
         inc f15e8,x
i1143:    lda aff
         and #$40
         beq i114c
         inc f15c4,x
i114c:    lda aff
         and #$80
         beq i1192
         iny
         lda (afd),y
         cmp #$80
         bcs i1164
         and #$1f
         asl
         asl
         asl
         sta f1588,x
         jmp i1192
i1164:    sta aff
         cmp #$c0
         bcc i117b
         and #$1f
         asl
         asl
         asl
         sta f1588,x
         iny
         lda (afd),y
         sta f1594,x
         jmp i1192
i117b:    and #$1f
         sta f158e,x
         inc f1591,x
         lda aff
         and #$20
         beq i118c
         inc f1591,x
i118c:    iny
         lda (afd),y
         sta f158b,x
i1192:    iny
         lda (afd),y
         sta f157f,x
         iny
         tya
         sta f15ee,x
         lda (afd),y
         cmp #$ff
         bne i11b5
         dec f15eb,x
         bpl i11b0
         inc f15df,x
         lda #$00
         sta f15eb,x
i11b0:    lda #$00
         sta f15ee,x
i11b5:    lda f157f,x
         beq i11d8
         lda #$ff
         sta f15a9,x
         lda f157f,x
         bmi i11c8
         clc
         adc f1585,x
i11c8:    cmp f1582,x
         beq i1204
         sta f1582,x
         lda #$ff
         sta f15b8,x
         jmp i11e2
i11d8:    lda #$fe
         sta f15a9,x
         lda f15e5,x
         bne i1204
i11e2:    ldy f1588,x
         lda f16b3,y
         and #$0f
         sta f15d3,x
         inc f15d3,x
         lsr
         adc #$00
         sta f15b2,x
         lda #$00
         sta f15b5,x
         sta f15d0,x
         sta f15d9,x
         sta f15dc,x
i1204:    lda f15e5,x
         beq i1211
         lda #$02
         sta f15e5,x
         jmp i1258
i1211:    ldy f1588,x
         lda f16b2,y
         sta f15a6,x
         lda f16b5,y
         pha
         and #$0f
         sta f15a0,x
         pla
         and #$f0
         sta f159d,x
         lda f16b6,y
         sta f1597,x
         lda f16b4,y
         sta f15d6,x
         lda f16b7,y
         and #$40
         beq i1255
         lda f15c7,x
         bne i1255
         lda #$00
         sta f15c1,x
         lda f16b8,y
         sta f15be,x
         asl
         asl
         tay
         lda f1841,y
         sta a1574
i1255:    jmp i1498
i1258:    lda f1597,x
         beq i12a2
         asl
         asl
         tay
         lda f1829,y
         bmi i127a
         lda f159d,x
         clc
         adc f182a,y
         sta f159d,x
         lda f15a0,x
         adc #$00
         sta f15a0,x
         jmp i128c
i127a:    lda f159d,x
         sec
         sbc f182a,y
         sta f159d,x
         lda f15a0,x
         sbc #$00
         sta f15a0,x
i128c:    inc f159a,x
         lda f159a,x
         cmp f182b,y
         bcc i12a2
         lda #$00
         sta f159a,x
         lda f182c,y
         sta f1597,x
i12a2:    lda f15e5,x
         cmp #$02
         beq i12ef
         lda f1588,x
         clc
         adc f15ac,x
         tay
         inc f15ac,x
         lda f15ac,x
         cmp #$08
         bcc i12be
         dec f15ac,x
i12be:    lda f1721,y
         sta f15a3,x
         lda f1791,y
         sta f15bb,x
         bmi i12d3
         lda f1582,x
         clc
         adc f1791,y
i12d3:    asl
         tay
         lda f15bb,x
         cmp f15b8,x
         beq i12ef
         sta f15b8,x
         lda f15f1,y
         sta f1576,x
         lda f15f2,y
         sta f1579,x
         jmp i1498
i12ef:    ldy f1588,x
         lda f16b7,y
         and #$1f
         cmp #$1f
         beq i1311
         and #$10
         bne i1314
         lda f1582,x
         beq i130e
         lda f1591,x
         bne i1317
         lda f15b8,x
         beq i131d
i130e:    jmp i1498
i1311:    jmp i1478
i1314:    jmp i13ed
i1317:    jmp i1445
i131a:    jmp i13ea
i131d:    ldy f1588,x
         lda f16b3,y
         and #$0f
         beq i131a
         lda f16b7,y
         and #$80
         bne i1338
         lda f16b7,y
         and #$0f
         cmp f15af,x
         bcs i131a
i1338:    dec f15d6,x
         lda f15d6,x
         cmp #$ff
         bne i131a
         inc f15d6,x
         lda f1582,x
         asl
         tay
         sec
         lda f15f3,y
         sbc f15f1,y
         sta f15ca,x
         lda f15f4,y
         sbc f15f2,y
         sta f15cd,x
         ldy f1588,x
         lda f16b3,y
         lsr
         lsr
         lsr
         lsr
         beq i1374
         tay
         dey
i136b:    lsr f15cd,x
         ror f15ca,x
         dey
         bpl i136b
i1374:    lda f15ca,x
         clc
         adc f15d9,x
         sta f15ca,x
         lda f15cd,x
         adc f15dc,x
         sta f15cd,x
         lda f15d0,x
         bmi i13a2
         lda f1576,x
         clc
         adc f15ca,x
         sta f1576,x
         lda f1579,x
         adc f15cd,x
         sta f1579,x
         jmp i13b5
i13a2:    lda f1576,x
         sec
         sbc f15ca,x
         sta f1576,x
         lda f1579,x
         sbc f15cd,x
         sta f1579,x
i13b5:    inc f15b2,x
         lda f15b2,x
         cmp f15d3,x
         bcc i13ea
         lda f15d0,x
         eor #$80
         sta f15d0,x
         lda #$00
         sta f15b2,x
         ldy f1588,x
         lda f16b7,y
         and #$80
         beq i13ea
         lda f16b7,y
         asl
         asl
         asl
         asl
         clc
         adc f15d9,x
         sta f15d9,x
         bcc i13ea
         inc f15dc,x
i13ea:    jmp i1498
i13ed:    lda f15b5,x
i13f0:    clc
         adc f1594,x
         tay
         lda f1801,y
         beq i1420
         cmp #$ff
         bne i1406
         lda #$00
         sta f15b5,x
         jmp i13f0
i1406:    clc
         adc f1582,x
         asl
         tay
         lda f15f1,y
         pha
         lda f15f2,y
         ldy a1573
         sta $d401,y
         pla
         sta $d400,y
         dec a1571
i1420:    ldy f1588,x
         inc f15d0,x
         lda f16b7,y
         and #$0f
         cmp f15d0,x
         bcs i143d
         lda #$00
         sta f15d0,x
         inc f15b5,x
         lda a1571
         bpl i1440
i143d:    jmp i1498
i1440:    lda f1591,x
         beq i143d
i1445:    lda f1591,x
         cmp #$01
         bne i1462
         lda f1576,x
         clc
         adc f158b,x
         sta f1576,x
         lda f1579,x
         adc f158e,x
         sta f1579,x
         jmp i1498
i1462:    lda f1576,x
         sec
         sbc f158b,x
         sta f1576,x
         lda f1579,x
         sbc f158e,x
         sta f1579,x
         jmp i1498
i1478:    lda f1576,x
         sec
         sbc f16b3,y
         sta f1576,x
         lda f1579,x
         sbc f16b4,y
         bcc i1490
         sta f1579,x
         jmp i1498
i1490:    lda #$00
         sta f1576,x
         sta f1579,x
i1498:    ldy f1588,x
         lda f16b7,y
         and #$40
         beq i14f6
         lda a1575
         ora f156c,x
         sta a1575
         lda f15be,x
         asl
         asl
         tay
         lda f1842,y
         bmi i14c6
         and #$7f
         sta aff
         lda a1574
         clc
         adc aff
         sta a1574
         jmp i14d3
i14c6:    and #$7f
         sta aff
         lda a1574
         sec
         sbc aff
         sta a1574
i14d3:    inc f15c1,x
         lda f15c1,x
         cmp f1843,y
         bcc i14f6
         lda #$00
         sta f15c1,x
         lda f1844,y
         sta f15be,x
         asl
         asl
         tay
         lda f1841,y
         cmp #$ff
         beq i14f6
         sta a1574
i14f6:    ldy a1573
         lda a1571
         bmi i150a
         lda f1576,x
         sta $d400,y
         lda f1579,x
         sta $d401,y
i150a:    lda f159d,x
         sta $d402,y
         lda f15a6,x
         sta $d406,y
         lda f15a0,x
         sta $d403,y
         ldy f1588,x
         lda f16b1,y
         ldy a1573
         sta $d405,y
         lda f15a3,x
         and f15a9,x
         sta $d404,y
         lda f15e8,x
         sta f15e5,x
         lda f15c4,x
         sta f15c7,x
         lda #$00
         sta a1571
         dex
         bmi i1548
         jmp i1062
i1548:    lda a1574
         sta $d416
         lda a1575
         ora #$f0
         sta $d417
         rts
i1557:    lda #$00
         sta a1572
         rts
i155d:    lda #$40
         sta a1572
         rts
//---------------------------------------
//          TRACK POINTERS
//---------------------------------------
f1563:    .byte <t00,<t01,<t02
f1566:    .byte >t00,>t01,>t02
//---------------------------------------
//            VARIABLES
//---------------------------------------
f1569:    .byte $00,$07,$0e
f156c:    .byte $01,$02,$04
a156f:    .byte speed
a1570:    .byte $00
a1571:    .byte $00
a1572:    .byte $00
a1573:    .byte $00
a1574:    .byte $00
a1575:    .byte $00
f1576:    .byte $00,$00,$00
f1579:    .byte $00,$00,$00
a157c:
f157c:    .byte $00
a157d:    .byte $00
a157e:    .byte $00
f157f:    .byte $00,$00,$00
f1582:    .byte $00,$00,$00
f1585:    .byte $00,$00,$00
f1588:    .byte $00,$00,$00
f158b:    .byte $00,$00,$00
f158e:    .byte $00,$00,$00
f1591:    .byte $00,$00,$00
f1594:    .byte $00,$00,$00
f1597:    .byte $00,$00,$00
f159a:    .byte $00,$00,$00
f159d:    .byte $00,$00,$00
f15a0:    .byte $00,$00,$00
f15a3:    .byte $00,$00,$00
f15a6:    .byte $00,$00,$00
f15a9:    .byte $00,$00,$00
f15ac:    .byte $00,$00,$00
f15af:    .byte $00,$00,$00
f15b2:    .byte $00,$00,$00
f15b5:    .byte $00,$00,$00
f15b8:    .byte $00,$00,$00
f15bb:    .byte $00,$00,$00
f15be:    .byte $00,$00,$00
f15c1:    .byte $00,$00,$00
f15c4:    .byte $00,$00,$00
f15c7:    .byte $00,$00,$00
f15ca:    .byte $00,$00,$00
f15cd:    .byte $00,$00,$00
f15d0:    .byte $00,$00,$00
f15d3:    .byte $00,$00,$00
f15d6:    .byte $00,$00,$00
f15d9:    .byte $00,$00,$00
f15dc:    .byte $00,$00,$00
f15df:    .byte $00,$00,$00
f15e2:    .byte $00,$00,$00
f15e5:    .byte $00,$00,$00
f15e8:    .byte $00,$00,$00
f15eb:    .byte $00,$00,$00
f15ee:    .byte $00,$00,$00
//---------------------------------------
//    FREQ.TABLES (do not change!)
//---------------------------------------
f15f1:    .byte $16
f15f2:    .byte $01
f15f3:    .byte $27
f15f4:    .byte $01,$38,$01,$4b
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

f16b1:           // at/dec
.label f16b2    = *+1  // sus/rel
.label f16b3    = *+2  // vibrato
.label f16b4    = *+3  // vibrato
.label f16b5    = *+4  // pulse
.label f16b6    = *+5  // filter nr/pulse
.label f16b7    = *+6  // arp on/arp spd
.label f16b8    = *+7  // filter

//---------------------------------------
//                SOUNDS
//---------------------------------------
//00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//01 bass1
         .byte $00,$6a,$33,$04
         .byte $08,$01,$00,$00
//02 snare
         .byte $00,$59,$00,$00
         .byte $08,$00,$00,$03
//03 base
         .byte $05,$95,$00,$00
         .byte $08,$00,$00,$00
//04 arp
         .byte $01,$5b,$00,$00
         .byte $08,$00,$12,$00
//05 fluit
         .byte $01,$7a,$21,$04
         .byte $00,$00,$00,$00
//06 fles1
         .byte $00,$8e,$19,$00
         .byte $00,$00,$00,$00
//07 solo1
         .byte $01,$4a,$34,$10
         .byte $03,$02,$40,$01
//08 solo2
         .byte $01,$4f,$34,$10
         .byte $03,$02,$40,$01
//09 arp2
         .byte $01,$5c,$00,$00
         .byte $08,$00,$17,$00
//0a arp
         .byte $01,$35,$00,$00
         .byte $08,$00,$11,$00
//0b bass
         .byte $00,$74,$00,$00
         .byte $71,$01,$00,$04
//0c bassdown
         .byte $04,$7a,$80,$00
         .byte $80,$01,$5f,$01
//0d arp triangle
         .byte $00,$33,$00,$00
         .byte $00,$00,$11,$00
f1721:
//---------------------------------------
//           WAVETABLES
//---------------------------------------
//00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//01
         .byte $81,$41,$41,$41
         .byte $41,$41,$41,$41
//02
         .byte $81,$40,$40,$80
         .byte $80,$80,$80,$80
//03
         .byte $81,$10,$40,$40
         .byte $40,$40,$40,$40
//04
         .byte $41,$21,$20,$20
         .byte $20,$20,$20,$20
//05
         .byte $11,$11,$10,$10
         .byte $10,$10,$10,$10
//06
         .byte $13,$12,$12,$12
         .byte $12,$12,$12,$12
//07
         .byte $41,$41,$41,$41
         .byte $41,$41,$41,$41
//08
         .byte $41,$41,$41,$41
         .byte $41,$41,$41,$41
//09
         .byte $41,$21,$20,$20
         .byte $20,$20,$20,$20
//0a
         .byte $41,$41,$41,$21
         .byte $21,$21,$21,$21
//0b
         .byte $81,$41,$41,$41
         .byte $41,$41,$41,$41
//0c
         .byte $81,$41,$41,$40
         .byte $40,$40,$40,$40
//0d
         .byte $81,$11,$11,$11
         .byte $11,$11,$11,$11
f1791:
//---------------------------------------
//            NOTE TABLES
//---------------------------------------
//00
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//01
         .byte $c8,$a4,$00,$00
         .byte $00,$00,$00,$00
//02
         .byte $cc,$02,$7d,$ca
         .byte $ca,$ca,$ca,$ca
//03
         .byte $c8,$00,$7d,$7a
         .byte $77,$74,$71,$6e
//04
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//05
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//06
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//07
         .byte $02,$01,$00,$00
         .byte $00,$00,$00,$00
//08
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//09
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//0a
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//0b
         .byte $cc,$01,$00,$00
         .byte $00,$00,$00,$00
//0c
         .byte $cc,$00,$00,$00
         .byte $00,$00,$00,$00
//0d
         .byte $cc,$00,$00,$00
         .byte $00,$00,$00,$00
//---------------------------------------
//             ARPEGGIOS
//---------------------------------------
f1801:    .byte $0c,$07,$05,$00,$ff //00
         .byte $0c,$09,$04,$00,$ff //05
         .byte $00,$04,$07,$0b     //0a
         .byte $0c,$07,$04,$ff
//---------------------------------------
//            EXTRA-WAVES
//---------------------------------------
f1829:
.label f182a    = *+1        //41
.label f182b    = *+2        //21
.label f182c    = *+3        //11

         .byte $00,$00,$00,$00 //00
         .byte $00,$0f,$00,$01 //01
         .byte $00,$60,$20,$03 //02
         .byte $80,$60,$20,$02 //03
         .byte $00,$10,$50,$05 //04
         .byte $80,$10,$50,$04 //05

f1841:
.label f1842    = *+1
.label f1843    = *+2
.label f1844    = *+3

//---------------------------------------
//            FILTERS
//---------------------------------------
         .byte $ff,$00,$00,$00 //00

         .byte $70,$07,$10,$02 //01

         .byte $ff,$87,$10,$01 //02

         .byte $90,$00,$00,$00 //03

         .byte $80,$00,$00,$00 //04

         .byte $60,$01,$60,$00 //05
//---------------------------------------
//        BLOCK POINTERS
//---------------------------------------
f1859:    .byte <b00,<b01,<b02,<b03
         .byte <b04,<b05,<b06,<b07
         .byte <b08,<b09,<b0a,<b0b
       // .byte <b0c,<b0d,<b0e,<b0f
       // .byte <b10,<b11,<b12,<b13
       // .byte <b14,<b15,<b16,<b17
       // .byte <b18,<b19,<b1a

f1874:    .byte >b00,>b01,>b02,>b03
         .byte >b04,>b05,>b06,>b07
         .byte >b08,>b09,>b0a,>b0b
       // .byte >b0c,>b0d,>b0e,>b0f
       // .byte >b10,>b11,>b12,>b13
       // .byte >b14,>b15,>b16,>b17
       // .byte >b18,>b19,>b1a
//---------------------------------------
//              TRACKS
//---------------------------------------

t00:    // .byte $88,$03,$ff

         .byte $88,$01,$01
         .byte $07
         .byte $88,$03,$03,$03,$03
         .byte $8a,$03,$03,$03,$03
         .byte $03,$03,$03,$03
         .byte $ff

t01:    // .byte $88,$02,$ff

         .byte $88,$02,$02,$02,$02
         .byte $09
         .byte $02,$02
         .byte $8a,$02,$02,$02,$02
         .byte $ff

t02:    // .byte $88,$06,$ff,$ff

         .byte $88,$05,$05
         .byte $08
         .byte $88,$04,$06
         .byte $8a,$05,$05
         .byte $ff


//---------------------------------------
//           BLOCKS
//---------------------------------------
//        .byte dur, ..., note

// dur + $20 = legato
// dur + $80 = sound [nr]

// note + $80 = glide [spd]

// sound + $c0 = arpeggio [pointer]

//---------------------------------------
b00: // empty

         .byte $1f,$00
         .byte $ff
//---------------------------------------
b01: // intro-bassline1

         .byte $bf,$01,$0c,$1b,$0c
         .byte $03,$07
         .byte $3f,$0a,$1b,$0a
         .byte $03,$0b
         .byte $3f,$0c,$1b,$0c
         .byte $03,$07
         .byte $3f,$0a,$1b,$0a
         .byte $03,$0b,$ff
//---------------------------------------
b02: // chordline

         .byte $85,$c4,$00,$30
         .byte $0b,$30
         .byte $03,$30
         .byte $01,$30,$03,$30
         .byte $05,$30,$05,$30
         .byte $07,$30,$03,$30
         .byte $85,$02,$ac
         .byte $85,$c4,$00,$30

         .byte $85,$c4,$05,$2e
         .byte $0b,$2e,$03,$2e
         .byte $01,$2e,$03,$2e
         .byte $05,$2e,$05,$2e
         .byte $07,$2e,$03,$2e
         .byte $85,$02,$ac
         .byte $85,$c4,$05,$2e,$ff

//---------------------------------------
b03: // uptempo bass

         .byte $85,$0b,$0c
         .byte $01,$18
         .byte $83,$02,$ae
         .byte $a1,$0b,$16
         .byte $01,$18
         .byte $01,$05
         .byte $23,$07
         .byte $01,$18
         .byte $83,$02,$ae
         .byte $81,$0b,$0c

         .byte $23,$10
         .byte $01,$11
         .byte $01,$13
         .byte $01,$0c
         .byte $85,$02,$ae
         .byte $81,$0b,$0c
         .byte $21,$22
         .byte $01,$24
         .byte $20,$0b
         .byte $02,$0c
         .byte $83,$02,$ae
         .byte $81,$0b,$07
         .byte $81,$02,$ae
         .byte $ff

//---------------------------------------
b04: //solob1

         .byte $a1,$08,$34
         .byte $21,$35
         .byte $01,$37
         .byte $15,$3c
         .byte $20,$40

         .byte $00,$41
         .byte $25,$41
         .byte $01,$40
         .byte $01,$00
         .byte $01,$3c
         .byte $03,$37

         .byte $25,$41
         .byte $01,$40
         .byte $01,$00
         .byte $21,$3c
         .byte $03,$39

         .byte $95,$08,$3a
         .byte $01,$39
         .byte $23,$3a
         .byte $01,$39
         .byte $1b,$37
         .byte $07,$35

         .byte $ff
//---------------------------------------
b05: //soloa1

         .byte $a0,$07,$33,$20,$34
         .byte $03,$35
         .byte $05,$34,$25
         .byte $30,$1d,$2b
         .byte $05,$30,$05,$2b,$23,$2d
         .byte $20,$2c,$20,$2d,$33,$2e
         .byte $20,$2d,$20,$2e
         .byte $23,$2d,$3f,$2b
         .byte $23,$29

         .byte $21
         .byte $28,$21,$29,$07,$2b
         .byte $3f,$24
         .byte $20,$26,$20,$28,$20,$29
         .byte $20,$2b
         .byte $05,$2e,$05,$2d,$23,$2e
         .byte $21,$2d,$21,$2e
         .byte $27,$2b
         .byte $3f,$26,$13,$26
         .byte $ff
//---------------------------------------
b06: // solob2
         .byte $a1,$08,$34
         .byte $21,$35
         .byte $01,$37
         .byte $13,$30

         .byte $20,$2b
         .byte $20,$2d
         .byte $20,$30
         .byte $20,$32
         .byte $20,$34
         .byte $20,$35
         .byte $09,$37
         .byte $21,$35
         .byte $01,$34
         .byte $20,$34
         .byte $0c,$35
         .byte $21,$37
         .byte $21,$39
         .byte $21,$3a
         .byte $21,$39
         .byte $07,$3a
         .byte $20,$35
         .byte $16,$37
         .byte $20,$38
         .byte $20,$39
         .byte $20,$3a
         .byte $20,$3b
         .byte $11,$3c
         .byte $20,$3b
         .byte $20,$3a
         .byte $20,$39
         .byte $20,$38
         .byte $21,$37
         .byte $ff
//---------------------------------------
b07:
         .byte $bf,$01,$0c,$19,$0c
         .byte $83,$02,$ae
         .byte $01,$ae
         .byte $ff


b08:
         .byte $bf,$08,$24
         .byte $1f,$00
         .byte $ff
b09:
         .byte $bf,$c4,$00,$30
         .byte $1f,$00
         .byte $ff

b0a:
b0b:
b0c:
b0d:
b0e:
b0f:
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
//---------------------------------------
player:
//---------------------------------------
         sei
         lda #$00
         jsr init
p2:       lda #$62
p1:       cmp $d012
         bne p1
         inc $d020
         jsr play
         dec $d020
         lda $dc01
         and #4
         bne p2
         jmp $9000
//---------------------------------------


