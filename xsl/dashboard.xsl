<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="templates/helper-convert.xsl"/>
    <xsl:include href="templates/html-meta.xsl"/>
    <xsl:include href="templates/html-sections.xsl"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <xsl:call-template name="head"/>
            <body>
                <xsl:call-template name="header"/>
                <div id="body">
                    <xsl:call-template name="sub-header"/>
                    <div class="summary board">
                        <div class="globalScore">
                            <div>
                                <h2>Global score</h2>
                                <div class="globalScoreDisplay">
                                    <xsl:variable name="globalGrade">
                                        <xsl:call-template name="convertToGrade">
                                            <xsl:with-param name="score"
                                                            select="/response/scoreProfiles/generic/globalScore"/>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <div class="globalGrade {$globalGrade}">
                                        <xsl:value-of select="$globalGrade"/>
                                    </div>

                                    <div class="on100">
                                        <xsl:value-of select="/response/scoreProfiles/generic/globalScore"/>/100
                                    </div>
                                </div>
                            </div>


                            <div>
                                <a href="screenshot.html">
                                    <div class="screenshotWrapper desktop">
                                        <div>
                                            <img class="screenshotImage" src="{/response/params/options/screenshot}"/>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <h2>Score details</h2>
                        <div class="notations">
                            <xsl:for-each select="//scoreProfiles/generic/categories/*">
                                <div>
                                    <xsl:variable name="categoryGrade">
                                        <xsl:call-template name="convertToGrade">
                                            <xsl:with-param name="score" select="categoryScore"/>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <div class="categoryScore {$categoryGrade}">
                                        <xsl:value-of select="$categoryGrade"/>
                                    </div>
                                    <div class="category">
                                        <xsl:value-of select="label"/>
                                    </div>
                                    <div class="criteria">
                                        <div class="table" title="Click to see details">
                                            <xsl:apply-templates select="rules/rule"/>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Gestion d'une ligne de règle -->
    <xsl:template match="rule">
        <xsl:variable name="ruleName" select="text()"/>
        <a href="#">
            <xsl:if test="/response/rules/*[name() = $ruleName]/value &gt; /response/rules/*[name() = $ruleName]/policy/isAbnormalThreshold">
                <xsl:attribute name="class">warning</xsl:attribute>
            </xsl:if>
            <div class="grade">
                <xsl:variable name="grade">
                    <xsl:call-template name="convertToGrade">
                        <xsl:with-param name="score" select="/response/rules/*[name() = $ruleName]/score"/>
                    </xsl:call-template>
                </xsl:variable>
                <div class="{$grade}">
                    <xsl:value-of select="$grade"/>
                </div>
            </div>
            <div class="label">
                <xsl:value-of select="/response/rules/*[name() = $ruleName]/policy/label"/>
            </div>
            <div class="result">
                <span>
                    <xsl:apply-templates select="/response/rules/*[name() = $ruleName]" mode="convertUnit"/>
                </span>
                <xsl:if test="/response/rules/*[name() = $ruleName]/value &gt; /response/rules/*[name() = $ruleName]/policy/isAbnormalThreshold">
                    <xsl:text> </xsl:text>
                    <span class="icon-warning"></span>
                </xsl:if>
            </div>
            <div class="info">
                <span class="icon-question"></span>
            </div>
        </a>
    </xsl:template>

</xsl:stylesheet>