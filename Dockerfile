FROM ubuntu:18.04

LABEL maintainer=matthieu@csu.fullerton.edu

RUN apt-get install -y clang
RUN apt-get install -y git
RUN apt-get install -y make
RUN apt-get install -y cmake

RUN cd /tmp/ \
  && git clone https://github.com/google/googletest.git \
  && cd googletest \
  && cmake CMakeLists.txt \
  && make \
  && cp -r googletest/include/. /usr/include \
  && cp -r googlemock/include/. /usr/include \
  && cp lib/*.a /usr/lib
