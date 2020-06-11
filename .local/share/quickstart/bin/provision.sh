#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
set -eu

# Remove existing configuration
rm -rf /etc/portage/package.accept_keywords

# Copy portage configuration
cp -R /usr/src/quickstart/.local/etc/portage/* /etc/portage/

# Install dependencies
emerge -nq @quickstart-dependencies

# Set vi as default editor
ln -s /bin/busybox /usr/local/bin/vi
eselect editor set /usr/local/bin/vi

