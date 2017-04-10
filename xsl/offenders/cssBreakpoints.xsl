<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response/rules/*" mode="offendersCssBreakpoints">
        <xsl:variable name="offenderName" select="name()" />
        <div class="offenders">
            <h3>Breakpoints list</h3>
            <div class="offendersTable">
                <xsl:for-each select="offendersObj/offendersObj">
                    <div>
                        <div>
                            Breakpoint 
                            <b><xsl:value-of select="breakpoint" /></b>
                            involves
                            <xsl:call-template name="grammaticalNumber">
                                <xsl:with-param name="term" select="'rule'" />
                                <xsl:with-param name="nb" select="count"/>
                            </xsl:call-template>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
