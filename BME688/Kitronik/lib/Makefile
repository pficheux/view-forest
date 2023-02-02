CC=gcc

IAQDIR= libIAQ

SUBDIRS= $(IAQDIR)

CFLAGS= -O2 -I./$(IAQDIR)

PROG= libiaq_test

OBJS= libiaq_test.o 

all::
	for i in  $(SUBDIRS) ;\
	do \
	echo "making all" "in $$i..."; \
	$(MAKE) -C $$i $(MFLAGS) all; \
	done

all:: $(OBJS)
	$(CC) -o $(PROG) $(OBJS) -L./$(IAQDIR) -lIAQ -lm


clean::
	rm -f $(PROG) $(OBJS) *~ 

clean::
	for i in  $(SUBDIRS) ;\
	do \
	echo "cleaning" "in $$i..."; \
	$(MAKE) -C $$i $(MFLAGS) clean; \
	done
