#!/bin/sh

current_dir=$(pwd)

docker run -v $current_dir/test/test-site:/usr/share/blog -p1313:1313 --rm --name cm-hugo cloudmanager-hugo hugo server -DFw --bind="0.0.0.0"
# docker run -v $current_dir/test/test-site:/usr/share/blog --rm --name cm-hugo cloudmanager-hugo hugo --minify
