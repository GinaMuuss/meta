FROM ubuntu:18.04
COPY . /meta
RUN apt update
RUN apt install -y gcc-8 g++-8 cmake libicu-dev git libjemalloc-dev zlib1g-dev libboost-all-dev
ENV CC=gcc-8
ENV CXX=g++-8
RUN mkdir /meta/build
WORKDIR /meta/build
RUN cp /meta/config.toml /meta/build/.
RUN cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=On -DBUILD_STATIC_ICU=On
RUN make install -j 2
