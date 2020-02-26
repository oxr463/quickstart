#!/bin/sh
# architecture-specific partition module for hppa
set -eu

import partition_x86

sanity_check_config_partition() {
  warn "Sanity checking partition config for hppa"
}
