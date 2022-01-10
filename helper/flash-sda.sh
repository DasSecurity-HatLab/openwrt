#!/bin/bash
DRV="/dev/sda"
umount "${DRV}1"
gzip -dkc bin/targets/ramips/mt7621/*-ramips-mt7621-hatlab_gateboard-m1-ext4-combined.img.gz | dd of="${DRV}" bs=4k
sync
gparted
