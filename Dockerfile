# Dockerfile for building Catch2 and Googletest images based on ubuntu
# Base Ubuntu image
FROM ubuntu:20.04

# RUN useradd -u 1234 user1
# USER user1

RUN ls
# Set the Environment variable for Time-zone 
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


#Specifying WORK DIRECTORY, copying and running Dependencies 
WORKDIR /
COPY Dependencies.sh .
COPY googleTest_testing .
COPY Catch2_testing .
RUN chmod a+x Dependencies.sh && ./Dependencies.sh 
RUN cd /usr/src/gtest \
    cmake CMakeLists.txt \
    make \
    ls
RUN ls
RUN cmake CMakeLists.txt && make && ls && ./executeTests
RUN ls

# cd googleTest_testing && ls && cmake CMakeLists.txt && make && ls && ls && ./executeTests




# testing googletest
# RUN ls 
# && cd googleTest_testing && ls && cmake CMakeLists.txt && make && ls && ./executeTests 
              
  
#  testing catch2
# RUN cd Catch2_testing && ls && sudo cmake -Bbuild -H. -DBUILD_TESTING=OFF && sudo cmake --build build/ --target install && cd examples && ls && g++ 020-TestCase-1.cpp && ls && ./a.out



#Testing_Googletest
    # cd /usr/src/gtest \
    # cmake CMakeLists.txt \
    # make 
# Cloning GoolgeTest sample from github
# RUN git clone https://github.com/Ashwini54/googleTest_framework.git 
# RUN cd googleTest_framework \
#     cd googleTest_framework-main \
#     cmake CMakeLists.txt \
#     make \
#     ./executeTests\
#     cd /
#Testing_Catch2
#Cloning Catch2 sample from github and building the file
# RUN git clone --single-branch --branch v2.x https://github.com/catchorg/Catch2.git
# RUN cd Catch2 \
#     cmake -Bbuild -H. -DBUILD_TESTING=OFF \
#     cmake --build build/ --target install \
#     cd examples \
#     g++ 020-TestCase-1.cpp \
#     ./a.out 

# COPY startUpScript.sh /tmp
# COPY Dependencies.sh /tmp

# RUN /bin/bash -c 'chmod +x /Dependencies.sh'
# CMD ["chmod", "+x",  "/tmp/startUpScript.sh"]
# ENTRYPOINT ["sh", "/tmp/startUpScript.sh"]
