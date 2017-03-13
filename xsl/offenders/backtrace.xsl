<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersBacktrace">
        
        <div class="offenders">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="value"/>
                </xsl:call-template>
            </h3>

            <div class="offendersTable">
                <xsl:for-each select="offendersObj/list/list">
                    <xsl:variable name="label">
                        <xsl:choose>
                            <xsl:when test="not(error)">
                                Scroll event bound on 
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="target">
                                            <xsl:value-of select="target" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            window
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </xsl:when>
                            <xsl:otherwise>
                                <b><xsl:value-of select="error" /></b>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <div>
                        <div>
                            <div>
                                <span><xsl:copy-of select="$label" /></span>
                                <div class="offenderButton opens">
                                    backtrace
                                    <div class="backtrace">
                                        <xsl:for-each select="backtrace/backtrace">
                                            <div>
                                                <xsl:if test="functionName">
                                                    <span><xsl:value-of select="functionName" />()</span>
                                                    <xsl:text> </xsl:text>
                                                </xsl:if>
                                                <a href="{file}" target="_blank">
                                                    <xsl:call-template name="minimizeString">
                                                        <xsl:with-param name="value" select="file" />
                                                        <xsl:with-param name="size" select="30" />
                                                    </xsl:call-template>
                                                </a>
                                                line <xsl:value-of select="line" />
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>

        </div>
    </xsl:template>

</xsl:stylesheet>