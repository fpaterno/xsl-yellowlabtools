<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersFontsCount">

        <div>
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="offendersObj/count"/>
                </xsl:call-template>
            </h3>
            <div class="offendersTable">
                <xsl:for-each select="offendersObj/list/list">
                    <div>
                        <div>
                            <div>
                                <a href="{url}" target="_blank">
                                    <xsl:call-template name="minimizeString">
                                        <xsl:with-param name="value" select="url" />
                                        <xsl:with-param name="size" select="30" />
                                    </xsl:call-template>
                                </a>
                                <xsl:variable name="convertedSize">
                                    <xsl:call-template name="convertUnit">
                                        <xsl:with-param name="value" select="size" />
                                        <xsl:with-param name="unit" select="'bytes'"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:value-of select="concat(' (', $convertedSize, ')')" />
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
