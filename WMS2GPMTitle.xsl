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
    
    <xsl:template name="WMSTitle">
        <xsl:variable name="path" select="/default:WMS_Capabilities/@*[namespace-uri()='http://www.w3.org/2001/XMLSchema-instance' and local-name()='schemaLocation']"/>
        <xsl:variable name="pathB" select="substring($path,87)"></xsl:variable>
        <!--  <xsl:element name="Title"><xsl:value-of select="$pathB"/></xsl:element>-->
        <xsl:choose>
          
            <xsl:when test="contains($pathB,'TIGERweb')">
                <xsl:choose>
                    <xsl:when test="contains($pathB,'ACS')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'ACS')"/>
                        <xsl:variable name="FinalTitle" select="concat(' Census Current (',$YearFinal,') WMS ')"/>
                        <xsl:element name="Publication_Date"><xsl:value-of select="$YearFinal"/></xsl:element>
                        <xsl:element name="Title"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
                        <xsl:element name="Online_Linkage"><xsl:value-of select="$pathB"/></xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($pathB,'ECON')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'ECON')"/>
                        <xsl:element name="Publication_Date"><xsl:value-of select="$YearFinal"/></xsl:element>
                        <xsl:element name="Title">Economic Places </xsl:element>
                        <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
                        <xsl:element name="Online_Linkage"><xsl:value-of select="$pathB"/></xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($pathB,'Census2010')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'WMS_Census')"/>
                        <xsl:comment> YearFinal <xsl:value-of select="$YearFinal"/></xsl:comment>
                        <xsl:variable name="FinalTitle" select="concat('Census ',$YearFinal,' WMS ')"/>
                        <xsl:element name="Publication_Date"><xsl:value-of select="$YearFinal"/></xsl:element>
                        <xsl:element name="Title"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
                        <xsl:element name="Online_Linkage"><xsl:value-of select="$pathB"/></xsl:element>
                    </xsl:when>    
                    <xsl:when test="contains($pathB,'PhysicalFeatures')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <!--  <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment>-->
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'WMS_Census')"/>
                        <xsl:comment> YearFinal <xsl:value-of select="$YearFinal"/></xsl:comment>
                        <xsl:element name="Publication_Date">2020</xsl:element>
                        <xsl:element name="Title">Census Physical Features WMS</xsl:element>
                        <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
                        <xsl:element name="Online_Linkage"><xsl:value-of select="$pathB"/></xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:when> 
            <xsl:when test="contains($pathB,'Census2010')">
                <xsl:comment>In Census2010 BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
                <xsl:comment>pathB:<xsl:value-of select="$pathB"/></xsl:comment>
                <xsl:choose>
                    <xsl:when test="contains($pathB,'2000')">
                        <xsl:comment>in Census 2000</xsl:comment>
                        <xsl:variable name="YearA" select="substring-after($pathB,'Census2010')"/>
                        <!--  <xsl:comment>pathB <xsl:value-of select="$pathB"></xsl:value-of></xsl:comment>
                        <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                       <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment> -->
                        <xsl:variable name="FinalYear" select="substring-after($YearB,'_Census')"/>
                        <!--  <xsl:comment>Final Year<xsl:value-of select="$FinalYear"/></xsl:comment>-->
                        <xsl:element name="Publication_Date"><xsl:value-of select="$FinalYear"/></xsl:element>
                        <xsl:variable name="FinalTitle" select="concat('Census ',$FinalYear,' WMS')"/>
                        <xsl:element name="Title"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
                        <xsl:element name="Online_Linkage"><xsl:value-of select="$pathB"/></xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($pathB,'2010')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'Census2010')"/>
                        <!--  <xsl:comment>pathB <xsl:value-of select="$pathB"></xsl:value-of></xsl:comment>
                            <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment> -->
                        <xsl:variable name="FinalYear" select="substring-after($YearB,'_Census')"/>
                        <!--  <xsl:comment>Final Year<xsl:value-of select="$FinalYear"/></xsl:comment>-->
                        <xsl:element name="Publication_Date"><xsl:value-of select="$FinalYear"/></xsl:element>
                        <xsl:variable name="FinalTitle" select="concat('Census ',$FinalYear,' WMS')"/>
                        <xsl:element name="Title"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
                        <xsl:element name="Online_Linkage"><xsl:value-of select="$pathB"/></xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="YearA" select="substring-after($pathB,'Census')"/>
                        <!--  <xsl:comment>pathB <xsl:value-of select="$pathB"></xsl:value-of></xsl:comment>
                            <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment> -->
                        <xsl:variable name="FinalYear" select="substring-after($YearB,'_Census')"/>
                        <!--  <xsl:comment>Final Year<xsl:value-of select="$FinalYear"/></xsl:comment>-->
                        <xsl:element name="Publication_Date"><xsl:value-of select="$FinalYear"/></xsl:element>
                        <xsl:variable name="FinalTitle" select="concat('Census ',$FinalYear,' WMS')"/>
                        <xsl:element name="Title"><xsl:value-of select="$FinalTitle"/></xsl:element>
                        <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
                        <xsl:element name="Online_Linkage"><xsl:value-of select="$pathB"/></xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="WMSMetadataHierarchyLevelName">
        <xsl:variable name="BegPhrase">This is the TIGERWeb for all the</xsl:variable>
        <xsl:variable name="path" select="/default:WMS_Capabilities/@*[namespace-uri()='http://www.w3.org/2001/XMLSchema-instance' and local-name()='schemaLocation']"/>
        <xsl:variable name="pathB" select="substring($path,85)"></xsl:variable>
        <xsl:variable name="postTiger" select="substring-after($pathB,'TIGERweb')"/>
        <xsl:variable name="finalWMS" select="substring-before($postTiger,'MapServer')"/>
        <!--  <xsl:element name="Title"><xsl:value-of select="$pathB"/></xsl:element>-->
        <xsl:choose>
            
            <xsl:when test="contains($pathB,'TIGERweb')">
                <xsl:choose>
                    <xsl:when test="contains($pathB,'ACS')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'ACS')"/>
                        <xsl:variable name="FinalTitle" select="concat($BegPhrase,' Census Current (',$YearFinal,') WMS ')"/>
                        <xsl:element name="Metadata_Hierarchy_Level_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($pathB,'ECON')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:variable name="FinalTitle" select="concat($BegPhrase,'Economic Places')"/>
                        <xsl:element name="Metadata_Hierarchy_Level_Name"> </xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($pathB,'Census2010')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'WMS_Census')"/>
                        <xsl:comment> YearFinal <xsl:value-of select="$YearFinal"/></xsl:comment>
                        <xsl:variable name="FinalTitle" select="concat($BegPhrase,'Census ',$YearFinal,' WMS ')"/>
                        <xsl:element name="Publication_Date"><xsl:value-of select="$YearFinal"/></xsl:element>
                        <xsl:element name="Metadata_Hierarchy_Level_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                    </xsl:when>    
                    <xsl:when test="contains($pathB,'PhysicalFeatures')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <!--  <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment>-->
                        <xsl:variable name="FinalTitle" select="concat($BegPhrase,'Census Physical Features WMS')"/>
                        <xsl:element name="Metadata_Hierarchy_Level_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:when> 
            <xsl:when test="contains($pathB,'Census2010')">
                <xsl:comment>In Census2010!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
                <xsl:choose>
                    <xsl:when test="contains($pathB,'Census2000')">
                        <!--   <xsl:comment>in Census 2000</xsl:comment>--> 
                        <xsl:variable name="YearA" select="substring-after($pathB,'tigerWMS')"/>
                        <!--  <xsl:comment>pathB <xsl:value-of select="$pathB"></xsl:value-of></xsl:comment>
                            <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment> -->
                        <xsl:variable name="FinalYear" select="substring-after($YearB,'_Census')"/>
                        <!--  <xsl:comment>Final Year<xsl:value-of select="$FinalYear"/></xsl:comment>-->
                        <xsl:element name="Publication_Date"><xsl:value-of select="$FinalYear"/></xsl:element>
                        <xsl:variable name="FinalTitle" select="concat($BegPhrase,'Census ',$FinalYear,' WMS')"/>
                        <xsl:element name="Metadata_Hierarchy_Level_Name"><xsl:value-of select="$FinalTitle"/></xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
 
 <xsl:template name="WMSfileName">
     <xsl:variable name="path" select="/default:WMS_Capabilities/@*[namespace-uri()='http://www.w3.org/2001/XMLSchema-instance' and local-name()='schemaLocation']"/>
     <xsl:variable name="pathB" select="substring($path,85)"></xsl:variable>
     <xsl:variable name="postTiger" select="substring-after($pathB,'TIGERweb/')"/>
     <xsl:variable name="finalWMS" select="substring-before($postTiger,'/MapServer')"/>
     <xsl:variable name="FinalFileName" select="concat($finalWMS,'.gpm.xml')"></xsl:variable>
     <xsl:element name="Metadata_File_Identifier"><xsl:value-of select="$FinalFileName"/></xsl:element>
 </xsl:template>
    
    <xsl:template name="WMSAbstractTitle">
        <xsl:variable name="path" select="/default:WMS_Capabilities/@*[namespace-uri()='http://www.w3.org/2001/XMLSchema-instance' and local-name()='schemaLocation']"/>
        <xsl:variable name="pathB" select="substring($path,87)"></xsl:variable>
        <!--  <xsl:element name="Title"><xsl:value-of select="$pathB"/></xsl:element>-->
        <xsl:choose>
            
            <xsl:when test="contains($pathB,'TIGERweb')">
                <xsl:choose>
                    <xsl:when test="contains($pathB,'ACS')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'ACS')"/>
                        <xsl:variable name="FinalTitle" select="concat(' Census Current (',$YearFinal,') WMS ')"/>
                      
                        <xsl:value-of select="$FinalTitle"/>
                       
                    </xsl:when>
                    <xsl:when test="contains($pathB,'ECON')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'ECON')"/>
                       Economic Places
                    </xsl:when>
                    <xsl:when test="contains($pathB,'Census2010')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                       
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'WMS_Census')"/>
                        
                        <xsl:variable name="FinalTitle" select="concat('Census ',$YearFinal,' WMS ')"/>
                        <xsl:element name="Publication_Date"><xsl:value-of select="$YearFinal"/></xsl:element>
                        <xsl:value-of select="$FinalTitle"/>
                       
                    </xsl:when>    
                    <xsl:when test="contains($pathB,'PhysicalFeatures')">
                        <xsl:variable name="YearA" select="substring-after($pathB,'TIGERweb/')"/>
                        <!--  <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment>-->
                        <xsl:variable name="YearFinal" select="substring-after($YearB,'WMS_Census')"/>
                         Census Physical Features WMS
                    </xsl:when>
                </xsl:choose>
            </xsl:when> 
            <xsl:when test="contains($pathB,'Census2010')">
                <!--  <xsl:comment>In Census2010!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                <xsl:choose>
                    <xsl:when test="contains($pathB,'Census2000')">
                        <!--   <xsl:comment>in Census 2000</xsl:comment>--> 
                        <xsl:variable name="YearA" select="substring-after($pathB,'tigerWMS')"/>
                        <!--  <xsl:comment>pathB <xsl:value-of select="$pathB"></xsl:value-of></xsl:comment>
                            <xsl:comment>YearA: <xsl:value-of select="$YearA"/></xsl:comment>-->
                        <xsl:variable name="YearB" select="substring-before($YearA,'/MapServer')"/>
                        <!--  <xsl:comment>YearB: <xsl:value-of select="$YearB"/></xsl:comment> -->
                        <xsl:variable name="FinalYear" select="substring-after($YearB,'_Census')"/>
                        <!--  <xsl:comment>Final Year<xsl:value-of select="$FinalYear"/></xsl:comment>-->
                       
                        <xsl:variable name="FinalTitle" select="concat('Census ',$FinalYear,' WMS')"/>
                        <xsl:value-of select="$FinalTitle"/>
                       
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>Put Info Here!!!!!!!!!!!!!!!!!!!!!!</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>