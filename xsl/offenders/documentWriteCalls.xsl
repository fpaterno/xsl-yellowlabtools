<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersDocumentWriteCalls">
        <div class="offenders">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="offendersObj/count/text()"/>
                </xsl:call-template>
            </h3>

            <div class="offendersTable">
                <xsl:for-each select="offendersObj/list/list">
                    <div>
                        <div>
                            <xsl:choose>
                                <xsl:when test="writeFn">
                                    <b><xsl:value-of select="writeFn" /></b> called from 
                                    <xsl:call-template name="minimizeString">
                                        <xsl:with-param name="value" select="from/file" />
                                        <xsl:with-param name="size" select="20" />
                                    </xsl:call-template>
                                    line <xsl:value-of select="from/line" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="parseError" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>