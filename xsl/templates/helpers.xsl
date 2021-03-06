<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Conversion d'un score en grade -->
    <xsl:template name="convertToGrade">
        <xsl:param name="score" />
        <xsl:choose>
            <xsl:when test="$score &gt; 80">A</xsl:when>
            <xsl:when test="$score &gt; 60">B</xsl:when>
            <xsl:when test="$score &gt; 40">C</xsl:when>
            <xsl:when test="$score &gt; 20">D</xsl:when>
            <xsl:when test="$score &gt; 0">E</xsl:when>
            <xsl:otherwise>F</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Affichage des unités -->
    <xsl:template name="convertUnit">
        <xsl:param name="value" />
        <xsl:param name="unit" />
        <xsl:choose>
            <xsl:when test="$unit = 'bytes'">
                <xsl:choose>
                    <xsl:when test="$value &gt; 1000000">
                        <xsl:value-of select="format-number($value div 1000000, '#.##')" />
                        <xsl:text> Mb</xsl:text>
                    </xsl:when>
                    <xsl:when test="$value &gt; 1000">
                        <xsl:value-of select="format-number($value div 1000, '#.#')" />
                        <xsl:text> kb</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$value" />
                        <xsl:text> bytes</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$value" /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Césure de chaînes -->
    <xsl:template name="minimizeString">
        <xsl:param name="value" />
        <xsl:param name="size" select="40" />
        <xsl:choose>
            <xsl:when test="string-length($value) &gt; ($size*2)+3">
                <xsl:value-of select="substring($value, 0, $size)" />
                <xsl:text>...</xsl:text>
                <xsl:value-of select="substring($value, string-length($value) - $size)" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$value" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Gestion pluriel/singulier -->
    <xsl:template name="grammaticalNumber">
        <xsl:param name="term" />
        <xsl:param name="pluralTerm" select="concat($term, 's')" />
        <xsl:param name="nb" />

        <xsl:choose>
            <xsl:when test="$nb = 0">
                No <xsl:value-of select="$pluralTerm" />
            </xsl:when>
            <xsl:when test="$nb &lt; 2">
                <xsl:value-of select="concat($nb, ' ', $term)" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($nb, ' ', $pluralTerm)" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Gestion des noeuds "tree" -->
    <xsl:template name="treeNode">
        <xsl:param name="node"/>
        <xsl:for-each select="$node/*">
            <div>
                <span>
                    <xsl:value-of select="name(.)" />
                    <xsl:if test="normalize-space(text()) and text() &gt; 1">
                        <span> (x<xsl:value-of select="text()" />)</span>
                    </xsl:if>
                </span>
                <xsl:call-template name="treeNode">
                    <xsl:with-param name="node" select="." />
                </xsl:call-template>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- Gestion des noeuds de règles CSS -->
    <xsl:template name="cssFileAndLine">
        <xsl:param name="node"/>
        <div class="offenderButton opens">
            css file
            <div class="cssFileAndLine">
                <xsl:if test="$node/file">
                    <a href="{$node/file}" target="_blank" title="{$node/file}">
                        <xsl:call-template name="minimizeString">
                            <xsl:with-param name="value" select="$node/file" />
                            <xsl:with-param name="size" select="30" />
                        </xsl:call-template>
                    </a>
                </xsl:if>
                <xsl:if test="normalize-space($node/file/text()) = ''">
                    &lt;inline CSS&gt;
                </xsl:if>
                <xsl:value-of select="concat(' @ ', $node/line, ':', $node/column)" />
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>