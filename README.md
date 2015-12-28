# nim-docker [![Build Status](https://travis-ci.org/yglukhov/nim-docker.svg?branch=master)](https://travis-ci.org/yglukhov/nim-docker)

This is a helper repo for auto building docker container with latest [Nim](https://github.com/nim-lang/Nim) devel version. In order to setup [Travis CI](https://travis-ci.org) for your project using this container, copy the following lines to your `.travis.yml` file in the root of your repo:
```yml
sudo: required
services:
  - docker
before_install:
  - docker pull yglukhov/devel
script:
  - docker run -v "$(pwd):/project" -w /project yglukhov/devel nim --version
  - docker run -v "$(pwd):/project" -w /project yglukhov/devel nimble tests
```
Also make sure to enable your project in [Travis CI](https://travis-ci.org). This configuration will run `nimble tests` in the root of your repository.
