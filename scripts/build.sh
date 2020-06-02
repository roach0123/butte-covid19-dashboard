#!/bin/sh

SOURCE_DIR=`dirname $0`/..
BUILD_DIR=`dirname $0`/../_build
BUILDTIME=`date +%s`

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
mkdir -p $BUILD_DIR/htdocs
mkdir -p $BUILD_DIR/htdocs/css
mkdir -p $BUILD_DIR/htdocs/images
mkdir -p $BUILD_DIR/htdocs/js
mkdir -p $BUILD_DIR/htdocs/data
mkdir -p $BUILD_DIR/htdocs/data/json
mkdir -p $BUILD_DIR/htdocs/data/csv
mkdir -p $BUILD_DIR/scripts

$SOURCE_DIR/scripts/build-exports.py

cp $SOURCE_DIR/htdocs/css/*.css $BUILD_DIR/htdocs/css
cp $SOURCE_DIR/htdocs/images/*.png $BUILD_DIR/htdocs/images
cp $SOURCE_DIR/htdocs/js/*.js $BUILD_DIR/htdocs/js
cp $SOURCE_DIR/htdocs/data/json/timeline.json $BUILD_DIR/htdocs/data/json
cp $SOURCE_DIR/htdocs/data/csv/timeline.csv $BUILD_DIR/htdocs/data/csv
cp $SOURCE_DIR/scripts/*.py $BUILD_DIR/scripts
cp $SOURCE_DIR/scripts/*.sh $BUILD_DIR/scripts

cat $SOURCE_DIR/htdocs/index.html \
    | sed -e "s/@@BUILDTIME@@/$BUILDTIME/g" \
    > $BUILD_DIR/htdocs/index.html
