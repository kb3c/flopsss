## flopsss makefile
## 2010-2016, polarysekt

#FLOPSSSARCH= armhf
FLOPSSSARCH= x86_64
FLOPSSSPLAT= x
PLATFORMEXT= .out
#PLATFORMEXT= .exe

GHVER= 1-1-1-5
GHPCVER= 0-1

PLATFORMLIBS= lib/libgh-$(FLOPSSSARCH)-$(FLOPSSSPLAT)-$(GHVER).a lib/libghpc-$(FLOPSSSARCH)-x.a -lX11
#PLATFORMDLIBS=
#PLATFORMVLIBS=
FLAGREL= -DNDEBUG -O2
FLAGDBG= -Wall -g

# .PHONY(s)

.PHONY: all


all: flops$(PLATFORMEXT)


all_debug: flops.d$(PLATFORMEXT)


all_debug_deep: flops.dd$(PLATFORMEXT)


all_debug_deep_verbose: flops.ddv$(PLATFORMEXT)


getdep:
	@make -C dep/


flops$(PLATFORMEXT):
	@echo -n "    "
	g++ $(FLAGREL) -o flops$(PLATFORMEXT) flops.cpp $(PLATFORMLIBS)
	
flops.d$(PLATFORMEXT):
	@echo -n "    "
	g++ $(FLAGDBG) -o flops.d$(PLATFORMEXT) flops.cpp $(PLATFORMLIBS)

#TODO
flops.dd$(PLATFORMEXT):
	@echo -n "    "
	g++ $(FLAGDBG) -o flops.dd$(PLATFORMEXT) flops.cpp $(PLATFORMLIBS)

#TODO
flops.ddv$(PLATFORMEXT):
	@echo -n "    "
	g++ $(FLAGDBG) -o flops.ddv$(PLATFORMEXT) flops.cpp $(PLATFORMLIBS)
	
cleandep:
	@make -C dep/ clean
	
