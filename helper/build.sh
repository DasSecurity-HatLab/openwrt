#!/bin/sh
cat ./HATLab-GateBoard-M1.feeds > ./feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
rm -f ./.config*
touch ./.config
cat ./HATLab-GateBoard-M1.config > ./.config
make defconfig
make download -j8
make -j8
