<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersEventsScrollBound">
        
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
                                <span>Scroll event bound on <b><xsl:value-of select="target" /></b></span>
                                <xsl:if test="target = 'window'">
                                    <div class="offenderButton opens">
                                        backtrace
                                        <div class="backtrace">
                                            <xsl:for-each select="backtrace/backtrace">
                                                <div>
                                                    <a href="{file}" target="_blank">
                                                        <xsl:value-of select="concat(functionName, '@', file, ':', line)" />
                                                    </a>
                                                    line <xsl:value-of select="column" />
                                                </div>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </xsl:if>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>

        </div>
    </xsl:template>

</xsl:stylesheet>