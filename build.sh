#!/bin/sh
yum install wget rpm-build openssl-devel gcc-c++ pcre-devel zlib-devel make unzip -y
NX_VERSION=`grep "Version" SPECS/nginx.spec |cut -d " " -f 2`
wget http://nginx.org/download/nginx-${NX_VERSION}.tar.gz -P SOURCES/
NPS_VERSION=`grep "define nps_version" SPECS/nginx.spec |cut -d " " -f 3`
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip -P SOURCES/
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz -P SOURCES/
rpmbuild -ba SPECS/nginx.spec
setsebool -P httpd_execmem on
