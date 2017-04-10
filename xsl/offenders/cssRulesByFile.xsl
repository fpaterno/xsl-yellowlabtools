<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssRulesByFile">
        <xsl:variable name="offenderName" select="name()" />
        <div class="offenders">
            <xsl:for-each select="offendersObj/byFile/byFile">
                <xsl:sort select="count" data-type="number" order="ascending"/>
                <xsl:variable name="url" select="url" />
                <div>
                    <h3>
                        <xsl:call-template name="grammaticalNumber">
                            <xsl:with-param name="term" select="'offender'" />
                            <xsl:with-param name="nb" select="count"/>
                        </xsl:call-template>
                        in
                        <a target="_blank" href="{$url}">
                            <xsl:call-template name="minimizeString">
                                <xsl:with-param name="value" select="$url" />
                                <xsl:with-param name="size" select="20" />
                            </xsl:call-template>
                        </a>
                    </h3>
                    <div class="offendersTable">
                        <xsl:for-each select="offenders/offender">
                            <div>
                                <div>
                                    <xsl:choose>
                                        <xsl:when test="query">
                                            <xsl:apply-templates select="current()" mode="cssComplexSelectorsQuery" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:apply-templates select="current()" mode="cssComplexSelectorsCss" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="offender" mode="cssComplexSelectorsQuery">
        <b><xsl:value-of select="query" /></b>
        <xsl:text> for </xsl:text>
        <xsl:value-of select="rules" />
        <xsl:text> rules </xsl:text>
        <span>
            <xsl:value-of select="concat('@ ', line, ':', column)" />
        </span>
    </xsl:template>

    <xsl:template match="offender" mode="cssComplexSelectorsCss">
        <b><xsl:value-of select="css" /></b>
        <xsl:text> </xsl:text>
        <span>
            <xsl:value-of select="concat('@ ', line, ':', column)" />
        </span>
    </xsl:template>
</xsl:stylesheet>
