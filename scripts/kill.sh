#!/usr/bin/env sh

echo 'killing process'
set -x
kill $(cat .pidfile)
