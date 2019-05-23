#!/bin/bash
echo "---------------------------------------------------------"
echo " NetHunter bootanimation image converter 0.1 by yesimxev"
echo "........................................................."
echo ""
echo "Please enter the target resolution eg. 1440x2560" && read res
echo "Please enter the target fps eg. 30" && read fps
echo "Do you need the images to be converted (y/n)? Try n first!" && read req
mkdir -p new/part0
mkdir -p new/part1
mkdir -p new/part2
if [ "$req" == "y" ]; then
command -v convert >/dev/null 2>&1 || { echo >&2 "Converting requires imagemagick, please install it!"; exit 1; }
echo ""
echo "Converting images.."
echo ""
for i in {0000..0046}; do
convert -resize $res src/part0/$i.jpg new/part0/$i.jpg;
done
echo "  30% | part0 done"
for i in {0047..0111}; do
convert -resize $res src/part1/$i.jpg new/part1/$i.jpg;
done
echo "  70% | part1 done"
for i in {0112..0146}; do
convert -resize $res src/part2/$i.jpg new/part2/$i.jpg;
done
echo "  95% | part2 done";
else
echo ""
echo "Copying parts.."
cp -r src/part* new/
echo ""
echo "  95% | parts copied"
fi
cp src/desc.txt new/
cd new
sed -i "1s/.*/$res $fps/" desc.txt
sed -i 's/x/ /g' desc.txt
echo "  98% | desc done"
zip -0 -r -q bootanimation.zip part0 part1 part2 desc.txt
mv bootanimation.zip ../output/
echo " 100% | bootanimation.zip succesfully created"
cd ..
rm -r new
echo ""
echo "Please install with ./install.sh, otherwise you can use ./buildtwrp.sh to make a TWRP flashable zip!"
echo ""
echo "And remember, respect is everything!"
