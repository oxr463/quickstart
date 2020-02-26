#!/bin/sh
# architecture-specific partition module for amd64
set -eu

import partition_x86

sanity_check_config_partition() {
  warn "Sanity checking partition config for amd64"
}
