<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssParsingErrors">
        <xsl:variable name="offenderName" select="name()" />
        <div class="offenders">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="value"/>
                </xsl:call-template>
            </h3>
            <div class="offendersTable">
                <xsl:for-each select="offendersObj/list/list">
                <div>
                    <div>
                        <div>
                            <b><xsl:value-of select="error" /></b>
                            <xsl:text> </xsl:text>
                            <a href="{file}" target="_blank">
                                <xsl:call-template name="minimizeString">
                                    <xsl:with-param name="value" select="file" />
                                    <xsl:with-param name="size" select="30" />
                                </xsl:call-template>
                            </a>
                            <span>
                                (
                                <xsl:variable name="url" select="concat('http://jigsaw.w3.org/css-validator/validator?profile=css3&amp;usermedium=all&amp;warning=no&amp;uri=', file)" />
                                <a href="{$url}" target="_blank">
                                    Check on the W3C validator
                                </a>
                                )
                            </span>
                        </div>
                    </div>
                </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
