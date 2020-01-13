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
    
    <xsl:template name="rangeOfDates">
        <xsl:variable name="path" select="/default:WMS_Capabilities/@*[namespace-uri()='http://www.w3.org/2001/XMLSchema-instance' and local-name()='schemaLocation']"/>
        <xsl:variable name="pathB" select="substring($path,112)"></xsl:variable>
        <!--  <xsl:element name="Title"><xsl:value-of select="$pathB"/></xsl:element>-->
      <!--   <xsl:comment>pathB <xsl:value-of select="$pathB"/></xsl:comment> -->
        <xsl:choose>
            
                            
                    <xsl:when test="contains($pathB,'TIGERweb')">
                        <xsl:choose>  
                            <xsl:when test="contains($pathB,'PhysicalFeatures')">
                                <xsl:element name="Calendar_Date">20190101 </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($pathB,'ECON')">
                                <xsl:comment>In ACS</xsl:comment>
                                <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                                <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                                <xsl:variable name="yearFinal" select="substring-after($YearB,'ECON')"/>
                                <xsl:variable name="yearFinalA" select="concat($yearFinal,'0101')"/>
                                <xsl:element name="Calendar_Date"><xsl:value-of select="$yearFinalA"/> </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($pathB,'Census2010')">
                                <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                                <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                                <xsl:variable name="yearFinal" select="substring-after($YearB,'Census')"/>
                                <xsl:variable name="yearFinalA" select="concat($yearFinal,'0101')"/>
                                <xsl:element name="Calendar_Date"><xsl:value-of select="$yearFinalA"/> </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($pathB,'ACS')"> 
                                <xsl:comment>In ACS</xsl:comment>
                                <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                                <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                                <xsl:variable name="yearFinal" select="substring-after($YearB,'ACS')"/>
                                <xsl:variable name="yearFinalA" select="concat($yearFinal,'0101')"/>
                                <xsl:element name="Calendar_Date"><xsl:value-of select="$yearFinalA"/> </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:comment>In the TIGERWeb otherwise</xsl:comment>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="contains($pathB,'Census2010')">
                       <!--    <xsl:comment>
                             n Census2010!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                        <xsl:choose>
                            <xsl:when test="contains($pathB,'PhysicalFeatures')">
                                <xsl:element name="Calendar_Date">20100101 </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($pathB,'Census2000')">
                                <!-- <xsl:comment>In the decennial</xsl:comment> -->
                                <xsl:variable name="YearA" select="substring-after($pathB,'services/')"/>
                                <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer/')"/>
                                
                             <!--    <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>
                                <xsl:comment>YearB: <xsl:value-of select="$YearB"/> </xsl:comment>--> 
                                <xsl:variable name="yearFinal" select="substring-after($YearB,'/tigerWMS_Census')"/>
                                <xsl:variable name="yearFinalA" select="concat($yearFinal,'0101')"/>
                                <xsl:element name="Calendar_Date"><xsl:value-of select="$yearFinalA"/> </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($pathB,'Census2010')">
                                <!-- <xsl:comment>In the decennial</xsl:comment> -->
                                <xsl:variable name="YearA" select="substring-after($pathB,'services/')"/>
                                <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer/')"/>
                                
                                <!--    <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>
                                <xsl:comment>YearB: <xsl:value-of select="$YearB"/> </xsl:comment>--> 
                                <xsl:variable name="yearFinal" select="substring-after($YearB,'/tigerWMS_Census')"/>
                                <xsl:variable name="yearFinalA" select="concat($yearFinal,'0101')"/>
                                <xsl:element name="Calendar_Date"><xsl:value-of select="$yearFinalA"/> </xsl:element>
                            </xsl:when>
                        </xsl:choose>
                        
                    </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>