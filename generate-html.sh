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
REQUESTS="totalRequests domains notFound identicalFiles emptyRequests smallRequests lazyLoadableImagesBelowTheFold hiddenImages"
DOM_COMPLEX="DOMelementsCount DOMelementMaxDepth iframesCount DOMidDuplicated"
DOM_MANIP="DOMaccesses queriesWithoutResults DOMqueriesAvoidable"
SCROLL_BOTTLENECKS="eventsScrollBound DOMaccessesOnScroll"
BAD_JAVASCRIPT="jsErrors documentWriteCalls synchronousXHR consoleMessages globalVariables"
JQUERY="jQueryVersion jQueryVersionsLoaded jQueryCallsOnEmptyObject jQueryNotDelegatedEvents"
CSS_COMPLEX="cssRules cssComplexSelectors cssColors similarColors cssBreakpoints cssMobileFirst"
BAD_CSS="cssParsingErrors cssImports cssDuplicatedSelectors cssDuplicatedProperties cssEmptyRules cssExpressions cssImportants cssOldIEFixes cssOldPropertyPrefixes cssRedundantBodySelectors cssRedundantChildNodesSelectors"
WEB_FONT="fontsCount heavyFonts unusedUnicodeRanges"

RULES="$PAGE_WEIGHT $REQUESTS $DOM_COMPLEX $DOM_MANIP $SCROLL_BOTTLENECKS $BAD_JAVASCRIPT $JQUERY $CSS_COMPLEX $BAD_CSS $WEB_FONT"

for RULE in $RULES
do
    xsltproc --stringparam rule $RULE $XSL_DIR/rules.xsl $XML_FILE > "$OUTPUT_DIR/$RULE.html"
done
