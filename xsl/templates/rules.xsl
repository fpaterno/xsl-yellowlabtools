<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Rules details -->
    <xsl:template match="*" mode="ruleDetail">
        <div class="ruleTable">
            <div class="left"> 
                <h2>
                    <xsl:value-of select="policy/label"/>
                </h2>
                <xsl:variable name="grade">
                    <xsl:call-template name="convertToGrade">
                        <xsl:with-param name="score" select="score"/>
                    </xsl:call-template>
                </xsl:variable>
                <div class="score {$grade}">
                    <xsl:value-of select="$grade"/>
                </div> 
                <div>
                    <xsl:value-of select="score"/>/100</div>
            </div>
            <div class="right">
                <h3>Value: 
                    <span>
                        <xsl:call-template name="convertUnit">
                            <xsl:with-param name="value" select="value" />
                            <xsl:with-param name="unit" select="policy/unit"/>
                        </xsl:call-template>
                    </span>
                </h3>

                <xsl:if test="score &lt; 100">
                    <div class="okThreshold">
                        Have 
                        <span>
                            <xsl:call-template name="convertUnit">
                                <xsl:with-param name="value" select="policy/isOkThreshold" />
                                <xsl:with-param name="unit" select="policy/unit"/>
                            </xsl:call-template>
                        </span>
                        <xsl:if test="policy/isOkThreshold &gt; 0 and policy/isOkThreshold &lt; policy/isBadThreshold">
                            <xsl:text> </xsl:text>
                            <span>or less</span>
                        </xsl:if>
                        to get the 100/100 score.
                    </div>
                </xsl:if>
                <div ng-bind-html="rule.policy.message" class="message">
                    <xsl:value-of select="policy/message" disable-output-escaping="yes"/>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
