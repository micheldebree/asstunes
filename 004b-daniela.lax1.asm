.pc =$0801 "Basic Upstart Program"
:BasicUpstart(player)
.encoding "petscii_mixed"

//---------------------------------------
//LAXITY 3x Player, re-assembled by
//                  Youth/HeatWave
//---------------------------------------
.var musicloc = $1000
.var musicstr = musicloc
.var speed    = 2
//---------------------------------------

.var afd      = $fd
.var afe      = $fe
.var aff      = $ff

         .pc= musicloc-3

         jmp player
init:     jmp i1557
         jmp i155d
//---------------------------------------
         .text " - muze by youth/htw - "
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
//01 bass
         .byte $01,$85,$34,$0c
         .byte $01,$01,$40,$01
//02 snare
         .byte $00,$88,$00,$00
         .byte $08,$00,$00,$00
//03 base
         .byte $00,$75,$00,$00
         .byte $08,$00,$00,$00
//04 arp
         .byte $01,$39,$00,$00
         .byte $04,$03,$12,$00
//05 pluck
         .byte $00,$47,$00,$00
         .byte $0a,$02,$00,$00
//06 arp
         .byte $01,$f9,$00,$00
         .byte $80,$08,$12,$00
//07 tom
         .byte $00,$95,$00,$00
         .byte $08,$00,$00,$00
//08 solo
         .byte $01,$4a,$34,$14
         .byte $01,$02,$01,$00
//09 solo fade
         .byte $00,$19,$34,$0c
         .byte $08,$00,$00,$00
//0a arp
         .byte $01,$35,$00,$00
         .byte $08,$00,$11,$00
//0b bass
         .byte $00,$74,$00,$00
         .byte $80,$01,$40,$04
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
         .byte $81,$40,$80,$80
         .byte $80,$80,$80,$80
//03
         .byte $81,$40,$40,$40
         .byte $40,$40,$40,$40
//04
         .byte $41,$41,$41,$41
         .byte $41,$41,$41,$41
//05
         .byte $81,$42,$40,$40
         .byte $40,$40,$40,$40
//06
         .byte $81,$15,$41,$41
         .byte $41,$41,$41,$41
//07
         .byte $81,$40,$40,$40
         .byte $40,$40,$40,$40
//08
         .byte $41,$41,$41,$41
         .byte $41,$41,$41,$41
//09
         .byte $11,$41,$21,$21
         .byte $21,$21,$21,$21
//0a
         .byte $41,$41,$41,$21
         .byte $21,$21,$21,$21
//0b
         .byte $41,$41,$41,$41
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
         .byte $cc,$00,$00,$00
         .byte $00,$00,$00,$00
//02
         .byte $cc,$7f,$cc,$cc
         .byte $cc,$cc,$cc,$cc
//03
         .byte $c8,$00,$7d,$7a
         .byte $77,$74,$71,$6e
//04
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//05
         .byte $cc,$00,$00,$00
         .byte $00,$00,$00,$00
//06
         .byte $c4,$00,$00,$00
         .byte $00,$00,$00,$00
//07
         .byte $c8,$00,$7d,$7a
         .byte $77,$74,$71,$6e
//08
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//09
         .byte $0c,$01,$00,$00
         .byte $00,$00,$00,$00
//0a
         .byte $00,$00,$00,$00
         .byte $00,$00,$00,$00
//0b
         .byte $00,$00,$00,$00
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
f1801:    .byte $09,$05,$00,$ff //00
         .byte $07,$03,$00,$ff //04
         .byte $07,$04,$00,$ff //08
         .byte $07,$05,$00,$ff //0c
         .byte $0a,$05,$00,$ff //10
         .byte $08,$05,$00,$ff //14
//---------------------------------------
//            FILTERS
//---------------------------------------
f1829:
.label f182a    = *+1        //41
.label f182b    = *+2        //21
.label f182c    = *+3        //11

         .byte $00,$00,$00,$00 //00
         .byte $00,$30,$20,$01 //01
         .byte $00,$90,$10,$03 //02
         .byte $00,$30,$1e,$04 //03
         .byte $80,$30,$1e,$03 //04
         .byte $00,$f0,$08,$06 //05
f1841:
.label f1842    = *+1
.label f1843    = *+2
.label f1844    = *+3

         .byte $78,$01,$20,$02 //00
         .byte $7f,$81,$f0,$00 //01
         .byte $00,$10,$20,$09 //02
         .byte $80,$10,$20,$08 //03
         .byte $ff,$00,$00,$00 //04
         .byte $78,$01,$10,$02 //05
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

t00:      .byte $8b,$01,$01,$01,$01

         .byte $8b,$04,$05,$04,$05
       // .byte $8d,$04,$05
         .byte $ff

t01:      .byte $8b,$08,$08,$08,$08

         .byte $8b,$02,$03,$02,$03
       // .byte $8d,$02,$03
         .byte $ff

t02:      .byte $8b,$00,$00,$00,$00

         .byte $8b,$06,$07,$06,$07
       // .byte $8d,$06,$07
         .byte $ff

//---------------------------------------
//           BLOCKS
//---------------------------------------
//        .byte dur, ..., note

// dur + $20 = legato
// dur + $80 = sound [nr]

// note + $80 = glide [spd]

// sound + $c0 = arpeggio [pointer]

b00:
         .byte $1f,$00
         .byte $1f,$00
         .byte $1f,$00
         .byte $1f,$00
         .byte $ff
b01:
         .byte $9f,$01,$0c
         .byte $13,$0c
         .byte $23,$09
         .byte $07,$07
         .byte $1f,$08
         .byte $17,$0a
         .byte $07,$07
         .byte $ff

b02: // chords
         .byte $9f,$c4,$00,$2b
         .byte $97,$c4,$04,$2d
         .byte $87,$c4,$08,$29
         .byte $9f,$c4,$0c,$2b
         .byte $9f,$c4,$08,$2b

         .byte $9f,$c4,$08,$2c
         .byte $9f,$c4,$08,$2e
         .byte $9f,$c4,$10,$2e
         .byte $97,$c4,$00,$2e
         .byte $87,$c4,$08,$2e
         .byte $ff
b03:
         .byte $9f,$c4,$08,$2c
         .byte $9f,$c4,$08,$2b
         .byte $9f,$c4,$14,$2b
         .byte $97,$c4,$14,$2b
         .byte $87,$c4,$08,$2e

         .byte $9f,$c4,$08,$2c
         .byte $9f,$c4,$08,$2b
         .byte $9f,$c4,$14,$2b
         .byte $9f,$c4,$14,$2b
         .byte $ff

b04: // bass

         .byte $83,$01,$0c
         .byte $07,$0c
         .byte $03,$18
         .byte $87,$02,$ae
         .byte $a3,$01,$0c
         .byte $03,$0b

         .byte $03,$09
         .byte $23,$09
         .byte $23,$15
         .byte $03,$09
         .byte $87,$02,$ae
         .byte $87,$01,$05

         .byte $03,$07
         .byte $07,$07
         .byte $03,$13
         .byte $87,$02,$ae
         .byte $87,$01,$07

         .byte $03,$07
         .byte $07,$07
         .byte $03,$13
         .byte $87,$02,$ae
         .byte $a3,$01,$05
         .byte $03,$07

         .byte $03,$08
         .byte $07,$08
         .byte $03,$14
         .byte $87,$02,$ae
         .byte $a3,$01,$08
         .byte $03,$09

         .byte $03,$0a
         .byte $23,$0a
         .byte $03,$16
         .byte $03,$0a
         .byte $87,$02,$ae
         .byte $a3,$01,$0a
         .byte $03,$0e

         .byte $03,$0f
         .byte $07,$0f
         .byte $03,$1b
         .byte $87,$02,$ae
         .byte $87,$01,$0f

         .byte $03,$0f
         .byte $23,$0f
         .byte $03,$1b
         .byte $03,$0f
         .byte $87,$02,$ae
         .byte $a3,$01,$0f
         .byte $03,$07

         .byte $ff
b05:
         .byte $83,$01,$08
         .byte $07,$08
         .byte $03,$14
         .byte $87,$02,$ae
         .byte $a3,$01,$08
         .byte $03,$05

         .byte $03,$07
         .byte $23,$07
         .byte $23,$13
         .byte $03,$07
         .byte $87,$02,$ae
         .byte $a3,$01,$0a
         .byte $03,$0b

         .byte $03,$0c
         .byte $07,$0c
         .byte $03,$18
         .byte $87,$02,$ae
         .byte $87,$01,$0c

         .byte $03,$0c
         .byte $07,$0c
         .byte $03,$18
         .byte $87,$02,$ae
         .byte $a3,$01,$0c
         .byte $03,$0a

         .byte $03,$08
         .byte $07,$08
         .byte $03,$14
         .byte $87,$02,$ae
         .byte $a3,$01,$08
         .byte $03,$05

         .byte $03,$07
         .byte $23,$07
         .byte $03,$13
         .byte $03,$07
         .byte $87,$02,$ae
         .byte $a3,$01,$07
         .byte $03,$07

         .byte $03,$0c
         .byte $07,$0c
         .byte $03,$18
         .byte $87,$02,$ae
         .byte $87,$01,$0c

         .byte $03,$0c
         .byte $23,$0c
         .byte $03,$18
         .byte $03,$0c
         .byte $87,$02,$ae
         .byte $83,$01,$0a
         .byte $03,$0b

         .byte $ff
b06: // solo
         .byte $87,$00,$00
         .byte $87,$08,$34
         .byte $07,$35
         .byte $20,$36
         .byte $22,$37
         .byte $07,$32
         .byte $20,$33
         .byte $0a,$34
         .byte $07,$30

         .byte $23,$3b
         .byte $03,$3c
         .byte $07,$37

         .byte $a3,$09,$3b
         .byte $03,$3c
         .byte $07,$37

         .byte $23,$3b
         .byte $03,$3c
         .byte $07,$37
         .byte $93,$00,$00

         .byte $a0,$08,$2b
         .byte $20,$2e
         .byte $20,$30
         .byte $20,$32

         .byte $0f,$33
         .byte $07,$33
         .byte $23,$33
         .byte $a3,$80,$60,$33
         .byte $03,$35

         .byte $20,$35
         .byte $20,$36
         .byte $05,$37
         .byte $07,$37
         .byte $23,$33
         .byte $03,$35
         .byte $0b,$37


         .byte $20,$37
         .byte $20,$39
         .byte $05,$3a
         .byte $07,$3a
         .byte $23,$37
         .byte $07,$38
         .byte $07,$37
         .byte $07,$35
         .byte $0b,$33
         .byte $ff
b07:
         .byte $8f,$08,$32
         .byte $07,$33
         .byte $23,$35
         .byte $17,$2f
         .byte $23,$30
         .byte $07,$32
         .byte $a3,$80,$d0,$35
         .byte $07,$38
         .byte $13,$37
         .byte $07,$35
         .byte $23,$37
         .byte $0b,$33
         .byte $07,$32

         .byte $0f,$30
         .byte $07,$32
         .byte $23,$33
         .byte $13,$2f
         .byte $0f,$2b
         .byte $21,$32
         .byte $21,$33
         .byte $21,$32
         .byte $21,$33
         .byte $21,$32
         .byte $21,$33
         .byte $21,$32
         .byte $21,$33
         .byte $21,$32
         .byte $21,$33
         .byte $21,$32
         .byte $21,$33
         .byte $21,$32
         .byte $21,$33
         .byte $21,$32
         .byte $21,$33
         .byte $1f,$30
         .byte $ff
//---------------------------------------
b08:
         .byte $83,$03,$ae
         .byte $9b,$c4,$04,$30
         .byte $83,$c4,$00,$2e
         .byte $9f,$c4,$04,$30
         .byte $ab,$c4,$0c,$30
         .byte $8f,$c4,$04,$30
         .byte $83,$c4,$00,$2e
         .byte $8f,$c4,$04,$30
         .byte $8b,$c4,$04,$30
         .byte $ff
b09:
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


