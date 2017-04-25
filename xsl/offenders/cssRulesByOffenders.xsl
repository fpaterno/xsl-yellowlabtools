<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssRulesByOffenders">
        <xsl:variable name="offenderName" select="name()" />
        <div class="offenders">
            <xsl:for-each select="offendersObj/byFile/byFile">
                <div>
                    <h3>
                        <xsl:call-template name="grammaticalNumber">
                            <xsl:with-param name="term" select="'offender'" />
                            <xsl:with-param name="nb" select="count"/>
                        </xsl:call-template>
                        in 
                        <xsl:choose>
                            <xsl:when test="starts-with(url, 'http')">
                                <a href="{url}" target="_blank" title="{url}">
                                    <xsl:call-template name="minimizeString">
                                        <xsl:with-param name="value" select="url" />
                                        <xsl:with-param name="size" select="30" />
                                    </xsl:call-template>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="url" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </h3>
                    <div class="offendersTable">
                        <xsl:for-each select="offenders/offender">
                            <div>
                                <div>
                                    <xsl:choose>
                                        <xsl:when test="css">
                                            <xsl:choose>
                                                <xsl:when test="browser">
                                                    <xsl:apply-templates select="current()" mode="cssRulesOffendersFix" />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:apply-templates select="current()" mode="cssRulesOffendersCss" />
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:when test="expression">
                                            <xsl:apply-templates select="current()" mode="cssRulesOffendersExpression" />
                                        </xsl:when>
                                        <xsl:when test="value">
                                            <xsl:apply-templates select="current()" mode="cssRulesOffendersImportant" />
                                        </xsl:when>
                                        <xsl:when test="property">
                                            <xsl:apply-templates select="current()" mode="cssRulesOffendersDuplicated" />
                                        </xsl:when>


<!--
                                        <xsl:otherwise>
                                            <xsl:apply-templates select="current()" mode="cssRulesOffendersCss" />
                                        </xsl:otherwise>
                                        -->
                                    </xsl:choose>
                                    <span>
                                        <xsl:value-of select="concat(' @ ', line, ':', column)" />
                                    </span>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="offender" mode="cssRulesOffendersDuplicated">
        Property <b><xsl:value-of select="property" /></b>
        duplicated in
        <b><xsl:value-of select="rule" /> { }</b>
    </xsl:template>

    <xsl:template match="offender" mode="cssRulesOffendersCss">
        <xsl:if test="bolded">
            <xsl:value-of select="bolded" disable-output-escaping="yes" />
        </xsl:if>
        <xsl:if test="not(bolded)">
            <b><xsl:value-of select="css" /></b>
        </xsl:if>
    </xsl:template>

    <xsl:template match="offender" mode="cssRulesOffendersExpression">
        <xsl:value-of select="rule" />
        {
        <xsl:value-of select="property" />:
        <b>expression(</b>
        <xsl:value-of select="expression" />
        <b>)</b>
        }
    </xsl:template>

    <xsl:template match="offender" mode="cssRulesOffendersImportant">
        <xsl:value-of select="rule" />
        {
        <xsl:value-of select="concat(property, ':', value)" />
        <b>!important</b>
        }
    </xsl:template>

    <xsl:template match="offender" mode="cssRulesOffendersFix">
        <b><xsl:value-of select="browser" /> fix:</b>
        <xsl:value-of select="bolded" disable-output-escaping="yes" />
    </xsl:template>
</xsl:stylesheet>

