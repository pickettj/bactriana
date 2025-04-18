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
                <xsl:apply-templates mode = "chapter_title"/>
                <!-- Construct the PDF link -->
                <p>PDF version of this file:
                    <a href="{/chapter/@id}.pdf">
                        <xsl:value-of select="concat(/chapter/@id, '.pdf')"/>
                    </a>
                </p>
                               
                <xsl:apply-templates/>
                
            </body>
        </html>
    </xsl:template>

<!-- Explanation Section -->
    
    <xsl:template match="chapter" mode = "chapter_title">
        <h2>
            <xsl:value-of select="@id"/>
        </h2>
    </xsl:template>
    
    
    <xsl:template match="explanation">
        <section>
            <h3>Grammatical Explanation</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates select="node()[not(self::workflow)]"/>
        </p>
        <xsl:if test="workflow">
            <xsl:apply-templates select="workflow" mode="workflow"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template mode="workflow" match="workflow">
        <ul>
            <xsl:apply-templates select="item" mode="workflow"/>
        </ul>
    </xsl:template>
    
    <xsl:template mode="workflow" match="item">
        <li class="{@who}">
            <xsl:value-of select="@who"/>: 
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    
    <xsl:template match="explanation//em">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    

<!-- Examples Section -->
    
    <xsl:template match="examples">
        <section>
            <h3>Examples</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="ex">
        <div class="example">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ex/*[not(self::gloss)]">
        <div class="{name()}">
            <p>
                <xsl:value-of select="name()"/><xsl:text>: </xsl:text>
                <xsl:apply-templates select="node()[not(self::workflow)]"/>
            </p>
            <xsl:if test="workflow">
                <xsl:apply-templates select="workflow" mode="workflow"/>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template match="gloss">
        <div class="gloss">
            <h4>Comments:</h4>
            <div class="gloss-comments">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="gloss/div">
        <div class="gloss-item">
            <xsl:apply-templates select="node()[not(self::workflow)]"/>
            <xsl:if test="workflow">
                <xsl:apply-templates select="workflow" mode="workflow"/>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template match="examples//em">
        <span class = "gram_emph">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

<!-- Historical-Grammatical Explanation Section -->
    <xsl:template match="elaboration">
        <section>
            <h3>Historical-Grammatical Exploration</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>



<!-- References Section -->
    
    <xsl:template match="references">
        <section>
            <h3>References</h3>
            <ul>
            <xsl:apply-templates/>
            </ul>
        </section>
    </xsl:template>
    
    <xsl:template match="references/div">
            <li>
                <xsl:apply-templates/>
            </li>
    </xsl:template>
    
    
</xsl:stylesheet>