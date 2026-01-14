TYPE      ?= nabu
ASM        = vasmz80_std
LINK       = vlink
ASM_FLAGS  = -Fvobj -Lall
LINK_FLAGS = -brawbin1 -Bforcearchive
OBJS       = loader.o vdp.o interrupts.o hcca.o

.PHONY: all
all: 000001.nabu

%.o: %.z80
	@echo "Assembling $<..."
	@$(ASM) $(ASM_FLAGS) -L $(patsubst %.z80,%.lst,$<) -o $@ $< >/dev/null

000001.nabu: $(OBJS)
	@echo "Linking loader..."
	@$(LINK) $(LINK_FLAGS) -Tvlink_nabu.cmd -o $@ $^

.PHONY: mame
mame: 000001.nabu
	@echo "Creating loader.npz"
	zip loader.npz 000001.nabu 000002.nabu

.PHONY: clean
clean:
	@rm -f *.o *.npz *.nabu *.sym *.lst
