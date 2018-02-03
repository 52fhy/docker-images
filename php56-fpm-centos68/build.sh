#!/bin/bash
cp -rf ../php70-fpm-centos68/*gz ./
docker build -t php56-fpm-centos68 .
