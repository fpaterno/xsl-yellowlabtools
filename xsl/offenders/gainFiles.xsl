<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersGainFiles">
        <xsl:variable name="policy" select="policy" />
        <xsl:if test="value &gt; 0">
            <h3>
                <xsl:call-template name="convertUnit">
                    <xsl:with-param name="value" select="offendersObj/list/totalGain" />
                    <xsl:with-param name="unit" select="$policy/unit"/>
                </xsl:call-template>
                could be saved on 
                <xsl:value-of name="value" select="count(offendersObj/list/files/file)" />
                files
            </h3>
        </xsl:if>

        <div class="table">
            <div class="headers">
                <div>File</div> 
                <div>Current weight</div> 
                <div>Minified</div> 
                <div>Gain</div> 
            </div>
            <xsl:for-each select="offendersObj/list/files/file">
                <xsl:sort select="gain" data-type="number" order="descending"/>
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
                                <xsl:with-param name="value" select="original" />
                                <xsl:with-param name="unit" select="$policy/unit"/>
                            </xsl:call-template>
                        </div> 
                        <div>
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="gzipped" />
                                <xsl:with-param name="unit" select="$policy/unit"/>
                            </xsl:call-template>
                        </div> 
                        <div>
                            <b>-
                                <xsl:call-template name="convertUnit">
                                    <xsl:with-param name="value" select="gain" />
                                    <xsl:with-param name="unit" select="$policy/unit"/>
                                </xsl:call-template>
                            </b>
                        </div> 
                    </div>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>
