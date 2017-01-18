#!/bin/bash

XML_FILE='output.xml'
OUTPUT_DIR='output'

mkdir -p $OUTPUT_DIR
cp -r ressources $OUTPUT_DIR/

cp screenshot.png $OUTPUT_DIR/screenshot.png
xsltproc xsl/dashboard.xsl $XML_FILE > $OUTPUT_DIR/index.html
xsltproc xsl/screenshot.xsl $XML_FILE > $OUTPUT_DIR/screenshot.html
xsltproc xsl/totalWeight.xsl $XML_FILE > $OUTPUT_DIR/totalWeight.html
