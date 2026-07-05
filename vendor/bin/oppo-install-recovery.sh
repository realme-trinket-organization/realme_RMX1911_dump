#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e161a3134bcec18027834c53586be299cc0632c7; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:67dcd41ca0725d2ebae573993c2ef88323bd4770 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e161a3134bcec18027834c53586be299cc0632c7 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
