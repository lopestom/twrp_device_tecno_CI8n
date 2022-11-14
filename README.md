# TWRP device tree for Tecno Camon 19 Pro (CI8n) - A12

## Status

Specs [here](https://www.gsmarena.com/tecno_camon_19_pro-11618.php)

The tester [abaza92](https://4pda.to/forum/index.php?showuser=4591571)

only install `boot-nnnnnnnnn.img` test file to know if TWRP can start.

This branch android-11 has ***encrypt/decrypt*** files and option to more test with that.

![Tecno Camon 19 Pro](https://fdn2.gsmarena.com/vv/pics/tecno/tecno-camon-19-pro-2.jpg)

## Building

```bash
source build/envsetup.sh
lunch twrp_CI8n-eng
mka bootimage
```

