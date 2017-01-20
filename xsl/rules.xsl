<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="templates/rules.xsl"/>
    <xsl:import href="templates/offenders.xsl"/>

    <xsl:include href="templates/helpers.xsl"/>
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
                    <div class="rule board">
                        <xsl:call-template name="back-to-dashboard"/>
                        <xsl:apply-templates select="/response/rules/*[name() = $rule]" mode="ruleDetail"/>
                        <xsl:apply-templates select="/response/rules/*[name() = $rule]" mode="offendersDetail"/>
                        <xsl:call-template name="back-to-dashboard"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>