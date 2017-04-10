<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersSimilarColors">
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
                    <xsl:variable name="background">
                        <xsl:choose>
                            <xsl:when test="isDark = 'true'">#ffffff</xsl:when>
                            <xsl:otherwise>#000000</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <div>
                        <div>
                            <div> 
                                <div class="similarColors checker">
                                    <div style="background-color: {color1}; color: {$background};">
                                        <xsl:value-of select="color1" />
                                    </div>
                                    <div style="background-color: {color2}; color: {$background};">
                                        <xsl:value-of select="color2" />
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

