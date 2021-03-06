<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:include href="templates/meta.xsl"/>
    <xsl:include href="templates/sections.xsl"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <xsl:call-template name="head"/>
            <body>
                <xsl:call-template name="header"/>
                <div id="body">
                    <xsl:call-template name="sub-header"/>
                    <div class="screenshot board">
                        <h2>Screenshot</h2>
                        <div class="screenshotWrapper desktop">
                            <div>
                                <img class="screenshotImage" src="{/response/params/options/screenshot}"/>
                            </div>
                        </div>
                        <p>(scroll on the screenshot to see under the fold)</p>
                        <xsl:call-template name="back-to-dashboard"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>