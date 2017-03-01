<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersDOMqueriesAvoidable">
        
        <div>
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="'offender'" />
                    <xsl:with-param name="nb" select="offendersObj/count"/>
                </xsl:call-template>
            </h3>
            <div class="offendersTable">
                <xsl:for-each select="offendersObj/list/list">
                    <xsl:sort select="count" data-type="number" order="descending"/>
                    <div>
                        <div>
                            <b><xsl:value-of select="query"/></b>
                            (in <xsl:apply-templates select="context" />) using <xsl:value-of select="fn"/>: 
                            <b>
                                <xsl:call-template name="grammaticalNumber">
                                    <xsl:with-param name="term" select="'query'" />
                                    <xsl:with-param name="pluralTerm" select="'queries'"/>
                                    <xsl:with-param name="nb" select="count"/>
                                </xsl:call-template>
                            </b>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="context">
        <div class="offenderButton">
            <xsl:if test="tree">
                <xsl:attribute name="class">offenderButton opens</xsl:attribute>
            </xsl:if>

            <xsl:choose>
                <xsl:when test="tree">
                    DOM element <b><xsl:value-of select="element" /></b>
                    <div class="domTree">
                        <xsl:call-template name="treeNode">
                            <xsl:with-param name="node" select="tree" />
                        </xsl:call-template>
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="type"/>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>

</xsl:stylesheet>
