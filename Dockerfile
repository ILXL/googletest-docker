FROM ubuntu:18.04

LABEL maintainer=matthieu@csu.fullerton.edu

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && python3 -m pip install --upgrade pip \
  && python3 -m pip install requests untangle pygithub diskcache \
  && apt-get install -y clang git clang-tidy clang-format make cmake nano
  
RUN cd /tmp/ \
  && git clone https://github.com/google/googletest.git \ 
  && cd googletest \
  && cmake CMakeLists.txt \
  && make \
  && cp -r googletest/include/. /usr/include \
  && cp -r googlemock/include/. /usr/include \
  && cp lib/*.a /usr/lib
