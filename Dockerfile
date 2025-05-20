FROM amd64/ubuntu:24.04
ARG BUILD_TYPE=Release

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    git \
    wget \
    curl \
    zip \
    unzip \
    tar

WORKDIR /app
COPY . .

RUN /app/vcpkg/bootstrap-vcpkg.sh -useSystemBinaries
RUN /app/vcpkg/vcpkg integrate install


RUN mkdir build
WORKDIR /app/build

RUN cmake --preset ninja-vcpkg-release -DCMAKE_BUILD_TYPE=$BUILD_TYPE ..
RUN cmake --build . --config $BUILD_TYPE -j "$(nproc)"

RUN mkdir -p /output/libsimple-linux-amd64
RUN cp /app/build/src/libsimple.so /output/libsimple-linux-amd64/
RUN cp -r /app/build/test/dict /output/libsimple-linux-amd64/
