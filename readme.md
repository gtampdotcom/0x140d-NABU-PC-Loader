# Description

0x140d PAK loader for Henry's rev B NABU PC.

Created by GTAMP but 99% of the code is from brijohns's Coleco Loader.

loader.nabu entry point is 0x240d, so it's only compatible with NABU rev B rom

loader.com entry point is 0x100, so it's only compatible with NABU CP/M

loader.com could also be useful for NABU ROMWBW

Not everything works, some are my bugs but also could be differences between NABU rom state and this loader state

Video of it working in MAME:
https://www.youtube.com/watch?v=ybb1Ef9VEq4

# Usage
The loader uses the HCCA to request 000001.nabu 

# Build
In order to build this you will need the following compiler and linker:

  * [vasm](http://sun.hasenbraten.de/vasm/)
  * [vlink](http://sun.hasenbraten.de/vlink/)

To build the loader and associated paks just type ```make```

This will create ```000001.nabu```

# Links
https://gtamp.com/nabu
https://gtamp.com/nabu/labomb/
https://github.com/gtampdotcom
https://github.com/brijohn/nabupc/tree/master/games/nabu_coleco
