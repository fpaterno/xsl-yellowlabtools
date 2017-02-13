<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersGainImages">
        <xsl:variable name="policy" select="policy" />
        <xsl:if test="value &gt; 0">
            <h3>
                <xsl:call-template name="convertUnit">
                    <xsl:with-param name="value" select="offendersObj/list/totalGain" />
                    <xsl:with-param name="unit" select="$policy/unit"/>
                </xsl:call-template>
                could be saved on 
                <xsl:value-of name="value" select="count(offendersObj/list/images/image)" />
                images
            </h3>
        </xsl:if>

        <div class="imageOffenders">
            <xsl:for-each select="offendersObj/list/images/image">
                <xsl:sort select="gain" data-type="number" order="descending"/>
                <div>
                    <div>
                        <xsl:variable name="minimizedUrl">
                            <xsl:call-template name="minimizeString">
                                <xsl:with-param name="value" select="url" />
                                <xsl:with-param name="size" select="20" />
                            </xsl:call-template>
                        </xsl:variable>
                        Current file: 
                        <a href="{url}" target="_blank" title="{url}">
                            <xsl:value-of select="$minimizedUrl"/>
                        </a>
                        <div>
                            <a href="{url}" target="_blank">
                                <img class="checker" src="{url}" />
                            </a>
                        </div>
                    </div>
                    
                    <div>
                        <p>
                            Current weight: 
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="original" />
                                <xsl:with-param name="unit" select="$policy/unit"/>
                            </xsl:call-template>
                        </p>
                        <p>
                            With a lossy optimization:<br />
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="lossy" />
                                <xsl:with-param name="unit" select="$policy/unit"/>
                            </xsl:call-template>
                            (-<b>
                                <xsl:call-template name="convertUnit">
                                    <xsl:with-param name="value" select="gain" />
                                    <xsl:with-param name="unit" select="$policy/unit"/>
                                </xsl:call-template>
                            </b>)</p>
                    </div>
                    
                    
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>
