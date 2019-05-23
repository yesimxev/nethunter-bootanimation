#!/bin/bash
echo "--------------------------------------------------------------"
echo " NetHunter bootanimation zip creator for TWRP 0.1 by yesimxev"
echo ".............................................................."
echo ""
echo "Copying created zip to TWRP files.."
cp output/bootanimation.zip twrp_files/system/media/
cd twrp_files
echo "Creating zip.."
zip -0 -r -q ../output/bootanimation_twrp.zip META-INF system
if [ -d "/sdcard" ]
then
	echo "Copying to /sdcard.." && cp ../output/bootanimation_twrp.zip /sdcard/ && echo "" && echo "Bootanimation TWRP zip has been created and copied to /sdcard!"
else
	echo "" && echo "Bootanimation TWRP zip has been copied to output folder!"
fi
