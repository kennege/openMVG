
###
# Intrinsic image analysis and SfM_Data container initialization
###
add_executable(openMVG_main_SfMInit_ImageListing_Calib main_SfMInit_ImageListing_Calib.cpp)
target_link_libraries(openMVG_main_SfMInit_ImageListing_Calib
  PRIVATE
    openMVG_system
    openMVG_image
    openMVG_features
    openMVG_sfm
    openMVG_exif
    ${STLPLUS_LIBRARY}
)

#convert a v0.6 lists.txt file to the new sfm_data.X format
add_executable(openMVG_main_Calibration main_Calibration.cpp)
target_link_libraries(openMVG_main_Calibration
  PRIVATE
    openMVG_system
    openMVG_features
    openMVG_sfm
    ${STLPLUS_LIBRARY}
)

# Installation rules
set_property(TARGET openMVG_main_SfMInit_ImageListing_Calib PROPERTY FOLDER OpenMVG/software)
install(TARGETS openMVG_main_SfMInit_ImageListing_Calib DESTINATION bin/)
set_property(TARGET openMVG_main_Calibration PROPERTY FOLDER OpenMVG/software)
install(TARGETS openMVG_main_Calibration DESTINATION bin/)


