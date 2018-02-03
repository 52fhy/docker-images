#!/bin/bash
cp -rf ../php70-fpm-centos68/*gz ./
docker build -t php71-fpm-centos68 .
