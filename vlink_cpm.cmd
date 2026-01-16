ENTRY(entry);

SECTIONS {
	.crt0 0x100 : {
		*(.crt0 .crt0.*)
	}
	PROVIDE(reloc_start = .);
	.text 0xF000 : AT(.)  {*(.text .text.*)}
	.data : {*(.data .data.*)}
	PROVIDE(reloc_end = LOADADDR(.data) + SIZEOF(.data));
	PROVIDE(reloc_length = SIZEOF(.text) + SIZEOF(.data));
}