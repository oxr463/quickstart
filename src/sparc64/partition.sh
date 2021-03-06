#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
set -eu

sanity_check_config_partition() {
  for device in $(set | grep '^partitions_' | cut -d= -f1 | sed -e 's:^partitions_::' -e 's:_:/:g'); do
    device_temp="partitions_${device}"
    for partition in $(eval "echo \${${device_temp}}"); do
      minor=$(echo "${partition}" | cut -d: -f1)
      if [ "${minor}" = "3" ]; then
        error "you cannot define partition number 3 with a sun disklabel (taken by whole disk)"
        return 1
      fi
    done
  done
}

create_disklabel() {
  device=$1

  debug create_disklabel "creating new sun disklabel"
  spawn "dd if=/dev/zero of=${device} bs=512 count=1" || die "couldn't clear first block"
  fdisk_command "${device}" "0\n\n\n\n\n\n\n\n\nd\n1\nd\n2\n"
  return $?
}

get_partition_end() {
  device=$1
  minor=$2

  fdisk -l "${device}" | grep "^${device}${minor}" | awk '{ if ( $2 ~ /^[0-9]+$/ ) print $3; else print $4; }'
}

add_partition() {
  device=$1
  minor=$2
  size=$3
  type=$4

  start
  if [ "${minor}" = "1" ]; then
    start=0
  elif [ "${minor}" = "4" ]; then
    start=$(get_partition_end "${device}" 2)
  else
    start=$(get_partition_end "${device}" $((minor-1)))
  fi
  size="+${size}"
  [ "${size}" = "+" ] && size=""
  fdisk_command "${device}" "n\n${minor}\n${start}\n${size}\nt\n${minor}\n${type}"
  return $?
}
