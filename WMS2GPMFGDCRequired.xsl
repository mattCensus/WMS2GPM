<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:default="http://www.opengis.net/wms"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:esri_wms="http://www.esri.com/wms"
    xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd">
    
    <xsl:template name="FGDCRequired">
        <xsl:variable name="path" select="/default:WMS_Capabilities/@*[namespace-uri()='http://www.w3.org/2001/XMLSchema-instance' and local-name()='schemaLocation']"/>
        <xsl:variable name="pathB" select="substring($path,87)"/>
        <xsl:variable name="postTiger" select="substring-after($pathB,'TIGERweb')"/>
        <xsl:variable name="finalWMS" select="substring-before($postTiger,'MapServer')"></xsl:variable>
        <xsl:element name="FGDC_Required">
            <xsl:element name="ISO_Theme">
                <xsl:element name="ISO_Keyword_Thesaurus">ISO 19115 Topic Categories</xsl:element>
               <!--  <xsl:element name="ISO_Keyword"><xsl:value-of select="$finalWMS"/></xsl:element> -->
                <xsl:choose>
                    <xsl:when test="contains($finalWMS,'ACS')">
                        <xsl:element name="ISO_Keyword">boundaries</xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($finalWMS,'ECON')">
                        <xsl:element name="ISO_Keyword">economy</xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($finalWMS,'Census')">
                        <xsl:element name="ISO_Keyword">boundaries</xsl:element>
                        <xsl:element name="ISO_Keyword">transportation</xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($finalWMS,'PhysicalFeatures')">
                        <xsl:element name="ISO_Keyword">boundaries</xsl:element>
                        <xsl:element name="ISO_Keyword">transportation</xsl:element>
                        <xsl:element name="ISO_Keyword">inlandWaters</xsl:element>
                        <xsl:element name="ISO_Keyword">structure</xsl:element>
                        <xsl:element name="ISO_Keyword">society</xsl:element>
                        <xsl:element name="ISO_Keyword">intelligenceMilitary</xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>