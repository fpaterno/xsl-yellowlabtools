<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersDOMaccessesOnScroll">
        
        <div class="offenders">
            <div class="offendersHtml">
                <div>
                    <p>The table below shows the interactions between the JavaScript and the DOM on a scroll event.</p>
                    <div class="table">
                        <div class="headers">
                            <div></div>
                            <div>Type</div>
                            <div>Params</div>
                            <div></div>
                        </div>
                        <xsl:for-each select="offendersObj/children/child">
                            <div>
                                <xsl:if test="windowPerformance/text() = 'true'">
                                    <xsl:attribute name="class">windowPerformance</xsl:attribute>
                                </xsl:if>
                                <div class="index">
                                    <xsl:value-of select="position()" />
                                </div>
                                <div class="type">
                                    <xsl:value-of select="data/type" />
                                    <xsl:if test="children">
                                        <div class="children">
                                            <xsl:apply-templates select="children" />
                                        </div>
                                    </xsl:if>
                                </div>
                                <div class="value">
                                    <xsl:apply-templates select="data" mode="params" />
                                </div>
                                <div class="details"></div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <!-- Gestion des sous-éléments de la colonne "type" -->
    <xsl:template match="children">
        <xsl:for-each select="child">
            <div class="child">
                <span>
                    <xsl:value-of select="data/type" />
                    <div class="childArgs">
                        <xsl:choose>
                            <xsl:when test="not(data/callDetails/context)">
                                <xsl:if test="not(data/callDetails/arguments/argument/type)">
                                    <b>
                                        <xsl:value-of select="data/callDetails/arguments/argument" />
                                    </b>
                                </xsl:if>
                                <xsl:if test="data/callDetails/arguments/argument/type = 'domElement'">
                                    DOM element <b>
                                        <xsl:value-of select="data/callDetails/arguments/argument/element" />
                                    </b>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="data/callDetails/context/elements/element/type = 'domElement'">
                                        DOM element <b>
                                            <xsl:value-of select="data/callDetails/context/elements/element/element" />
                                        </b>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <b>
                                            <xsl:value-of select="data/callDetails/arguments/argument" />
                                        </b> on
                                        <xsl:value-of select="data/callDetails/context/elements/element/type" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                    </div>
                </span>
                <xsl:apply-templates select="children" />
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- Gestion de la colonne "params" -->
    <xsl:template match="data" mode="params">
        <xsl:choose>
            <xsl:when test="type = 'documentScroll' or type = 'windowScroll'">
                (triggering the scroll event on 
                <b>
                    <xsl:value-of select="substring-before(type, 'Scroll')" />
                </b>)
            </xsl:when>
            <xsl:when test="callDetails/context/elements/element/type = 'window'">
                get from 
                <div class="offenderButton">
                    <xsl:value-of select="callDetails/context/elements/element/type" />
                </div>
            </xsl:when>
            <xsl:when test="callDetails/context/elements/element/type = 'document'">
                <b>
                    <xsl:value-of select="callDetails/arguments/argument" />
                </b>
            </xsl:when>
            <xsl:when test="not(callDetails/context)">
                <b>
                    <xsl:value-of select="callDetails/arguments/argument" />
                </b>
            </xsl:when>
            <xsl:when test="callDetails/context/elements/element/type = 'domElement'">
                <xsl:if test="callDetails/arguments/argument">
                    <b>
                        <xsl:value-of select="callDetails/arguments/argument" />
                    </b>
                    on 
                </xsl:if>
                <div class="offenderButton opens">
                    DOM element
                    <b>
                        <xsl:value-of select="callDetails/context/elements/element/element" />
                    </b>
                    <div class="domTree">
                        <xsl:call-template name="treeNode">
                            <xsl:with-param name="node" select="callDetails/context/elements/element/tree" />
                        </xsl:call-template>
                    </div>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>