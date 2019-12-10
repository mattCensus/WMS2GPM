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
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 5, 2019</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p>WMS2GPM/WMS2GPMIdInfo.xsl</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="idInfo">
        <xsl:element name="Identification_Information">
            <xsl:element name="Citation">
                <xsl:element name="Originator">U.S. Department of Commerce, U.S. Census Bureau, Geography Division</xsl:element>
                <xsl:element name="Publication_Date"/>
                <xsl:element name="Title"><xsl:value-of select="/default:WMS_Capabilities/default:Service/default:Title"/></xsl:element>
                <xsl:element name="Geospatial_Data_Presentation_Form">Web Mapping Service</xsl:element>
            </xsl:element>
            <xsl:element name="Description">
                <xsl:element name="Abstract">
                    TIGERweb files are designed for Viewing TIGER\Line spatial data online or streaming
                    to your mapping application.The TIGER/Line shapefiles and related database files (.dbf) are an extract of
                    selected geographic and cartographic information from the U.S. Census Bureau's
                    Master Address File / Topologically Integrated Geographic Encoding and Referencing
                    (MAF/TIGER) Database (MTDB).
                    
                    PUT SOME MORE INFO HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                </xsl:element>
                <xsl:element name="Purpose">
                    To provide a simple HTTP interface for requesting geo-registered map images
                    from our geospatial database. The response to the request is one or more
                    geo-registered map images that can be displayed in a browser or WMS client
                    application. By gaining access to our data through our WMS, users can produce maps
                    containing TIGERweb layers combined with layers from other servers. 
                </xsl:element>
            </xsl:element>
            <xsl:element name="Time_Period_of_Content">
                <xsl:element name="Calendar_Date">20190101</xsl:element>
                <xsl:element name="Currentness_Reference">ground condition</xsl:element>
            </xsl:element>
            <xsl:element name="Status">
                <xsl:element name="Progress">Completed</xsl:element>
                <xsl:element name="Maintenance_and_Update_Frequency">Annually</xsl:element>
            </xsl:element>
            <xsl:element name="Spatial_Domain">
                <xsl:element name="Bounding_Coordinates">
                    <xsl:element name="West_Bounding_Coordinate"><xsl:value-of select="/default:WMS_Capabilities/default:Capability[1]/default:Layer[1]/default:EX_GeographicBoundingBox[1]/default:westBoundLongitude[1]"/></xsl:element>
                    <xsl:element name="East_Bounding_Coordinate"><xsl:value-of select="/default:WMS_Capabilities/default:Capability[1]/default:Layer[1]/default:EX_GeographicBoundingBox[1]/default:eastBoundLongitude[1]"></xsl:value-of></xsl:element>
                    <xsl:element name="North_Bounding_Coordinate"><xsl:value-of select="/default:WMS_Capabilities/default:Capability[1]/default:Layer[1]/default:EX_GeographicBoundingBox[1]/default:northBoundLatitude[1]"></xsl:value-of></xsl:element>
                    <xsl:element name="South_Bounding_Coordinate"><xsl:value-of select="/default:WMS_Capabilities/default:Capability[1]/default:Layer[1]/default:EX_GeographicBoundingBox[1]/default:southBoundLatitude[1]"></xsl:value-of></xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="Keywords">
                <!-- <xsl:element name="Title"><xsl:value-of select="/default:WMS_Capabilities/default:Service/default:Title"/></xsl:element> -->
                <xsl:for-each select="/WMS_Capabilities/Service[1]">
                    <xsl:element name="Title"><xsl:value-of select="./default:Title"/></xsl:element>
                    <xsl:element name="width"><xsl:value-of select="./MaxWidth[1]"/></xsl:element>
                </xsl:for-each>
                
                
                
                <xsl:element name="Theme">
                    <xsl:element name="Theme_Keyword_Thesaurus">None</xsl:element>   
                    <xsl:comment>The Keywords Template</xsl:comment>
                    <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer">
                        <xsl:variable name="keyword" select="./default:Name"/>
                         <!--  <xsl:comment>keyword:<xsl:value-of select="$keyword"/></xsl:comment>-->
                        <xsl:if test="not(contains($keyword,'Labels'))">
                            <xsl:element name="Theme_Keyword"><xsl:value-of select="$keyword"/></xsl:element>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:element>
                
                <xsl:element name="Place">
                    <xsl:element name="Place_Keyword_Thesaurus">National Standard Codes (ANSI INCITS 38-2009), Federal Information Processing Series (FIPS) – States/State Equivalents</xsl:element>
                    <xsl:element name="Place_Keyword">Alabama</xsl:element>
                    <xsl:element name="Place_Keyword">Alaska</xsl:element>
                    <xsl:element name="Place_Keyword">Arizona</xsl:element>
                    <xsl:element name="Place_Keyword">Arkansas</xsl:element>
                    <xsl:element name="Place_Keyword">California</xsl:element>
                    <xsl:element name="Place_Keyword">Colorado</xsl:element>
                    <xsl:element name="Place_Keyword">Connecticut</xsl:element>
                    <xsl:element name="Place_Keyword">Delaware</xsl:element>
                    <xsl:element name="Place_Keyword">District of Columbia</xsl:element>
                    <xsl:element name="Place_Keyword">Florida</xsl:element>
                    <xsl:element name="Place_Keyword">Georgia</xsl:element>
                    <xsl:element name="Place_Keyword">Hawaii</xsl:element>
                    <xsl:element name="Place_Keyword">Idaho</xsl:element>
                    <xsl:element name="Place_Keyword">Illinois</xsl:element>
                    <xsl:element name="Place_Keyword">Indiana</xsl:element>
                    <xsl:element name="Place_Keyword">Iowa</xsl:element>
                    <xsl:element name="Place_Keyword">Kansas</xsl:element>
                    <xsl:element name="Place_Keyword">Kentucky</xsl:element>
                    <xsl:element name="Place_Keyword">Louisiana</xsl:element>
                    <xsl:element name="Place_Keyword">Maine</xsl:element>
                    <xsl:element name="Place_Keyword">Maryland</xsl:element>
                    <xsl:element name="Place_Keyword">Massachusetts</xsl:element>
                    <xsl:element name="Place_Keyword">Michigan</xsl:element>
                    <xsl:element name="Place_Keyword">Minnesota</xsl:element>
                    <xsl:element name="Place_Keyword">Mississippi</xsl:element>
                    <xsl:element name="Place_Keyword">Missouri</xsl:element>
                    <xsl:element name="Place_Keyword">Montana</xsl:element>
                    <xsl:element name="Place_Keyword">Nebraska</xsl:element>
                    <xsl:element name="Place_Keyword">Nevada</xsl:element>
                    <xsl:element name="Place_Keyword">New Hampshire</xsl:element>
                    <xsl:element name="Place_Keyword">New Jersey</xsl:element>
                    <xsl:element name="Place_Keyword">New Mexico</xsl:element>
                    <xsl:element name="Place_Keyword">New York</xsl:element>
                    <xsl:element name="Place_Keyword">North Carolina</xsl:element>
                    <xsl:element name="Place_Keyword">North Dakota</xsl:element>
                    <xsl:element name="Place_Keyword">Ohio</xsl:element>
                    <xsl:element name="Place_Keyword">Oklahoma</xsl:element>
                    <xsl:element name="Place_Keyword">Oregon</xsl:element>
                    <xsl:element name="Place_Keyword">Pennsylvania</xsl:element>
                    <xsl:element name="Place_Keyword">Rhode Island</xsl:element>
                    <xsl:element name="Place_Keyword">South Carolina</xsl:element>
                    <xsl:element name="Place_Keyword">South Dakota</xsl:element>
                    <xsl:element name="Place_Keyword">Tennessee</xsl:element>
                    <xsl:element name="Place_Keyword">Texas</xsl:element>
                    <xsl:element name="Place_Keyword">Utah</xsl:element>
                    <xsl:element name="Place_Keyword">Vermont</xsl:element>
                    <xsl:element name="Place_Keyword">Virginia</xsl:element>
                    <xsl:element name="Place_Keyword">Washington</xsl:element>
                    <xsl:element name="Place_Keyword">West Virginia</xsl:element>
                    <xsl:element name="Place_Keyword">Wisconsin</xsl:element>
                    <xsl:element name="Place_Keyword">Wyoming</xsl:element>
                </xsl:element>
                
                <xsl:element name="Place">
                    <xsl:element name="Place_Keyword_Thesaurus">ISO 3166: Codes for the representation of names of countries and their subdivisions </xsl:element>
                    <xsl:element name="Place_Keyword">U.S</xsl:element>
                    <xsl:element name="Place_Keyword">United States</xsl:element>
                    <xsl:element name="Place_Keyword">United States of America</xsl:element>
                </xsl:element>
                
                <xsl:element name="Constraints">
                    <xsl:element name="Access_Constraints">unrestricted</xsl:element>
                    <xsl:element name="Use_Constraints">trademark</xsl:element>
                    <xsl:element name="Use_Constraints">otherRestrictions</xsl:element>
                    <xsl:element name="Other_Constraints">Use Constraints: These products are free to use in a product or
                        publication, however acknowledgement must be given to the U.S. Census Bureau as the source. WMS
                        boundary files should not be used for geographic analysis including area or perimeter calculation.
                        Files should not be used for geocoding addresses. Files should not be used for determining precise
                        geographic area relationships.</xsl:element>
                </xsl:element>
                
                <xsl:element name="Point_of_Contact">
                    <xsl:element name="Contact_Organization">U.S. Department of Commerce, U.S. Census Bureau, Geography Division</xsl:element>
                    <xsl:element name="Contact_Electronic_Mail_Address">geo.geography@census.gov</xsl:element>
                </xsl:element>
                        
                
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    
</xsl:stylesheet>