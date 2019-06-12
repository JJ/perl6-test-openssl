# Docker container with perl6 and openssl

Test container, based on Alpine, with
the [OpenSSL](https://github.com/sergot/openssl) module
included. This module needs an additional library installed, which makes it
less automatic, so this container solves that.

## Use in Travis

Check out
[this `.travis.yml` as an example](https://github.com/JJ/p6-app-squashathons/blob/master/.travis.yml). A
generic one should go more or less like this


~~~
language:
  - minimal

services:
  - docker

install:
  - docker pull jjmerelo/perl6-test-openssl

script: docker run -t -v  $TRAVIS_BUILD_DIR:/test jjmerelo/perl6-test-openssl
~~~

`docker images` is not needed, but it will show you the version it is
going to use for building. 

The ultimate base image of this container
is [Alpine Linux](https://alpinelinux.org), so any additional library the module
needs to install will have to be installed in this distro.
