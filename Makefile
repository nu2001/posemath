# Makefile for compiling pose math library

# Note: posemath.cc and _posemath.c implement the C++ and C versions of
# the posemath.h definitions, respectively.
# sincos.h and sincos.c are C only.
# mathprnt.cc and _mathprnt.c implement the C++ and C versions of the
# mathprnt.h definitions, respectively.


COBJS = _posemath.o sincos.o _mathprnt.o
CPPOBJS = posemath.o mathprnt.o

TARGETS = libpm.a libpmcpp.a testpmc testpmcpp testcirc

all : $(TARGETS)

libpm.a : $(COBJS)
	ar cr $@ $^ && ranlib $@

libpmcpp.a : $(COBJS) $(CPPOBJS)
	ar cr $@ $^ && ranlib $@

testpmc : testpmc.o libpm.a
	cc $^ -lm -o $@

testpmcpp : testpmcpp.o libpmcpp.a
	c++ $^ -lm -o $@

testcirc : testcirc.o libpm.a
	cc $^ -lm -o $@

clean :
	rm -vf *.o $(TARGETS)
