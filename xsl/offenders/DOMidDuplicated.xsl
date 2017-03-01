<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersDOMidDuplicated">
        
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
                            <b><xsl:value-of select="id" /></b>
                            <xsl:text>: </xsl:text>
                            <xsl:value-of select="occurrences" />
                            <xsl:call-template name="grammaticalNumber">
                                <xsl:with-param name="term" select="'occurence'" />
                                <xsl:with-param name="nb" select="occurences"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>