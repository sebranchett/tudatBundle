FROM ubuntu:18.04

RUN apt-get update &&                  \
    apt-get upgrade -y &&              \
    apt-get install -y                 \
            build-essential cmake      \
            git                        \
            vim                        \
            x11-apps                   \
            qtcreator                &&\
    apt-get clean

RUN git clone https://github.com/Tudat/tudatBundle.git
WORKDIR tudatBundle
RUN git submodule update --init --recursive
RUN cmake CMakeLists.txt
RUN cmake --build . --target all
RUN ctest

CMD ["/bin/bash"]
