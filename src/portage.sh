#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
# shellcheck disable=SC2154
set -eu

run_emerge() {
  pkgs=$1

  debug emerge "pkgs is '${pkgs}'"
  spawn_chroot "emerge ${emerge_opts} ${pkgs}"
}
