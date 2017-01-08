<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="templates/helper-convert.xsl"/>
    <xsl:include href="templates/html-meta.xsl"/>
    <xsl:include href="templates/html-sections.xsl"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <xsl:call-template name="head"/>
            <body>
                <xsl:call-template name="header"/>
                <div class="screenshot board">
                    <h2>Screenshot</h2>
                    <div class="screenshotWrapper desktop">
                        <div>
                            <img class="screenshotImage" src="{/response/params/options/screenshot}"/>
                        </div>
                    </div>
                    <p>(scroll on the screenshot to see under the fold)</p>
                    <div class="backToDashboard">
                        <a href="index.html">Back to dashboard</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>