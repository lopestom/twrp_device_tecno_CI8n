#!/bin/bash
cd ./bootable/recovery
patch -p1 < /home/runner/work/twrp_device_tecno_CI8n/twrp_device_tecno_CI8n/workspace/device/tecno/CI8n/patches/0001-revert-save-settings-file-in-persist.patch
cd ../..
