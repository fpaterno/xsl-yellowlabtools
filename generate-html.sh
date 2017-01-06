#!/bin/bash

XML_FILE='output.xml'
OUTPUT_DIR='output'

mkdir -p $OUTPUT_DIR
cp -r ressources $OUTPUT_DIR/

xsltproc xsl/dashboard.xsl $XML_FILE > $OUTPUT_DIR/index.html