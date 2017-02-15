#!/bin/bash

XML_FILE='output.xml'
XSL_DIR='xsl'
OUTPUT_DIR='output'

mkdir -p $OUTPUT_DIR
cp -r ressources $OUTPUT_DIR/

cp screenshot.png $OUTPUT_DIR/screenshot.png

# Generate specific pages
xsltproc $XSL_DIR/dashboard.xsl $XML_FILE > $OUTPUT_DIR/index.html
xsltproc $XSL_DIR/screenshot.xsl $XML_FILE > $OUTPUT_DIR/screenshot.html

# Generate rules pages
PAGE_WEIGHT="totalWeight imageOptimization gzipCompression fileMinification"
REQUESTS="totalRequests domains notFound"
RULES="$PAGE_WEIGHT $REQUESTS"

for RULE in $RULES
do
    xsltproc --stringparam rule $RULE $XSL_DIR/rules.xsl $XML_FILE > "$OUTPUT_DIR/$RULE.html"
done
