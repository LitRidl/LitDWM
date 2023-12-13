# dwm version
VERSION = 6.4

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/X11/include
X11LIB = /usr/X11/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS}

# flags:
CPPFLAGS = -D_DEFAULT_SOURCE -D_FORTIFY_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Wno-stringop-truncation -march=native -mtune=native -O3 -pipe -flto ${INCS} ${CPPFLAGS} -fstack-clash-protection -fcf-protection
LDFLAGS  = -Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now -flto=auto ${LIBS}

# compiler and linker
CC = gcc
