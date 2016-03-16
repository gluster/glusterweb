#!/usr/bin/env sh
git submodule init && git submodule update

DEPENDENCIES="ruby-devel rubygems-devel gcc-c++ curl-devel rubygem-bundler patch ImageMagick"

if hash dnf 2>/dev/null; then
  sudo dnf install $DEPENDENCIES
else
  sudo yum install $DEPENDENCIES 
fi

bundle install

