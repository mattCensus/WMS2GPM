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
    
    <xsl:template name="WMSDist">
        <xsl:element name="Distribution_Information">
            
            <xsl:element name="Point_of_Contact">
                <xsl:element name="Contact_Organization">Geography Division, Spatial Products Software Branch</xsl:element>
                <xsl:element name="Contact_Electronic_Mail_Address">geo.tigerweb@census.gov</xsl:element>
            </xsl:element>
            
            <xsl:element name="Distribution_Liability">This WMS contains geographic data only and do not
                include display mapping software or statistical data. For information on how to use the
                TIGER/Line shapefile data with specific software package users shall contact the company
                that produced the software. To use this WMS in a web browser, reference the OGC specification.</xsl:element>
            
            <xsl:element name="Standard_Order_Process">
                
                <xsl:element name="Digital_Form">
                    <xsl:element name="Format_Name">WMS</xsl:element>
                    <xsl:element name="Format_Version_Number"><xsl:value-of select="/default:WMS_Capabilities/@version"/></xsl:element>
                    <xsl:element name="Network_Address">
                        <xsl:element name="Network_Resource_Name">
                            <xsl:variable name="NRN" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetCapabilities[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"/>
                            <xsl:variable name="GetCap" select="concat($NRN,'request=GetCapabilities&#38;service=WMS')"></xsl:variable>
                            <xsl:value-of select="$GetCap"/>
                        </xsl:element>
                        <xsl:element name="mimeType">text/html</xsl:element>
                        <xsl:element name="Application_Profile">http://opengis.net/spec/wms</xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="Digital_Form">
                    <xsl:element name="Format_Name">HTTPS</xsl:element>
                    <xsl:element name="Format_Version_Number">3.0</xsl:element>
                    <xsl:element name="Network_Address">
                        <xsl:element name="Network_Resource_Name">
                            <xsl:variable name="NRN" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetCapabilities[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"/>
                            <xsl:value-of select="$NRN"/>
                        </xsl:element>
                        <xsl:element name="mimeType">text/html</xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="Fees">Census Web Mapping Services may be accessed without charge.</xsl:element>
           </xsl:element> 
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>