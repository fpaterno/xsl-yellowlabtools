<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersHeavyFonts">
        <xsl:variable name="policy" select="policy" />
        <div>
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="offendersObj/count"/>
                </xsl:call-template>
            </h3>
            <div>
                <xsl:for-each select="offendersObj/fonts/font">
                    <div>
                        <h3>
                            <a href="{url}" target="_blank">
                                <xsl:call-template name="minimizeString">
                                    <xsl:with-param name="value" select="url" />
                                </xsl:call-template>
                            </a>
                        </h3>
                        <div class="offendersTable">
                            <div>
                                <div>Weight</div>
                                <div>
                                    <xsl:if test="weight &gt; 40960">
                                        <xsl:attribute name="class">offenderProblem</xsl:attribute>
                                    </xsl:if>
                                    <xsl:call-template name="convertUnit">
                                        <xsl:with-param name="value" select="weight" />
                                        <xsl:with-param name="unit" select="$policy/unit"/>
                                    </xsl:call-template>
                                </div>
                            </div>
                            <div>
                                <div>Number of glyphs</div>
                                <div><xsl:value-of select="numGlyphs" /></div>
                            </div>
                            <div>
                                <div>Average glyph complexity</div>
                                <div><xsl:value-of select="averageGlyphComplexity   " /></div>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
