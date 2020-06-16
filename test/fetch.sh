#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
set -eu

TEST_FILENAME="stage3-i686-2006.1.tar.bz2"
TEST_PATH="gentoo/${TEST_FILENAME}"
TEST_URI="https://192.168.0.12/${TEST_PATH}"
TMP="/tmp/$(mcookie)"

debug=1

oneTimeSetUp() {
  mkdir -p "${TMP}"

  . ./src/fetch.sh
  . ./src/output.sh
  . ./src/spawn.sh
  . ./src/stepcontrol.sh
}

test_get_filename_from_uri() {
  result=$(get_filename_from_uri "${TEST_URI}")

  assertEquals "${TEST_FILENAME}" "${result}"
}

test_get_path_from_uri() {
  result=$(get_path_from_uri "${TEST_URI}")

  assertEquals "${TEST_PATH}" "${result}"
}

test_get_protocol_from_uri() {
  result=$(get_protocol_from_uri "${TEST_URI}")

  assertEquals "https" "${result}"
}

test_fetch() {
  result=$(fetch "${TEST_URI}" "${TMP}/file")

  fail "FIXME"
}

test_fetch_quickstart() {
  result=$(fetch_quickstart )

  fail "FIXME"
}

test_fetch_http() {
  result=$(fetch_http )

  fail "FIXME"
}

test_fetch_https() {
  result=$(fetch_https )

  fail "FIXME"
}

test_fetch_ftp() {
  result=$(fetch_ftp )

  fail "FIXME"
}

test_fetch_wget() {
  result=$(fetch_wget )

  fail "FIXME"
}

test_fetch_file() {
  result=$(fetch_file )

  fail "FIXME"
}

test_fetch_tftp() {
  result=$(fetch_tftp )

  fail "FIXME"
}

oneTimeTearDown() {
  rm -rf "${TMP}"  
}

