<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssComplexSelectors">
        <xsl:variable name="offenderName" select="name()" />
        <div class="offenders">
            <xsl:for-each select="offendersObj/byFile/byFile">
                <xsl:sort select="count" data-type="number" order="ascending"/>
                <div>
                    <h3>
                        <xsl:call-template name="grammaticalNumber">
                            <xsl:with-param name="term" select="'offender'" />
                            <xsl:with-param name="nb" select="count"/>
                        </xsl:call-template>
                        in
                    </h3>
                    <div class="offendersTable">
                        <xsl:for-each select="offenders/offender">
                            <div>
                                <div>
                                    <b><xsl:value-of select="css" /></b>
                                    <xsl:text> </xsl:text>
                                    <span><xsl:value-of select="concat('@ ', line, ':', column)" /></span>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>
