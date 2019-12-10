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
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
     <xsl:import href="../WMS2GPM/WMS2GPMIdInfo.xsl"/>
    <xsl:import href="../WMS2GPM/WMS2GPMDataQualityInformation.xsl"/>
    <xsl:import href="../WMS2GPM/WMS2GPMSpatial_Data_Organization_Information.xsl"/>
    <xsl:import href="../WMS2GPM/WMS2GPMSpatial_Reference_Information.xsl"/>
    <xsl:import href="../WMS2GPM/WMS2GPMEntityAndAttributeInformation.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 5, 2019</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <!--              file:/H:/MetadataSchemas/xslts/WMS2GPM/WMS2GPMmaster.xsl -->
   
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 4, 2019</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/gpm2IsoMaster.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 3, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:text>&#10;</xsl:text>
        <xsl:element name="GPM">
            <xsl:attribute name="xsi:schemaLocation">http://www.isotc211.org/2005/gmi http://www.ngdc.noaa.gov/metadata/published/xsd/schema.xsd</xsl:attribute>
            <xsl:element name="FGDC_Required">
                <xsl:element name="ISO_Keyword_Thesaurus">ISO 19115 Topic Categories</xsl:element>
                <xsl:element name="ISO_Keyword"/>
            </xsl:element>
            <xsl:call-template name="idInfo"/>
            <xsl:call-template name="WMS2GPM_DQ"/>
            <xsl:call-template name="Spatial_Data_Organization_Information"/>
            <xsl:call-template name="SpatialReferenceInformation"/>
            <xsl:call-template name="EntityAttributeInformation"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
