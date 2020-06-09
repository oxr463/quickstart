#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
set -eu

# Copy portage configuration
cp -R /usr/src/quickstart/.local/etc/portage/* /etc/portage/

# Install dependencies
emerge -ng @quickstart-dependencies

# Set vi as default editor
ln -s /bin/busybox /usr/local/bin/vi
eselect editor set /usr/local/bin/vi

