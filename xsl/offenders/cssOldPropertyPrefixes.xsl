<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssOldPropertyPrefixes">
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
                            <b><xsl:value-of select="concat(property, ' ', message)" /></b>
                            <xsl:text> </xsl:text>
                            <div class="offenderButton">
                                <xsl:text> </xsl:text>
                                <xsl:call-template name="grammaticalNumber">
                                    <xsl:with-param name="term" select="'offender'" />
                                    <xsl:with-param name="nb" select="count(rules/rule)"/>
                                </xsl:call-template>
                            </div>
                            <div class="smallerOffenders">
                                <xsl:variable name="property" select="property" />
                                <xsl:for-each select="rules/rule">
                                    <xsl:call-template name="cssOldPropertyPrefixesRule">
                                        <xsl:with-param name="property" select="$property" />
                                    </xsl:call-template>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="cssOldPropertyPrefixesRule">
        <xsl:param name="property" />
        <div>
            <xsl:value-of select="concat(rule, ' { ', $property, ': ', value, ' }')" />
            <xsl:text> </xsl:text>
            <xsl:call-template name="cssFileAndLine">
                <xsl:with-param name="node" select="current()" />
            </xsl:call-template>
        </div>
    </xsl:template>

</xsl:stylesheet>
