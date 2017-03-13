<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersListWithLink">
        <xsl:variable name="offenderName" select="name()" />
        <div class="offenders">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="offendersObj/count/text()"/>
                </xsl:call-template>
            </h3>

            <div class="offendersTable">
                <xsl:for-each select="offendersObj/list/list">
                    <xsl:sort select="requests" data-type="number" order="descending"/>
                    <div>
                        <div>
                            <xsl:if test="$offenderName = 'lazyLoadableImagesBelowTheFold' or $offenderName = 'hiddenImages'">
                                <img src="{text()}" class="smallPreview checker" />
                            </xsl:if>
                            <a href="{text()}" target="_blank"><xsl:value-of select="text()" /></a>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>