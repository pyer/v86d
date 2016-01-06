
.PHONY: clean clobber v86d

CC = klcc
CFLAGS  = -c -Wall -g -O2 -I. -I./x86emu -I/usr/include
LFLAGS  = -s
V86OBJS = v86_x86emu.o v86_mem.o v86_common.o v86.o
X86OBJS = x86emu/decode.o x86emu/fpu.o x86emu/ops.o x86emu/ops2.o x86emu/prim_ops.o x86emu/sys.o

v86d: $(V86OBJS) $(X86OBJS)
	$(CC) $(LFLAGS) $(V86OBJS) $(X86OBJS) -o $@

%.o: %.c v86.h x86emu/%.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf *.o *~ x86emu/*.o x86emu/*~ x86emu/x86emu/*~

clobber: clean
	rm v86d
