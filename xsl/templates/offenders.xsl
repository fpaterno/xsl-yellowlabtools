<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Offenders list -->
    <xsl:template match="*" mode="offendersDetail">
        <xsl:variable name="policy" select="policy" />
        <xsl:choose>
            <xsl:when test="offendersObj/list/totalWeight">
                <xsl:apply-templates select="offendersObj/list" mode="offendersWithWeight">
                    <xsl:with-param name="policy" select="policy" />
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="offendersObj/list/totalGain">
                Offenders with gain
                <!--
                <xsl:apply-templates select="offendersObj/list" mode="offendersWithGain">
                    <xsl:with-param name="policy" select="policy" />
                </xsl:apply-templates>
                -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="offendersObj/list" mode="offendersList" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Display offenders simple list -->
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

    <!-- Display offenders list with weight -->
    <xsl:template match="list" mode="offendersWithWeight">
        <xsl:param name="policy" />
        <xsl:for-each select="byType/*">
            <h3>
                <xsl:call-template name="convertUnit">
                    <xsl:with-param name="value" select="totalWeight" />
                    <xsl:with-param name="unit" select="$policy/unit"/>
                </xsl:call-template>
                of <xsl:value-of select="name()"/>
            </h3>
            <div class="offendersTable">
                <xsl:for-each select="requests/request">
                    <xsl:sort select="weight" data-type="number" order="descending"/>
                    <div>
                        <div>
                            <xsl:variable name="minimizedUrl">
                                <xsl:call-template name="minimizeString">
                                    <xsl:with-param name="value" select="url" />
                                </xsl:call-template>
                            </xsl:variable>
                            <a href="{url}" target="_blank" title="{url}">
                                <xsl:value-of select="$minimizedUrl"/>
                            </a>
                        </div>
                        <div>
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="weight" />
                                <xsl:with-param name="unit" select="$policy/unit"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>