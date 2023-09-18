sudo apt-get install curl zip unzip tar
git clone -b feature/v2 https://github.com/Azure/azure-sdk-for-c
cd azure-sdk-for-c
git apply ../azure-sdk-for-c.gitpatch
git apply ../azure-sdk-for-c-samples.gitpatch
cd ..
git clone https://github.com/microsoft/vcpkg
cd vcpkg
./bootstrap-vcpkg.sh
export VCPKG_ROOT=$(pwd)
export VCPKG_DEFAULT_TRIPLET=x64-linux
cp ../azure-sdk-for-c/vcpkg.json .
./vcpkg install
cd ..
cp azure-sdk-for-c/vcpkg.json .
export AZURE_SDK_DISABLE_AUTO_VCPKG=1
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DAZ_MQTT_TRANSPORT_IMPL=MOSQUITTO -DAZ_PLATFORM_IMPL=POSIX -DTRANSPORT_MOSQUITTO=ON -DCMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake ..
cmake --build .
