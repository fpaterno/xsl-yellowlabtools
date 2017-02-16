<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersSmallRequests">
        <xsl:for-each select="offendersObj/list/byType/*">
            <div>
                <h3>
                    <xsl:call-template name="grammaticalNumber">
                        <xsl:with-param name="term" select="concat('small ', name(), ' file')" />
                        <xsl:with-param name="nb" select="count(*)"/>
                    </xsl:call-template>
                </h3>
                <p>
                    <xsl:choose>
                        <xsl:when test="name() = 'css'">
                            Try to inline these styles in the head of the HTML or to merge them with other files.
                        </xsl:when>
                        <xsl:when test="name() = 'js'">
                            Try to inline these scripts in the HTML or merge them with other files.
                        </xsl:when>
                        <xsl:when test="name() = 'image'">
                            Try to inline these images (with base64 encoding for most image types except SVG that don't need base64 encoding). You can also create sprites.
                        </xsl:when>
                    </xsl:choose>
                </p>

                <div class="table">
                    <xsl:variable name="type" select="name()" />
                    <div class="headers">
                        <xsl:if test="$type = 'image'">
                            <div>Preview</div>
                        </xsl:if>
                        <div>File</div>
                        <div>Weight (bytes)</div>
                    </div>
                    <xsl:for-each select="*">
                        <div>
                            <xsl:if test="$type = 'image'">
                                <div>
                                    <img src="{url}" class="smallPreview checker" />
                                </div>
                            </xsl:if>
                            <div>
                                <a href="{url}" target="_blank" title="{url}">
                                    <xsl:call-template name="minimizeString">
                                        <xsl:with-param name="value" select="url" />
                                        <xsl:with-param name="size" select="50" />
                                    </xsl:call-template>
                                </a>
                            </div> 
                            <div><xsl:value-of select="size" /></div> 
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
