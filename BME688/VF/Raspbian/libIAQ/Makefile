CC=gcc

CFLAGS= -O2

LIBIAQ= libIAQ.a

OBJS= iaq_eco2.o

all: $(LIBIAQ)

$(LIBIAQ): $(OBJS)
	$(AR) rv $(LIBIAQ) $(OBJS)

clean:
	rm -f  $(OBJS) $(LIBIAQ) *~ 
