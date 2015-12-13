#!/bin/sh

set -eu

cd /ghc

git pull && git submodule update --init --recursive

./boot
./configure --prefix=/opt/ghc/head

echo
echo CPU INFO:
cat /proc/cpuinfo

echo
echo MEMORY INFO:
cat /proc/meminfo

echo
echo STARTING BUILD
time make "-j$(nproc)"
time make "-j$(nproc)" install