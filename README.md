## Dockerfile for OpenFL 1.0.6
### Work in progress

This Dockerfile creates a Ubuntu 14.04 server w/ a fully configured
and ready to compile version of OpenFL 1.0.6.  This version is important
for building OpenFL apps for Android 2.2 "Froyo" on the B&N NOOK tablets.

This requires android-ndk.zip, android-sdk.zip and apache-ant.zip
which are zips of the directories OpenFL downloaded/created during the
setup process for targeting Android including the SDK stuff you have
to install through the Java interface.  These were too big to be
included in the repository.

1. https://www.dropbox.com/s/efc0g6ddqjvvsl5/android-ndk.zip?dl=0
2. https://www.dropbox.com/s/kbzeyr3g0qmgb1e/android-sdk.zip?dl=0
3. https://www.dropbox.com/s/vjzux4m5x37971v/apache-ant.zip?dl=0

That stuff might be able to be built in automatically but for now
the goal is to just get it fully functional.

You can include your specific haxelib stuff in the Dockerfile.

## How to use this

1. Install Docker (http://docker.io)
2. Clone the repo to your build server and download the zips
3. `docker build --rm=true -t openfl/106 --no-cache .` will create
your fully configured image of the server
4. `docker run openfl/106 /path/to/your/build/script/etc`
