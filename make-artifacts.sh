#!/bin/bash

make_big_file() {
    local f="$1"
    local dest="test-$f.bin"
    dd if=/dev/urandom of="$dest" bs=16k count=65536  # 1GiB
    sha256sum "$dest" > "${dest}.sha256"
}

for i in $(seq 1 10); do
    make_big_file "$i" &
done

wait
