if [ $# != 4 ];then
echo "usuage: calibrate.sh /path/to/data/directory /openMVG/path/ numberOfCameras imagesPerCamera"
exit 1;
fi 

DIR_OUT="out_Incremental_Reconstruction"
DIR_MATCHES="matches_Incremental"

mkdir $1/$DIR_OUT/
mkdir $1/$DIR_MATCHES/
rm $1/$DIR_MATCHES/*
rm $1/$DIR_OUT/*

openMVG_main_SfMInit_ImageListing_Calib -d $2/openMVG/src/openMVG/exif/sensor_width_database/sensor_width_camera_database.txt -f 1400 -g 0 -i $1 -o $1/$DIR_MATCHES/ # added $2 in directory
sleep 2s
openMVG_main_ComputeFeatures -i $1/$DIR_MATCHES/sfm_data.json -p NORMAL -m AKAZE_FLOAT -o $1/$DIR_MATCHES/
sleep 2s
openMVG_main_ComputeMatches -i $1/$DIR_MATCHES/sfm_data.json -n ANNL2 -o $1/$DIR_MATCHES/
sleep 2s
openMVG_main_Calibration -i $1/$DIR_MATCHES/sfm_data.json -m $1/$DIR_MATCHES/ -f  NONE -o $1/$DIR_OUT -n $3 -p $4
openMVG_main_ConvertSfM_DataFormat -i $1/$DIR_MATCHES/sfm_data.bin -VIE -o $1/$DIR_OUT/sfm_data.json
sleep 2s
echo $1/$DIR_OUT/cloud_and_poses_color.ply 
openMVG_main_ComputeSfM_DataColor -i $1/$DIR_OUT/sfm_data.bin -o cloud_and_poses_color.ply 
