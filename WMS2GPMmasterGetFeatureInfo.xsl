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
    <xsl:template name="GetFeatureInfo">
        <xsl:param name="OperPass"/>
        <xsl:element name="Operation_Description">
            The Open Geospatial Consortium, Inc. Off Site (OGC) Web Map Service interface standard (WMS) provides a simple HTTP interface for
            requesting geo-registered map images from our geospatial database. The response to the request is one or more geo-registered map images that can be displayed in
            a browser or WMS client application. By gaining access to our data through our WMS, users can produce maps containing TIGERweb layers combined with layers from
            other servers.
            
            The GetFeatureInfo operation provides clients of a WMS with more information about features in the pictures of maps that were returned by previous
            Map requests. It is only supported for those Layers for which the attribute queryable="1" (true) has been defined or inherited. It is available in the
            following formats:
            <xsl:for-each select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetFeatureInfo[1]/default:Format">
                <xsl:choose>
                    <xsl:when test="position()&lt;2">
                        <xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>&#09;</xsl:text><xsl:text>&#09;</xsl:text><xsl:text>&#09;</xsl:text><xsl:text>&#09;</xsl:text><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            
        </xsl:element>
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">version</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">request version.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">request</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">request name</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">map request part</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">Partial copy of the Map request parameters that generated the map for which information is desired.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">QUERY_LAYERS</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">Comma-separated list of one or more layers to be queried.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">INFO_FORMAT</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">Return format of feature information (MIME type).</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">FEATURE_COUNT</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">Number of features about which to return information (default=1).</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">I</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">i coordinate in pixels of feature in Map CS.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">J</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">j coordinate in pixels of feature in Map CS.</xsl:element>
        </xsl:element> 
        
        <xsl:element name="Operation_Parameters">
            <xsl:element name="Parameter_Name">EXCEPTIONS</xsl:element>
            <xsl:element name="Parameter_Direction">out</xsl:element>
            <xsl:element name="Parameter_Description">The format in which exceptions are to be reported by the WMS (default= XML).</xsl:element>
        </xsl:element>
        
        <xsl:element name="Connect_Point">
            <xsl:variable name="baseURL" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetFeatureInfo[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"></xsl:variable>
            <xsl:variable name="version" select="/default:WMS_Capabilities/@version"/>
            <xsl:variable name="GetCapUrl" select="concat($baseURL,'service=wms&amp;',$version,'&amp;request=',$OperPass)"/>
            <xsl:element name="CP_Link"><xsl:value-of select="$GetCapUrl"/></xsl:element>
            <xsl:element name="Protocol">HTTP/1.1</xsl:element>
            <xsl:call-template name="ResourceDescription">
                <xsl:with-param name="OperPass" select="$OperPass"/>
            </xsl:call-template>
            <xsl:element name="Resource_Description">This is the GetFeatureInfo URL.</xsl:element>
        </xsl:element>
        
    </xsl:template>
</xsl:stylesheet>