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
    
    <xsl:template name="ResourceDescription">
        <xsl:param name="OperPass"/>
        <xsl:variable name="path" select="/default:WMS_Capabilities/@*[namespace-uri()='http://www.w3.org/2001/XMLSchema-instance' and local-name()='schemaLocation']"/>
        <xsl:variable name="pathB" select="substring($path,85)"></xsl:variable>
        <!--  <xsl:element name="Title"><xsl:value-of select="$pathB"/></xsl:element>-->
       <!--  <xsl:comment>In the Resource Description Template</xsl:comment>--> 
        <xsl:choose>
          
            <xsl:when test="contains($pathB,'TIGERweb')">
                <xsl:choose>
                    <xsl:when test="contains($pathB,'ACS')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'ACS')"/>
                        <xsl:variable name="FinalTitle" select="concat(' Census Current (',$YearFinal,') WMS ', $OperPass)"/>
                        <xsl:element name="Resource_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <xsl:comment><xsl:value-of select="$OperPass"/></xsl:comment>
                        <!--  <xsl:comment>Exiting the Resource Description Template A</xsl:comment>-->
                    </xsl:when>
                    <xsl:when test="contains($pathB,'ECON')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                         <xsl:variable name="FinalTitle" select="concat('Economic Places ',$OperPass)"></xsl:variable>  
                        <xsl:element name="Resource_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <!--  <xsl:comment>Exiting the Resource Description Template B</xsl:comment>-->
                    </xsl:when>
                    <xsl:when test="contains($pathB,'Census2010')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                      <!--    <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                       <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment>--> 
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'WMS_Census')"/>
                      <!--   <xsl:comment> YearFinal <xsl:value-of select="$YearFinal"/></xsl:comment> -->
                        <xsl:variable name="FinalTitle" select="concat('Census ',$YearFinal,' WMS ', $OperPass)"/>
                        <xsl:element name="Resource_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <!--  <xsl:comment>Exiting the Resource Description Template C</xsl:comment>-->
                    </xsl:when>    
                    <xsl:when test="contains($pathB,'PhysicalFeatures')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <!--  <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment>-->
                        <xsl:variable name="FinalTitle" select="concat('Census Physical Features WMS ', $OperPass)"/>
                        <xsl:element name="Resource_Name"></xsl:element>
                        <!--  <xsl:comment>Exiting the Resource Description Template D</xsl:comment>-->
                    </xsl:when>
                </xsl:choose>
            </xsl:when> 
            <xsl:when test="contains($pathB,'Census2010')">
                <!--  <xsl:comment>In Census2010!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                <xsl:choose>
                      <xsl:when test="contains($pathB,'Census2010')">
                       <!--  <xsl:comment>in Census 2000</xsl:comment>  -->
                        <xsl:variable name="YearA" select="substring-after($pathB,'tigerWMS')"/>
                        <!--  <xsl:comment>pathB <xsl:value-of select="$pathB"></xsl:value-of></xsl:comment>
                            <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment> -->
                        <xsl:variable name="FinalYear" select="substring-after($YearB,'_Census')"/>
                        <!--  <xsl:comment>Final Year<xsl:value-of select="$FinalYear"/></xsl:comment>-->
                      
                        <xsl:variable name="FinalTitle" select="concat('Census ',$FinalYear,' WMS ', $OperPass)"/>
                        <xsl:element name="Resource_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        
                       <!--   <xsl:comment>Exiting the Resource Description Template E</xsl:comment>-->
                    </xsl:when>
                    <xsl:when test="contains($pathB,'Census2000')">
                        <!--  <xsl:comment>in Census 2000</xsl:comment>-->
                        <xsl:variable name="YearA" select="substring-after($pathB,'tigerWMS')"/>
                        <!--  <xsl:comment>pathB <xsl:value-of select="$pathB"></xsl:value-of></xsl:comment>
                            <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment> -->
                        <xsl:variable name="FinalYear" select="substring-after($YearB,'_Census')"/>
                        <!--  <xsl:comment>Final Year<xsl:value-of select="$FinalYear"/></xsl:comment>-->
                       
                        <xsl:variable name="FinalTitle" select="concat('Census ',$FinalYear,' WMS', $OperPass)"/>
                        <xsl:element name="Resource_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        
                        <!--  <xsl:comment>Exiting the Resource Description Template F</xsl:comment>-->
                    </xsl:when>
                  
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>