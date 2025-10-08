#!/bin/bash

set -xe

cp -r ~/.config/nvim .

git add .
git commit -m "update"
git push
