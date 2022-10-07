# Install minimal prerequisites (Ubuntu 18.04 as reference)
sudo apt update && sudo apt install -y cmake g++ wget unzip
# Download and unpack sources
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip
unzip opencv.zip
# Create build directory
mkdir -p build && cd build
# Configure as static library as wasm environment does not support shared libraries yet
cmake  -DBUILD_SHARED_LIBS=OFF ../opencv-4.x
# Build
cmake --build .
#use wasicc to build .wasm file
wasicc libopencv_calib3d.a libopencv_flann.a libopencv_imgproc.a libopencv_stitching.a libopencv_core.a libopencv_gapi.a libopencv_ml.a libopencv_ts.a libopencv_dnn.a  libopencv_highgui.a libopencv_objdetect.a libopencv_video.a libopencv_features2d.a libopencv_imgcodecs.a libopencv_photo.a libopencv_videoio.a -o opencv.wasm -Wl,--no-entry

