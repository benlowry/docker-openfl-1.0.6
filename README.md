## Dockerfile for OpenFL 1.0.6
### Work in progress

This Dockerfile creates a Ubuntu 14.04 server w/ a fully configured
and ready to compile version of OpenFL 1.0.6.  This version is important
for building OpenFL apps for Android 2.2 "Froyo" on the B&N NOOK tablets.

This requires android-ndk.zip, android-sdk.zip and apache-ant.zip
which are zips of the directories OpenFL downloaded/created during the
setup process for targeting Android including the SDK stuff you have
to install through the Java interface.  These were too big to be
included in the repository.  They will download automatically in the
build script or you can get them from here:

1. https://www.dropbox.com/s/mgve63yj4ht6rxs/android-ndk.tar.gz?dl=0
2. https://www.dropbox.com/s/5f2kzosdm03mxul/android-sdk.tar.gz?dl=0
3. https://www.dropbox.com/s/b4jlmw3nvc45vff/apache-ant.tar.gz?dl=0

That stuff might be able to be built in automatically but for now
the goal is to just get it fully functional.

You can include your specific haxelib stuff in the Dockerfile.

## How to use this

1. Install Docker (http://docker.io)
2. Clone the repo to your build server
3. Run `build.sh` (optional 'clean' parameter which will ruin your day if you use docker for other stuff)

This wil
