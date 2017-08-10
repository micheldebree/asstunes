ASMS = $(wildcard *.asm)
MP3S = $(patsubst %.asm,%.mp3,$(ASMS))

%.prg: %.asm KickAssembler/KickAss.jar
	java -jar ./KickAssembler/KickAss.jar "$<"

%.mp3: %.prg jsidplay2-3.8/jsidplay2_console-3.8.jar
	java -jar ./jsidplay2-3.8/jsidplay2_console-3.8.jar -g 1:00 -a MP3 -r "$*.mp3" "$<"

.PHONY: all
.PRECIOUS: %.prg

all: $(MP3S)

KickAssembler/KickAss.jar:
	wget http://www.theweb.dk/KickAssembler/KickAssembler.zip
	unzip KickAssembler.zip -d ./KickAssembler
	rm ./KickAssembler.zip


jsidplay2-3.8/jsidplay2_console-3.8.jar:
	wget https://downloads.sourceforge.net/project/jsidplay2/jsidplay2/3.8/jsidplay2-3.8.zip
	unzip jsidplay2-3.8.zip
	rm jsidplay2-3.8.zip

