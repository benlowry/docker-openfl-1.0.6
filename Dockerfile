FROM ubuntu:14.04
MAINTAINER Ben Lowry "benlowry@outlook.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential software-properties-common git unzip wget curl imagemagick default-jre default-jdk

CMD ["/bin/bash"]
ENV HOME /root/
RUN env
WORKDIR /root/

# Install haxe
ADD hxcpp_config.xml /root/.hxcpp_config.xml
ADD install-haxe.sh /root/install-haxe.sh
RUN chmod +x /root/install-haxe.sh
RUN /root/install-haxe.sh -y

# Install haxelibs and openfl
RUN haxelib install actuate 1.7.0
RUN haxelib install haxe-ga 0.4.6
RUN haxelib install hxcpp 3.1.39
RUN haxelib install hxlibc 1.1.4
RUN haxelib install hxtools 1.1.6
RUN haxelib install openfl 1.0.6
RUN haxelib install openfl-html5-dom 1.2.1
RUN haxelib install openfl-native 1.0.6
RUN haxelib install openfl-compatibility 1.0.1
RUN haxelib install openfl-tools 1.10

# Setup openfl android dependencies
ADD android-ndk.tar.gz /root/
ADD android-sdk.tar.gz /root/
ADD apache-ant.tar.gz /root/

# SSH key for bitbucket
RUN mkdir /root/.ssh/
ADD pb_rsa.pub /root/.ssh/id_rsa.pub
ADD pb_rsa /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
RUN echo "IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config

# Projects
RUN mkdir /root/jigsaws/
RUN git clone git@bitbucket.org:puzzleboss/jigsaw-engine.git /root/jigsaws/jigsaw
RUN git clone git@bitbucket.org:puzzleboss/jigsaw-build.git /root/jigsaws/build
RUN git clone git@bitbucket.org:puzzleboss/jigsaw-photos.git /root/jigsaws/Photos
RUN mkdir /root/JigsawsCompile/

# Permissions
RUN chown -R root:root /root
RUN chmod -R 700 /root/.ssh
