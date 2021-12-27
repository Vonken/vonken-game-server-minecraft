FROM ubuntu:latest

MAINTAINER Vonken

# SPIGOT_HOME         default directory for SPIGOT-server
ENV SPIGOT_HOME=/minecraft

# set default java environment variable
ENV JAVA_VERSION_MAJOR=17 \
    JAVA_VERSION_MINOR=0.1 \
    JAVA_VERSION_UPDATE=12 \
    JAVA_TYPE="" \
    JAVA_OPT=hotspot \
    JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin/


VOLUME ["/home/minecraft"]
WORKDIR /home/minecraft

EXPOSE 8123
EXPOSE 25565
EXPOSE 25575

RUN	apt-get -y update
RUN apt-get install -y curl
RUN apt-get install -y git

# create java directory
RUN mkdir -p /usr/lib/jvm/

# download jdk and unpack in /usr/lib/jvm
RUN curl -L https://github.com/adoptium/temurin${JAVA_VERSION_MAJOR}-binaries/releases/download/jdk-${JAVA_VERSION_MAJOR}.${JAVA_VERSION_MINOR}%2B${JAVA_VERSION_UPDATE}/OpenJDK${JAVA_VERSION_MAJOR}U-jdk_x64_linux_${JAVA_OPT}_${JAVA_VERSION_MAJOR}.${JAVA_VERSION_MINOR}_${JAVA_VERSION_UPDATE}.tar.gz | tar xz -C /usr/lib/jvm/

# set compatible home path
RUN ln -s /usr/lib/jvm/jdk-${JAVA_VERSION_MAJOR}.${JAVA_VERSION_MINOR}+${JAVA_VERSION_UPDATE} /usr/lib/jvm/default-jvm
RUN ln -s /usr/lib/jvm/default-jvm/bin/java /usr/bin/java
	
# remove apt cache from image
RUN apt-get clean all
	
	
RUN curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev latest
RUN cp spigot-*.jar spigot.jar
	
# Make special user for minecraft to run in
RUN /usr/sbin/useradd -s /bin/bash -d /home/minecraft -m minecraft

COPY data/ /home/minecraft

ENTRYPOINT ["java", "-Xms1024M", "-Xmx2048M", "-Dfile.encoding=UTF-8", "-jar", "spigot.jar", "nogui"]