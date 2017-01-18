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

</xsl:stylesheet>