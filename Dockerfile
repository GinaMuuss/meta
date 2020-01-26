FROM ubuntu:18.04
COPY . /meta
RUN apt install gcc cmake libicu-dev git libjemalloc-dev zlib1g-dev 
ENV CC=gcc
ENV CXX=g++
RUN mkdir /meta/build
WORKDIR /meta/build
RUN cp /meta/config.toml /meta/build/.
RUN cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=On -DBUILD_STATIC_ICU=On
RUN make install -j 2