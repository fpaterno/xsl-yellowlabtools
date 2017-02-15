<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersTotalRequests">
        <xsl:variable name="policy" select="policy" />
        <h3>Requests by MIME type</h3>
        <xsl:for-each select="offendersObj/list/byType/*">
            <h3>
                <xsl:call-template name="grammaticalNumber">
                    <xsl:with-param name="term" select="concat(name(), ' request')" />
                    <xsl:with-param name="nb" select="count(*)"/>
                </xsl:call-template>
            </h3>

            <xsl:if test="1">
                <xsl:choose>
                    <xsl:when test="name() = 'css' and count(*) &gt; 2">
                        <p>Reduce the number of stylesheets by concatenating them.</p>
                    </xsl:when>
                    <xsl:when test="name() = 'js' and count(*) &gt; 3">
                        <p>Reduce the number of scripts by concatenating them.</p>
                    </xsl:when>
                    <xsl:when test="name() = 'image' and count(*) &gt; 5">
                        <p>Reduce the number of images by lazyloading them or by spriting them.</p>
                    </xsl:when>
                    <xsl:when test="name() = 'other' and count(*) &gt; 0">
                        <p>They can be Flash, XML, music or any undetected format.</p>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <div class="offendersTable">
                <xsl:for-each select="node()">
                    <div>
                        <div>
                            <xsl:variable name="minimizedUrl">
                                <xsl:call-template name="minimizeString">
                                    <xsl:with-param name="value" select="text()" />
                                </xsl:call-template>
                            </xsl:variable>
                            <a href="{text()}" target="_blank" title="{text()}">
                                <xsl:value-of select="$minimizedUrl" />
                            </a>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
