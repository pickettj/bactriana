<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>


<!-- Base HTML Structure -->
    <xsl:template match="/">
        <html>
            <head>
                <title>The Sandbox</title>
                <link rel="stylesheet" href="./bukhari_textbook.css"/>
            </head>
            <body>
                <h1>Bukhari Chancery Persian Textbook Development</h1>
                
                <xsl:apply-templates/>
                
            </body>
        </html>
    </xsl:template>

<!-- Explanation Section -->
    <xsl:template match="explanation">
        <section>
            <h3>Grammatical Explanation</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    

<!-- Examples Section -->
    
    <xsl:template match="examples">
        <section>
            <h3>Examples</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="ex">
        <div class = "exsec">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ex/*[not(self::gloss)]">
        <div class = "{name()}">
            <p>
                <xsl:value-of select="name()"/><xsl:text>: </xsl:text>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="gloss">
        <div class = "gloss">
            Comments:
            <ul>
                <xsl:apply-templates/>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template match="div">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="em">
        <span class = "gram_emph">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

<!-- References Section -->
    
    <xsl:template match="references">
        <section>
            <h3>References</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    
</xsl:stylesheet>