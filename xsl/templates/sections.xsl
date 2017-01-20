<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Header -->
    <xsl:template name="header">
        <div id="header">
            <h1>Yellow Lab
                <span class="icon-lab"></span>
                Tools
            </h1>
        </div>
    </xsl:template>

    <!-- Sub header -->
    <xsl:template name="sub-header">
        <div>
            <div>
                Tested url:
                <a href="{/response/params/url}" target="_blank" class="testedUrl">
                    <xsl:value-of select="/response/params/url"/>
                </a>
            </div>
        </div>
    </xsl:template>

    <!-- Back to dashboard link -->
    <xsl:template name="back-to-dashboard">
        <div class="backToDashboard">
            <a href="index.html">Back to dashboard</a>
        </div>
    </xsl:template>

</xsl:stylesheet>