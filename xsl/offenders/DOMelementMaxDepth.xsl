<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersDOMelementMaxDepth">
        
        <div class="offenders">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="offendersObj/count/text()"/>
                </xsl:call-template>
            </h3>


            <div class="offendersHtml">
                <div>
                    <div class="domTree">
                        <xsl:call-template name="treeNode">
                            <xsl:with-param name="node" select="offendersObj/tree" />
                        </xsl:call-template>
                    </div>
                </div>
            </div>

        </div>
    </xsl:template>

    <xsl:template name="treeNode">
        <xsl:param name="node"/>
        <xsl:for-each select="$node/*">
            <div>
                <span>
                    <xsl:value-of select="name(.)" />
                    <xsl:if test="normalize-space(text()) and text() &gt; 1">
                        <span> (x<xsl:value-of select="text()" />)</span>
                    </xsl:if>
                </span>
                <xsl:call-template name="treeNode">
                    <xsl:with-param name="node" select="." />
                </xsl:call-template>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>