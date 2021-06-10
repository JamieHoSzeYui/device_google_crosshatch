#!/bin/bash

# variables
if [[ ! -f build/envsetup.sh ]]; then 
    echo "Are you running this at ROM's root?"
    exit 
fi 

# rm -rf vendor/google/ #actually no cuz some ROMs intergrate it with other random stuff
rm -rf hardware/qcom/sdm845/bt 
rm -rf hardware/qcom/sdm845/data/ipacfg-mgr
rm -rf hardware/qcom/sdm845/gps 
rm -rf hardware/qcom/sdm845/media
rm -rf hardware/qcom/sdm845/display

# Cloning
git clone https://github.com/hentaiOS-devices/device_google_crosshatch-sepolicy device/google/crosshatch-sepolicy 
git clone https://android.googlesource.com/platform/hardware/qcom/sdm845/bt --depth=1 --single-branch hardware/qcom/sdm845/bt
git clone https://github.com/PixelDust-Eleven/android_hardware_qcom_sdm845_data_ipacfg-mgr --depth=1 --single-branch hardware/qcom/sdm845/data/ipacfg-mgr
git clone https://android.googlesource.com/platform/hardware/qcom/sdm845/gps --depth=1 --single-branch hardware/qcom/sdm845/gps
git clone https://github.com/PixelDust-Eleven/android_hardware_qcom_sdm845_display --depth=1 --single-branch hardware/qcom/sdm845/display
git clone https://github.com/PixelDust-Eleven/android_hardware_qcom_sdm845_media --depth=1 --single-branch hardware/qcom/sdm845/media
git clone https://github.com/hentaiOS-devices/vendor_google --depth=1 --single-branch vendor/pixel 
mkdir -p vendor/google/
mv vendor/pixel/* vendor/google/
git clone https://github.com/grapheneos/platform_hardware_google_pixel hardware/google/pixel/
git clone --depth=1 --single-branch https://github.com/hentaiOS-devices/device_google_crosshatch-kernel device/google/crosshatch-kernel 
 
echo ""
echo ""
echo "Clone done."