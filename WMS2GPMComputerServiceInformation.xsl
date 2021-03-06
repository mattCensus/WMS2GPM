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
    <xsl:import href="../WMS2GPM/WMS2GPMGetCapabilities.xsl"/>
    <xsl:import href="../WMS2GPM/WMS2GPMmasterGetMap.xsl"/>
    <xsl:import href="../WMS2GPM/WMS2GPMmasterGetFeatureInfo.xsl"/>
    <xsl:import href="../WMS2GPM/WMS2GPMmasterEsriwmsGetStyles.xsl"/>
    <xsl:template name="Computer_Service_Information">
        <xsl:element name="Computer_Service_Information">
            <xsl:element name="Service_Type">urn:ogc:serviceType:WebMapService</xsl:element>
            <xsl:element name="Service_Type_Version"><xsl:value-of select="/default:WMS_Capabilities/@version"/></xsl:element>
            <xsl:element name="Coupling_Type">mixed</xsl:element>
                <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Request/*">
                    <!-- <xsl:variable name="des" select="/descendant::*"></xsl:variable>
                    <xsl:element name="Descendent"><xsl:value-of select="$des"/></xsl:element> -->
                    <xsl:variable name="currNode" select="."></xsl:variable>
                    
                            <xsl:element name="Contains_Operations">
                                <xsl:element name="Operation_Name"><xsl:value-of select="name(.)"/></xsl:element> 
                                <xsl:element name="DCP">WebServices</xsl:element>
                                <xsl:choose>
                                    <xsl:when test="contains(name(.),'GetCapabilities')">
                                        <xsl:call-template name="GetCapabilities">
                                            <xsl:with-param name="OperPass" select="name(.)"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="contains(name(.),'GetMap')">
                                        <xsl:call-template name="GetMap">
                                            <xsl:with-param name="OperPass" select="name(.)"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="contains(name(.),'GetFeatureInfo')">
                                        <xsl:call-template name="GetFeatureInfo">
                                            <xsl:with-param name="OperPass" select="name(.)"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="contains(name(.),'esri_wms:GetStyles')">
                                        <xsl:call-template name="esri_wms:GetStyles">
                                            <xsl:with-param name="OperPass" select="name(.)"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                                
                            </xsl:element>
                </xsl:for-each>
            
        </xsl:element>
    </xsl:template>
    
    
</xsl:stylesheet>