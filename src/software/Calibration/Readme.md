# Mutli-Camera Extrinsic Calibration

The naming convention for images is `camX_Y`, where `X` is the camera number and `Y` is the image number.

## Run the program

```{p}
./Calibrate.sh $imageDir $openMVGDir $nCameras $imagePcam
```

Eg:
```{p}
./Calibrate.sh "/images" "/home" 3 30
```
if the images to use in the calibration are in the `/images` directory, OpenMVG is built in the `/home` directory, there are 3 cameras to be calibrated, and there are 30 images per camera.

The intrinsic camera parameters must be set before the program is run. This is done in `main_SfMInit_ImageListing_Calib.cpp` beginning on line `398`. An example for the first view is shown below. The parameters are:

 `(focal_length_x, focal_length_y, principle_point_x, principle_point_y, dist_coeff_1, dist_coeff_2, dist_coeff_3)`

```
if(sImFilenamePart.compare(3, 1, "0") == 0)//view0
		intrinsic = std::make_shared<Pinhole_Intrinsic_Radial_K3>
            (width, height, 1274, 1003.59044239481, 789.283678299818, -0.100794127054946, 0.241575034744302, -0.233738081199789); 
```

## Program Output

The program returns a file called `extrinsicCalibration.txt` with a structure such as (for 3 cameras):

```
R:
0.999908 0.0107193 -0.00826929
-0.0105921 0.999827 0.0152787
0.00843164 -0.0151897 0.999849
T:
-0.00642045 0.0160975 0.0237506
R:
0.842441 -0.339093 0.418699
0.402286 0.912823 -0.0701456
-0.358412 0.22753 0.905412
T:
0.412838 -0.131908 0.217029
R:
0.125293 -0.529254 0.839162
0.829027 0.520481 0.204483
-0.544991 0.670068 0.503978
T:
0.825875 -0.45181 0.376879
```
