#!/bin/bash

git submodule update --init tools/sandblaster
git submodule update --init tools/xpwn

cd tools/vfdecrypt && make && cd ..
cd dyld && make && cd ..
cd xpwn && mkdir builddir && cd builddir && cmake .. && make && cd ../..
pwd
cd lzssdec && make && cd ..
cd sandblaster

git submodule update --init tools/sandbox_toolkit
cd tools/sandbox_toolkit/extract_sbops && make && cd ..
cd extract_sbprofiles && make && cd ../../..
