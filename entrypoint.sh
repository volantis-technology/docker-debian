#!/bin/bash
set -e

case $1 in
noroot)
    shift
    echo "==> executing as non-root user: $@"
    exec gosu ${DEFAULT_USER} $@
  ;;
*)
    echo "==> executing as root user: $@"
    cmdline="$@"
    exec ${cmdline:-"bash"}
  ;;
esac

# vim:set ft=sh ff=unix:
