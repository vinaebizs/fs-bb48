#! /bin/sh

cp -p fs-bb48-F_Cu.gbr FS-BB48.GTL
cp -p fs-bb48-F_Mask.gbr FS-BB48.GTS
cp -p fs-bb48-F_SilkS.gbr FS-BB48.GTO

cp -p fs-bb48-B_Cu.gbr FS-BB48.GBL
cp -p fs-bb48-B_Mask.gbr FS-BB48.GBS
cp -p fs-bb48-B_SilkS.gbr FS-BB48.GBO

cp -p fs-bb48-Edge_Cuts.gbr FS-BB48.GML
cp -p fs-bb48.drl FS-BB48.TXT

# -l: translate LF to CRLF
zip -l fs-bb48.zip FS-BB48.*
