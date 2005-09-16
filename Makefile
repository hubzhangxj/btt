CC	= gcc
CFLAGS	= -Wall -O2 -g -D_GNU_SOURCE
PROGS	= blkparse blktrace
LIBS	= -lpthread
SCRIPTS	= btrace

all: $(PROGS) $(SCRIPTS)

blkparse: blkparse.o rbtree.o
	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)

blktrace: blktrace.o $(LIBS)
	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)

clean:
	-rm -f *.o $(PROGS)

INSTALL = install
prefix = /usr/local
bindir = $(prefix)/bin

install: $(PROGS) $(SCRIPTS)
	$(INSTALL) -m755 -d $(DESTDIR)$(bindir)
	$(INSTALL) $(PROGS) $(SCRIPTS) $(DESTDIR)$(bindir)

