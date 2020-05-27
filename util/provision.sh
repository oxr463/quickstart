#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
set -eu

# Set keywords
cat << EOF > /etc/portage/package.accept_keywords
app-admin/haskell-updater ~amd64
app-text/pandoc ~amd64
dev-haskell/* ~amd64
dev-lang/ghc ~amd64
dev-util/shellcheck ~amd64
EOF

# Fix slot conflicts
#emerge --oneshot =dev-python/setuptools-44.1.0
#emerge --oneshot =dev-python/certifi-2020.4.5.1

# Create dependency set
mkdir -p /etc/portage/sets

cat << EOF > /etc/portage/sets/quickstart-dependencies
# development dependencies for quickstart
app-text/pandoc
dev-util/shellcheck
EOF

# Install dependencies
emerge -ng --backtrack=30 @quickstart-dependencies

# Set vi as default editor
ln -s /bin/busybox /usr/local/bin/vi
eselect editor set /usr/local/bin/vi

