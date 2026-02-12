
# compiler and linker
CC = cc
# dwm version
VERSION = 6.6

# Customize below to fit your system

# paths
# Guix doesn't allow writing to /usr/local. Install to your home folder instead.
PREFIX = ${HOME}/.local
MANPREFIX = ${PREFIX}/share/man

# Use pkg-config to find X11 paths
X11INC = $(shell pkg-config --cflags x11)
X11LIB = $(shell pkg-config --libs x11)

# Xinerama, comment if you don't want it
XINERAMALIBS  = $(shell pkg-config --libs xinerama)
XINERAMAFLAGS = -DXINERAMA

# freetype / Xft
# This fixes the ft2build.h and Xft.h errors by pulling correct store paths
FREETYPELIBS = $(shell pkg-config --libs xft)
FREETYPEINC = $(shell pkg-config --cflags xft)

# includes and libs
# Note: FREETYPEINC already includes the -I prefix
INCS = ${X11INC} ${FREETYPEINC}
LIBS = ${X11LIB} ${XINERAMALIBS} ${FREETYPELIBS}

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# compiler and linker

CC = gcc
