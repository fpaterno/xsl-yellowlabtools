<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersByType">
        <xsl:variable name="policy" select="policy" />
        <xsl:for-each select="offendersObj/list/byType/*">
            <h3>
                <xsl:call-template name="convertUnit">
                    <xsl:with-param name="value" select="totalWeight" />
                    <xsl:with-param name="unit" select="$policy/unit"/>
                </xsl:call-template>
                of <xsl:value-of select="name()"/>
            </h3>
            <div class="offendersTable">
                <xsl:for-each select="requests/request">
                    <xsl:sort select="weight" data-type="number" order="descending"/>
                    <div>
                        <div>
                            <xsl:variable name="minimizedUrl">
                                <xsl:call-template name="minimizeString">
                                    <xsl:with-param name="value" select="url" />
                                </xsl:call-template>
                            </xsl:variable>
                            <a href="{url}" target="_blank" title="{url}">
                                <xsl:value-of select="$minimizedUrl"/>
                            </a>
                        </div>
                        <div>
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="weight" />
                                <xsl:with-param name="unit" select="$policy/unit"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
