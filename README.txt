==================================
np_nifalcon Max/MSP External
==================================

by Kyle Machulis <kyle@nonpolynomial.com>
Nonpolynomial Labs - http://www.nonpolynomial.com

Contributors:

Edgar Berdahl
http://ccrma.stanford.edu/~eberdahl/

===========
Description
===========

np_nifalcon is an external for either Max/MSP or Puredata to control the Novint Falcon. It is based on libnifalcon:

http://sourceforge.net/projects/libnifalcon

Portability of source between Max and Pd is available thanks to flext

Max: http://www.cycling74.com
Pd: http://www.puredata.info
Flext: http://www.parasitaere-kapazitaeten.net/ext/flext/

=========
Licensing
=========

libnifalcon is covered under the BSD License.

flext and np_nifalcon source code are covered under the GPL v2 License.

===========================
Novint Falcon Information
===========================

More information about the Novint Falcon can be found at 

http://libnifalcon.sf.net

============
Installation
============

- Put the .mxo(Mac)/.mxe(Windows) or .pd_[platform] file in a directory that Max/Pd will search for externals (Max: Options -> File Preferences -> Other Folders, Pd: Options -> Paths)
- Max: Put the .help file in the max-help directory of your Max/MSP installation

=========================
Platform Specifics Issues
=========================

-------------
ALL PLATFORMS
-------------

- If you have problems with the external locking up or I/O stopping randomly, try using a powered USB hub between the falcon and your machine. This is a common issue with laptops (especially macbooks), which seem to have USB power issues with the falcon that cause this issue.

-----
Linux
-----

- np_nifalcon requires either root access (i.e. running pd under sudo) or correct udev based USB permissions to run as non-root. If you're using a udev based system, check out the udev sample files in the linux directory of the libnifalcon source distribution (v1.0 beta 1 and later)
