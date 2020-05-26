# Quickstart

_An installer for Gentoo Linux written in POSIX shell._

[![GNU General Public License v2.0 only](https://img.shields.io/badge/license-GPL--2.0--only-blue?style=flat-square)][GPL-2.0-only]
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/oxr463/quickstart/ShellCheck?style=flat-square)](https://github.com/oxr463/quickstart/actions)

## Motivation

The original [Quickstart][quickstart] was initially written to address the apparent short comings
of the [Gentoo Linux Installer (GLI)][gli]; however, it has been without a maintainer since
at least [2012](CHANGELOG.md#1270---2012-07-07).

Since then, multiple efforts have attempted to replace these
applications; most notably, the official [Installer project][stager],

> After many years of an installer being absent from Gentoo,
it is time to start work on creating a perfect Gentoo installer. --[Project:Installer][stager]

I would argue that Gentoo does not need a [*perfect*](https://wikipedia.org/wiki/Worse_is_better)
installer, just one that works well enough to get the system up and running.
Therefore, instead of writing a new installer from scratch,
I have instead decided to give Quickstart another chance.

## Installation

```sh
make install
```

## Usage

```sh
quickstart -h
Usage:
  quickstart [-h|--help] [-d|--debug] [-v|--verbose] [-q|--quiet]
             [-s|--sanity-check] [--version] <profile>

Options:
  -h|--help            Show this message and quit
  -d|--debug           Output debugging messages
  -q|--quiet           Only output fatal error messages
  -v|--verbose         Be verbose (show external command output)
  -s|--sanity-check    Sanity check install profile and exit
  -c|--client <host>   Act as a client and connect to a quickstartd
  --version            Print version and exit

Arguments:
  profile              Path to an install profile
```

## Acknowledgement

Based on the original [Quickstart][quickstart] by Andrew Gaffney.

The [original file](https://commons.wikimedia.org/wiki/File:Font_Q.svg)
used for the logo is attributed to
[Iwan Novirion](https://en.wikipedia.org/wiki/id:User:Iwan_Novirion).

## License

### Logo

SPDX-License-Identifier: [CC-BY-SA-3.0](https://spdx.org/licenses/CC-BY-SA-3.0.html)

### Source Code

SPDX-License-Identifier: [GPL-2.0-only][GPL-2.0-only]

See [COPYING](COPYING) file for copyright and license details.

[GPL-2.0-only]: https://spdx.org/licenses/GPL-2.0-only.html

## Reference

- [Gentoo Linux Installer (GLI)][gli]

- [Project:Installer][stager]

[gli]: https://wiki.gentoo.org/wiki/Project:Installer/Old
[quickstart]: https://github.com/agaffney/quickstart
[stager]: https://wiki.gentoo.org/wiki/Project:Installer

## See Also

- [OpenBSD autoinstall(8)](https://man.openbsd.org/autoinstall)

- [Canonical curtin](https://github.com/canonical/curtin)
