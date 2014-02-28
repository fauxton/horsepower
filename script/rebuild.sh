#!/bin/bash

rm horsepower-0.0.1.gem
yes | gem uninstall horsepower
gem build horsepower.gemspec
gem install horsepower-0.0.1.gem
