<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssImports">
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
                            <xsl:value-of select="css" />
                            <xsl:call-template name="cssFileAndLine">
                                <xsl:with-param name="node" select="current()" />
                            </xsl:call-template>
                        </div>
                    </div>
                </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
