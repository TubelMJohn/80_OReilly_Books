<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
>

<xsl:template name="bookpage">
  <file name="index.html">
    <label>
      <xsl:call-template name="label"/>
    </label>
  <html>
    <xsl:value-of select="$newline"/>
    <head>
      <xsl:value-of select="$newline"/>
      <title>
        <xsl:value-of select="/book/title"/>
      </title>
      <xsl:value-of select="$newline"/>
      <link rel="stylesheet" type="text/css" href="../style/style1.css"/>
      <xsl:value-of select="$newline"/>


      <!-- ======================================================= -->
      <!-- METADATA -->

      <meta name="DC.Creator">
        <xsl:attribute name="content">
           <xsl:call-template name="authors"/>
        </xsl:attribute>
      </meta>
      <xsl:value-of select="$newline"/>
      <meta name="DC.Format" content="text/xml" scheme="MIME"/>
      <xsl:value-of select="$newline"/>
      <meta name="DC.Language" content="en-US"/>
      <xsl:value-of select="$newline"/>
      <meta name="DC.Publisher" content="O'Reilly &amp; Associates, Inc."/>
      <xsl:value-of select="$newline"/>
      <meta name="DC.Source" scheme="ISBN">
        <xsl:attribute name="content">
           <xsl:value-of select="/book/bookinfo/isbn"/>
        </xsl:attribute>
      </meta>
      <xsl:value-of select="$newline"/>
      <meta name="DC.Subject.Keyword">
        <xsl:attribute name="content">
           <xsl:text>stuff</xsl:text>
        </xsl:attribute>
      </meta>
      <xsl:value-of select="$newline"/>
      <meta name="DC.Title">
        <xsl:attribute name="content">
           <xsl:value-of select="/book/title"/>
        </xsl:attribute>
      </meta>
      <xsl:value-of select="$newline"/>
      <meta name="DC.Type" content="Text.Monograph"/>
      <xsl:value-of select="$newline"/>
    </head>
    <xsl:value-of select="$newline"/>
    <body bgcolor="#ffffff">
      <xsl:value-of select="$newline"/>
      <img src="gifs/banner.gif"/>
      <xsl:value-of select="$newline"/>


      <!-- ======================================================= -->
      <!-- BOOK INFO PARAGRAPH -->

      <p class="bookinfo">
        <font size="-1">
          <xsl:text>by </xsl:text>
          <xsl:call-template name="authors"/>
          <br/>
          <xsl:text>ISBN </xsl:text>
          <xsl:value-of select="/book/bookinfo/isbn"/>
          <br/>
          <xsl:value-of select="/book/bookinfo/edition"/>
          <xsl:text>, published </xsl:text>
          <xsl:value-of select="/book/bookinfo/pubdate"/>
          <xsl:text>.</xsl:text>
          <br/>
          <xsl:text>(See the </xsl:text>
          <a>
            <xsl:attribute name="href">
              <xsl:text>http://www.oreilly.com/catalog/</xsl:text>
              <xsl:call-template name="nickname"/>
            </xsl:attribute>
            <xsl:text>catalog page</xsl:text> 
          </a>
          <xsl:text>for this book.)</xsl:text>
        </font>
      </p>
      <xsl:value-of select="$newline"/>


      <!-- ======================================================= -->
      <!-- SEARCH PARAGRAPH -->

      <p>
        <a href="jobjects/fsearch.htm">Search</a> 
        <xsl:text> the text of </xsl:text>
        <i>
          <xsl:value-of select="/book/title"/>
        </i>
        <xsl:text>.</xsl:text>
      </p>
      <xsl:value-of select="$newline"/>


      <!-- ======================================================= -->
      <!-- TOC -->

      <h3 class="tochead">Table of Contents</h3>
      <xsl:value-of select="$newline"/>
      <xsl:call-template name="toc"/>
      <xsl:value-of select="$newline"/>


      <!-- ======================================================= -->
      <!-- LIBRARY NAV BAR -->

      <xsl:value-of select="$newline"/>
      <hr width="684" align="left" />
      <xsl:value-of select="$newline"/>
      <img src="../gifs/navbar.gif" usemap="#library-map" border="0"
           alt="Library Navigation Links" />
      <xsl:value-of select="$newline"/>


      <!-- ======================================================= -->
      <!-- COPYRIGHT INFO -->

      <p>
        <font size="-1">
          <a href="copyrght.htm">
            <xsl:text>Copyright $$ENTITY-START$$copy; 2002</xsl:text>
          </a>
          <xsl:text> O'Reilly &amp; Associates. All rights reserved.</xsl:text>
        </font>
      </p>
      <xsl:value-of select="$newline"/>


      <!-- ======================================================= -->
      <!-- NAV BAR IMAGE MAP DEFINITIONS -->




<!-- placeholders for mapfiles, this has 7 titles, not 6 --> 
      <map name="library-map"> 
<!-- for example <area shape="rect" coords="1,0,84,90" href="../dns/index.htm" /> -->
**REPLACE WITH MAPFILE**
 </map>
    </body>
  </html>
  </file>


  <!-- ======================================================= -->
  <!-- PROCESS REST OF BOOK -->

  <xsl:apply-templates select="appendix 
                             | chapter
                             | preface
                             | bibliography
                             | glossary
                             | copyrightpg
                             | colophon
                             | part"/>

</xsl:template>
</xsl:stylesheet>
