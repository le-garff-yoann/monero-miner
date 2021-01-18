#!/bin/bash

set -e

sysctl -w vm.nr_hugepages=$(nproc)

for i in $(find /sys/devices/system/node/node* -maxdepth 0 -type d);
do
  echo 3 > "$i/hugepages/hugepages-1048576kB/nr_hugepages";
done