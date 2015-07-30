# SDSC "cipres" roll

## Overview

This roll bundles CIPRES applications.

For more information about the bundled applications, please visit the official
web pages.

- <a href="http://www.microbesonline.org/fasttree/" target="_blank">FastTree</a>
infers approximately-maximum-likelihood phylogenetic trees from alignments of nucleotide or protein sequences.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate cipres source file(s) using a machine that does
have Internet access and copy them into the `src/cipres` directories on your
Rocks development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.


## Building

To build the cipres-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `cipres-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

This roll source supports building with different compilers.
The `ROLLCOMPILER` make variable can be used to
specify the names of compiler modulefiles to use for building the
software, e.g.,

```shell
make ROLLCOMPILER=intel 2>&1 | tee build.log
```

The build process recognizes "gnu", "intel" or "pgi" as the value for the
`ROLLCOMPILER` variable.  The default value is "gnu".


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll cipres
% cd /export/rocks/install
% rocks create distro
% rocks run roll cipres | bash
```

In addition to the software itself, the roll installs cipres environment
module files in:

```shell
/opt/modulefiles/applications/cipres
```


## Testing

The cipres-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/cipres.t
```
