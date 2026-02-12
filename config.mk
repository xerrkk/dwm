# dwm version
VERSION = 6.6

# Customize below to fit your system

# paths
# In Guix, you cannot write to /usr/local. 
# This installs dwm to your user's local folder.
PREFIX = ${HOME}/.local
MANPREFIX = ${PREFIX}/share/man

# Use pkg-config (pkgconf) to find X11 paths dynamically
X11INC = $(shell pkg-config --cflags x11)
X11LIB = $(shell pkg-config --libs x11)

# Xinerama
XINERAMALIBS  = $(shell pkg-config --libs xinerama)
XINERAMAFLAGS = -DXINERAMA

# Freetype / Xft / Fontconfig
# This solves the FcCharSetAddChar and missing header errors
FREETYPELIBS = $(shell pkg-config --libs xft fontconfig)
FREETYPEINC = $(shell pkg-config --cflags xft fontconfig)

# includes and libs
INCS = ${X11INC} ${FREETYPEINC}
LIBS = ${X11LIB} ${XINERAMALIBS} ${FREETYPELIBS}

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# compiler and linker
CC = gcc
