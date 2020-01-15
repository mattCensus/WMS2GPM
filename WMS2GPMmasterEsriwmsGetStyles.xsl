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
    <xsl:import href="../WMS2GPM/WMS2GPMmasterResourceDescription.xsl"/>
    
    <!-- <xsl:element name="Operation_Parameters">
        <xsl:element name="Parameter_Name"></xsl:element>
        <xsl:element name="Parameter_Direction">out</xsl:element>
        <xsl:element name="Parameter_Description"></xsl:element>
        </xsl:element> 
        
        <xsl:element name="Connect_Point">
        <xsl:element name="CP_Link"></xsl:element>
        <xsl:element name="Protocol">HTTP/1.1</xsl:element>
        <xsl:element name="Resource_Name"></xsl:element>
        <xsl:element name="Resource_Description"></xsl:element>
        </xsl:element>
        
    -->
    
    <xsl:template name="esri_wms:GetStyles">
        <xsl:param name="OperPass"/>
        <xsl:element name="Operation_Description">
            The Open Geospatial Consortium, Inc. Off Site (OGC) Web Map Service interface standard (WMS) provides a simple HTTP interface for
            requesting geo-registered map images from our geospatial database. The response to the request is one or more geo-registered map images that can be displayed in
            a browser or WMS client application. By gaining access to our data through our WMS, users can produce maps containing TIGERweb layers combined with layers from
            other servers. The esri_wms:GetStyles operation returns user-defined styles from the WMS. It supports the following formats: 
        <xsl:for-each select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/esri_wms:GetStyles[1]/default:Format">
            <xsl:choose>
                <xsl:when test="position()&lt;2">
                    <xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>&#09;</xsl:text><xsl:text>&#09;</xsl:text><xsl:text>&#09;</xsl:text><xsl:text>&#09;</xsl:text><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each></xsl:element>
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">VERSION</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">Version as required by OGC interfaces.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">REQUEST</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">Request name. It must be set to GetStyles.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">LAYERS</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">Comma-separated list of named layers for which to retrieve style descriptions.</xsl:element>
        </xsl:element> 
    
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">SLDVER</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">The SLD version requested for the Styled Layer Descriptor (SLD) document. Only version 1.0.0 is supported.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Connect_Point">
            <xsl:element name="CP_Link"><xsl:value-of select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/esri_wms:GetStyles[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"></xsl:value-of></xsl:element>
            <xsl:element name="Protocol">HTTP/1.1</xsl:element>
            <xsl:call-template name="ResourceDescription">
                <xsl:with-param name="OperPass" select="$OperPass"/>
            </xsl:call-template>
            <xsl:element name="Resource_Description">This is the esri_wms:GetStyles URL.</xsl:element>
        </xsl:element>
    
    </xsl:template>
    
</xsl:stylesheet>