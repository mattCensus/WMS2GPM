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
    <xsl:template name="AbstractKeywords">
        <xsl:variable name="layerOneLength" select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer[1]"/>
        <xsl:choose>
            <xsl:when test="/default:WMS_Capabilities/default:Capability[1]/default:Layer[1]/default:Layer[1]/default:Layer[1]">
                <xsl:comment>first for physical</xsl:comment> 
                <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer">
                    <xsl:variable name="keyword" select="./default:Name"/>
                    <xsl:if test="not(contains($keyword,'Labels'))">
                          <xsl:choose>
                            <xsl:when test="position() != last()">
                                <xsl:value-of select="$keyword"/>&#xA0;<xsl:text>, </xsl:text>
                            </xsl:when>
                             <xsl:otherwise>
                                 <xsl:text> and </xsl:text> <xsl:value-of select="$keyword"/> <xsl:text>.</xsl:text>
                             </xsl:otherwise>
                        
                            
                            </xsl:choose>
                       <!-- <xsl:if test="position() != last()">
                            <xsl:value-of select="$keyword"/>&#xA0;<xsl:text>, </xsl:text>
                        </xsl:if>-->
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="string-length($layerOneLength)&gt;1">
                 <!--  <xsl:comment>greater than one</xsl:comment>-->
                <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer">
                    <xsl:variable name="keyword" select="./default:Name"/>
                    <xsl:variable name="countKeyword" select="count($keyword)"/>
                    
                    <xsl:choose>
                        <xsl:when test="$countKeyword &gt; 1">
                            <xsl:if test="not(contains($keyword,'Labels'))">
                                <xsl:if test="position() != last()">
                                    <xsl:value-of select="$keyword"/>&#xA0;<xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="not(contains($keyword,'Labels'))">
                                <xsl:choose>
                                    <xsl:when test="position() != last()">
                                        <xsl:value-of select="$keyword"/>&#xA0;<xsl:text>, </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                         and <xsl:value-of select="$keyword"/>&#xA0;<xsl:text>.</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when> 
            <xsl:otherwise>
                <xsl:for-each select=" /default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer">
                    <xsl:variable name="keyword" select="./default:Name"/>
                    <xsl:if test="not(contains($keyword,'Labels'))">
                        <xsl:element name="Theme_Keyword"><xsl:value-of select="$keyword"/></xsl:element>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>