
CC= gcc
CFLAGS= -O2
LFLAGS=
EXTRA_LIBS=
AUX_CFLAGS= -m486

OBJS= echo.o echo2.o
  
.c.o:
	$(CC) -c $(CFLAGS) $(AUX_CFLAGS) $<

all: myecho

echo.o: echo.c

echo2.o: echo2.c

myecho: echo.o echo2.o
	$(CC) $(LFLAGS) $(AUX_LFLAGS) -o myecho echo.o echo2.o $(EXTRA_LIBS) $(AUX_LIBS)
	chown webuser myecho
