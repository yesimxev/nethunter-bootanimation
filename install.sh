#!/bin/bash
echo "---------------------------------------------------"
echo " NetHunter bootanimation installer 0.1 by yesimxev"
echo "..................................................."
echo ""
echo "Mounting system.."
mount -o rw,remount /system
echo "Copying files .."
cp output/bootanimation.zip /system/media/
echo "Setting permissions.."
chmod o+r /system/media/bootanimation.zip
echo ""
echo "Bootanimation is installed! Please restart your device to check it out"
