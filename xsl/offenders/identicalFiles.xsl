<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersIdenticalFiles">
        <div class="offenders">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="value"/>
                </xsl:call-template>
            </h3>
            <div>
                <xsl:for-each select="offendersObj/list/*">
                    <div>
                        <h4>
                            A file of
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="weight" />
                                <xsl:with-param name="unit" select="'bytes'"/>
                            </xsl:call-template>
                            is loaded
                            <xsl:value-of select="count(urls/url)" />
                            times
                        </h4>
                        <div class="offendersTable">
                            <xsl:for-each select="urls/url">
                                <div>
                                    <div>
                                        <a href="{text()}" target="_blank" title="{text()}">
                                            <xsl:value-of select="text()" />
                                        </a>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
