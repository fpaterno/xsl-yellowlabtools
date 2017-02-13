<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="list" mode="offendersList">
        <xsl:for-each select="byType/*">
            <h3>
                <xsl:choose>
                    <xsl:when test="count(child::*) = 0">No</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="count(child::*)"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="concat(' ', name(), ' ')"/>
                <xsl:choose>
                    <xsl:when test="count(child::*) > 1">requests</xsl:when>
                    <xsl:otherwise>request</xsl:otherwise>
                </xsl:choose>
            </h3>
            <div class="offendersTable">
                <xsl:for-each select="child::*">
                    <div>
                        <div>
                            <xsl:variable name="minimizedUrl">
                                <xsl:call-template name="minimizeString">
                                    <xsl:with-param name="value" select="node()" />
                                </xsl:call-template>
                            </xsl:variable>
                            <a href="{node()}" target="_blank" title="{node()}">
                                <xsl:value-of select="$minimizedUrl"/>
                            </a>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>