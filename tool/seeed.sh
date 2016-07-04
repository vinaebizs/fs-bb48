#! /bin/sh

cp -p fs-bb48-F.Cu.gbr FS-BB48.GTL
cp -p fs-bb48-F.Mask.gbr FS-BB48.GTS
cp -p fs-bb48-F.SilkS.gbr FS-BB48.GTO

cp -p fs-bb48-B.Cu.gbr FS-BB48.GBL
cp -p fs-bb48-B.Mask.gbr FS-BB48.GBS
cp -p fs-bb48-B.SilkS.gbr FS-BB48.GBO

cp -p fs-bb48-Edge.Cuts.gbr FS-BB48.GML
cp -p fs-bb48.drl FS-BB48.TXT

# -l: translate LF to CRLF
zip -l fs-bb48.zip FS-BB48.*
