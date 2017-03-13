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

</xsl:stylesheet>