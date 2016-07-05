Revision 5
==========

For PCBA, I selected blue LED (Vf=2.9V).

Moved CE mark.


FS-GETA083
==========

I decided to introduce a plastic part.


Change for U2 (for the revision 1,2,3,4)
========================================

I decided to change U2 by NUP2114UPXV5T1G, for the availability.
Having two 33R is no problem.

I decided to use Murata's BLM18AG331SN1D  for ferrite bead.

For capacitors, two 2.2uF are used (instead of 2.2uF and 1.0uF).

For 0.1uF capacitors, only one is used.

For LED, I selected white LW Q38E-Q1OO-3K6L-1 (Vf=2.85V).

Extention pins are decided by four pins and it has Vdd and GND.


Initial design thought (2016-01)
================================

   * Freescale Kinetis L27Z Cortex-M0+ 48MHz 256KB Flash 32KB SRAM
     KL27Z256VFM4

   * Touch button on PCB

   * [Optional] Piezo buzzer

I had thought that Cortex-M3 @ 72MHz was best for me, but more
constant-time sounds better, and it is good challenge for me to try
48MHz Cortex-M0+.


You can compare Kinetis W40Z (with Bluetooth).  It has AES crypto and
TRNG, so that building encrypted communication easier.  I feel that
this is too much.

Kinetis L27Z doesn't have such crypto or TRNG.  It has CRC module and
ADC, so I believe that porting NeuG would be no problem.  I guess that
computation for Curve25519/Ed25519 will be two or three times slower,
but still it will be faster than current computation of RSA-2048 on
FST-01 with Cortex-M3.


Besides, STM32F103TB on FST-01 uses 180nm technology (I suppose).  I
believe that the physical attack is difficult enough for now, given
the condition it's in QFN package.  KL27Z uses 130nm technology or
90nm technology (I'm not sure), but I believe that breaking code
protection of KL27Z would be equally difficult or more difficult than
STM32F103TB.

KL27Z256VFM4 includes the voltage regulator for USB, so, we don't need
care about life cycle of (another) chip of voltage regulator.


RSA is out of scope for this board.  The branch of Gnuk will be called
Gnuk25519.
I am considering storing some (limited) public keys on the board.
Say, we could use 64KB for such a storage.


Perhaps, the board will be something like:

   SparkFun AVR Stick:
   https://www.sparkfun.com/products/retired/9147

The name would be FS-BB48 (Flying Stone Bare Bone 48).  BB has an
implication (my message to users) that users need to customize it
(against physical attacks).

Well, I added a photo of my FST-01 last week.

    My customization of 2016:
    http://www.fsij.org/gnuk/cfaftwork-fst-01.rst.html

48 stands for 48MHz.  And it seems for me that having "48" in the name
is a kind of fashion in Japan.  I wish more selling of boards by
Flying Stone.

Here is the design by ASCII.


	       /--- Hole
	       |
	   +-- V ------------+
	   |  --             |
	   | |  |            |
	   |  --             |
	   |     .......     |
	   |   ...........   |
	   |  .............  |
	   |  ............. <----- Touch pad (to confirm to sign)
	   |  .............  |
	   |  .............  |
	   |   ...........   |
	   |     .......   ( ) <--+--- pins for SWD
       |   |                 |    |      and optional I/O (piezo, etc.)
       +-> ( )    [LED]    ( ) <--+
       |   |     +------+    |    |
       +-> ( )   |      |  ( ) <--+  nRESET, SWD-DIO, SWD-CLK,
       |   |     |  U1  |    |    |  VDD, GND
       +-> ( )   |      |  ( ) <--+
       |   |     +------+    |    |
       +-> ( )    +--+    _( ) <--+
	   |      |U2|   [_] <------- Ferrite Bead
	   |      +--+       |
	   |                 |  <----- Back side with logo
	   | | | | | | | | | |            (and CE mark ??)
	   | | | | | | | | | |
	   | | | | | | | | | |
	   | | | |_| |_| | |<------ USB connection PCB pattern
	   | | |         | | |
	   | |_|         |_| |
	   +-----------------+

	   12.0 mm x 35.0? mm x 2.8?mm

    U1: Kinetis L27Z
    U2: EMIF02-USB03F2 (33R + ESD protection)
    Blue LED
    Ferrite Bead 0603
    Capacitors   0603 2.2uF, 1.0uF
    Capacitors   0402 0.1uF x 4?
    Resisters    0402 510, 1k, 1M

I think that Ferrite Bead would be required (for regulation for EMI)
if people use the board with USB extension cable.


It would be good to have the possible SPI extension, so that we can
extend the board to support micro SD.  I'm afraid this possibility
kills the goodness of minimum design.
--
