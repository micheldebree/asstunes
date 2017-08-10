# Tunes made in Turbo Assembler on a Commodore 64

This is a digital archeology project to save old tunes made by me and friends in assembler code on Commodore 64.
The source is a big box containing all my Commodore 64 floppy disks. This box was kindly converted digital image file (.d64) by the X team.

Music: Michel de Bree &amp; Marvin Severijns
Player code: Thomas E. Petersen &amp; Charles Deenen

## From ```.d64``` to Kick Assembler ```.asm```

Prerequisites:

- [VICE emulator](http://vice-emu.sourceforge.net)
- [TMPView](http://style64.org/release/tmpview-v1.3.1-style)
- [Tasm to Kick Assembler Converter (online)](http://tasmtokickass.insoft.se)

Extract the ```.d64``` file:

    c1541 -attach "$1" 8 -extract

Convert the assembler source file to Tasm code:

    tmpview in > out.asm
