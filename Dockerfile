FROM ubuntu:18.04

LABEL maintainer=matthieu@csu.fullerton.edu

RUN apt-get update \
  && apt-get install -y clang git make cmake

RUN cd /tmp/ \
  && git clone https://github.com/google/googletest.git \
  && cd googletest \
  && cmake CMakeLists.txt \
  && make \
  && cp -r googletest/include/. /usr/include \
  && cp -r googlemock/include/. /usr/include \
  && cp lib/*.a /usr/lib
