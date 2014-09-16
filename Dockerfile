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
RUN haxelib install hxlibc 1.1.4
RUN haxelib install hxtools 1.1.6
RUN haxelib install openfl 1.0.6
RUN haxelib install openfl-html5-dom 1.2.1
RUN haxelib install openfl-native 1.0.6
RUN haxelib install openfl-compatibility 1.0.1

# Setup openfl android dependencies
RUN curl -L -o /root/android-ndk.tar.gz https://www.dropbox.com/s/mgve63yj4ht6rxs/android-ndk.tar.gz?dl=1
RUN curl -L -o /root/android-sdk.tar.gz https://www.dropbox.com/s/5f2kzosdm03mxul/android-sdk.tar.gz?dl=1
RUN curl -L -o /root/apache-ant.tar.gz https://www.dropbox.com/s/b4jlmw3nvc45vff/apache-ant.tar.gz?dl=1
RUN tar zxfv android-ndk.tar.gz
RUN tar zxfv android-sdk.tar.gz
RUN tar zxfv apache-ant.tar.gz

# SSH key for bitbucket
RUN mkdir /root/.ssh/
ADD pb_rsa.pub /root/.ssh/id_rsa.pub
ADD pb_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa.pub
RUN chmod 700 /root/.ssh/id_rsa

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
