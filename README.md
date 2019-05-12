# Docker container with perl6 and openssl

Test container with [OpenSSL](https://github.com/sergot/openssl)
included. This needs an additional library installed, which makes it
less automatic, so this container solves that.

## Use in Travis

A generic file should go more or less like this

~~~
language:
  - minimal

services:
  - docker

install:
  - docker pull jjmerelo/perl6-test-openssl
  - docker images

script: docker run -t -v  $TRAVIS_BUILD_DIR:/test jjmerelo/perl6-test-openssl
~~~

`docker images` is not needed, but it will show you the version it is
going to use for building. 

The ultimate base image of this container
is [Alpine Linux](https://alpinelinux.org), so any additional library the module
needs to install will have to be installed in this distro.
