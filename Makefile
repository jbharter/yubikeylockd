CC=clang

FRAMEWORKS:= -F /System/Library/PrivateFrameworks -framework IOKit -framework CoreFoundation -framework login

SOURCE=yubikeylockd.c

CFLAGS=-Wall -Werror -O2 $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o yubikeylockd

all: yubikeylockd

clean:
		rm -rf yubikeylockd

install: all
	  mv yubikeylockd /usr/local/bin/yubikeylockd
		cp com.github.jbharter.yubikeylockd.plist ~/Library/LaunchAgents
		launchctl load -w ~/Library/LaunchAgents/com.github.jbharter.yubikeylockd.plist

yubikeylockd:
		$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)
