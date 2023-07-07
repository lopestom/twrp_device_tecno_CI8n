#!/bin/bash
cd ./bootable/recovery
patch -p1 < ../../device/tecno/CI8n/patches/0001-revert-save-settings-file-in-persist.patch
cd ../..
