<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssColors">
        <xsl:variable name="offenderName" select="name()" />
        <div class="offenders">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="value"/>
                </xsl:call-template>
            </h3>
            <div class="offendersHtml">
                <div>
                    <p>This is the colors palette, sized by total occurrences:</p>
                    <div class="colorPalette checker">
                        <xsl:variable name="maxOccurences" select="offendersObj/palette/palette[position()=1]/occurrences" />
                        <xsl:for-each select="offendersObj/palette/palette">
                            <xsl:variable name="color" select="color" />
                            <xsl:variable name="pourcent" select="(occurrences div $maxOccurences) * 100" />
                            <div style="background-color: {$color}; width: {$pourcent}%">
                                <div>
                                    <xsl:value-of select="$color" /> (<xsl:value-of select="occurrences" /> times)</div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
