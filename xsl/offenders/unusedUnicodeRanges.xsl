<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersUnusedUnicodeRanges">
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
                        <xsl:variable name="size">
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="weight" />
                                <xsl:with-param name="unit" select="'bytes'"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <h3>
                            <a href="{url}" target="_blank">
                                <xsl:call-template name="minimizeString">
                                    <xsl:with-param name="value" select="url" />
                                    <xsl:with-param name="size" select="30" />
                                </xsl:call-template>
                            </a>
                            <xsl:value-of select="concat(' (', $size, ')')" />
                        </h3>
                        <div class="offendersTable">
                            <xsl:for-each select="unicodeRanges/unicodeRange">
                                <div>
                                    <div><b><xsl:value-of select="name" /></b></div>
                                    <div>
                                        <xsl:if test="underused = 'true'">
                                            <xsl:attribute name="class">offenderProblem</xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="numGlyphsInCommonWithPageContent" /> of its <xsl:value-of select="string-length(charset)" /> glyphs

                                        <xsl:choose>
                                            <xsl:when test="numGlyphsInCommonWithPageContent &gt; 1">
                                                are
                                            </xsl:when>
                                            <xsl:otherwise>
                                                is
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        possibly used
                                    </div>
                                    <div>
                                        <div class="offenderButton opens">
                                            glyphes list
                                            <div>
                                                <xsl:call-template name="letterSpace">
                                                    <xsl:with-param name="text" select="charset" />
                                                </xsl:call-template>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="letterSpace">
        <xsl:param name="text" />
        <xsl:if test="$text != ''">
            <xsl:variable name="letter" select="substring($text, 1, 1)" />
            <xsl:value-of select="concat($letter, ' ')" />
            <xsl:call-template name="letterSpace">
                <xsl:with-param name="text" select="substring($text, 2)" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
