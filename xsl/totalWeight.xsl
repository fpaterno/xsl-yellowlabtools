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
                <div id="body">
                    <xsl:call-template name="sub-header"/>
                    <div class="rule board">
                        <xsl:call-template name="back-to-dashboard"/>
                        <xsl:apply-templates select="/response/rules/totalWeight" mode="ruleDetail"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>