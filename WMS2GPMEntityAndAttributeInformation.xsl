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
    
    <!--  <Feature_Catalogue_Description>
        <FC_Title>Feature Catalog for the 2016 All Roads County-based Shapefile</FC_Title>
        <Included_With_Dataset>No</Included_With_Dataset>
        <Feature_Types>All Roads</Feature_Types>
        <FC_Online_Linkage>https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TIGER2016/roads/tl_2016_roads.shp.ea.iso.xml</FC_Online_Linkage>
        </Feature_Catalogue_Description> -->
    
    <xsl:template name="EntityAttributeInformation">
        <xsl:element name="Entity_and_Attribute_Information">
            <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer">
                <xsl:variable name="keyword" select="./default:Name"/>
                <!--  <xsl:comment>keyword:<xsl:value-of select="$keyword"/></xsl:comment>-->
                <xsl:if test="not(contains($keyword,'Labels'))">
                    <xsl:element name="Feature_Catalogue_Description">
                        
                        <xsl:call-template name="knownTitles">
                            <xsl:with-param name="keywordPass" select="$keyword"/>
                        </xsl:call-template>
                        
                        <xsl:element name="Included_With_Dataset">No</xsl:element>
                        <!-- <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/</xsl:element>
                        --> 
                        <xsl:call-template name="knownURLS">
                            <xsl:with-param name="keywordPass" select="$keyword"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
            
            
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="knownTitles">
        <xsl:param name="keywordPass"/>
         
        
        
         <xsl:choose>
             <xsl:when test="contains($keywordPass,'Counties')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current County and Equivalent National Shapefile</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'States')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current State and Equivalent National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Micropolitan Statistical Areas')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA) National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Metropolitan Statistical Areas')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA) National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Metropolitan Divisions')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current Metropolitan Division National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Combined Statistical Areas')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current Combined Statistical Area (CSA) National </xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Micropolitan New England City and Town Areas')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current New England City and Town Area (NECTA) National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Metropolitan New England City and Town Areas')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current New England City and Town Area (NECTA) National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'New England City and Town Area Divisions')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current NECTA Division National </xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Combined New England City and Town Areas')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current Combined New England City and Town Area (CNECTA) National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Urban Clusters')">
                 <xsl:element name="FC_Title">Feature Catalog for the 2010 Census Urban Area National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'Census Urbanized Areas')">
                 <xsl:element name="FC_Title">Feature Catalog for the 2010 Census Urban Area National</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'State Legislative Districts - Lower')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current State Legislative District (SLD) Lower Chamber State-based</xsl:element>
             </xsl:when>
             <xsl:when test="contains($keywordPass,'State Legislative Districts - Upper')">
                 <xsl:element name="FC_Title">Feature Catalog for the Current State Legislative District (SLD) Upper Chamber State-based</xsl:element>
              </xsl:when>
             <xsl:otherwise>
                 <xsl:variable name="FCTitle" select="concat('Feature Catalog for the 2019 ', $keywordPass )"/>
                 <xsl:element name="FC_Title"><xsl:value-of select="$FCTitle"></xsl:value-of></xsl:element>
             </xsl:otherwise>
         </xsl:choose>
    </xsl:template>
    
    <xsl:template name="knownURLS">
        <xsl:param name="keywordPass"/>
        <xsl:variable name="TigerURL">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/</xsl:variable>
        <xsl:choose>
            <xsl:when test="contains($keywordPass,'Counties')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/county/tl_2019_county.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'States')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/state/tl_2019_state.ea.iso.xml</xsl:element>
            </xsl:when>   
            <xsl:when test="contains($keywordPass,'Micropolitan Statistical Areas')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/cbsa/tl_2019_cbsa.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Metropolitan Statistical Areas')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/cbsa/tl_2019_cbsa.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Metropolitan Divisions')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/metdiv/tl_2019_metdiv.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Combined Statistical Areas')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/csa/tl_2019_csa.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Micropolitan New England City and Town Areas')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/necta/tl_2019_necta.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Metropolitan New England City and Town Areas')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/necta/tl_2019_necta.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'New England City and Town Area Divisions')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/nectadiv/tl_2019_nectadiv.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Combined New England City and Town Areas')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/cnecta/tl_2019_cnecta.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Urban Clusters')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/uac10/tl_2019_uac10.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'Census Urbanized Areas')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/uac10/tl_2019_uac10.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'State Legislative Districts - Lower')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/sldl/tl_2019_sldl.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:when test="contains($keywordPass,'State Legislative Districts - Upper')">
                <xsl:element name="FC_Online_Linkage">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/Tiger2019/sldu/tl_2019_sldu.ea.iso.xml</xsl:element>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:element name="FC_Online_Linkage"><xsl:value-of select="$TigerURL"/></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
           
    </xsl:template>
    
</xsl:stylesheet>