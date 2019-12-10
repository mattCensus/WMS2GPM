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
                <xd:p><xd:b>Created on:</xd:b> December 9, 2019</xd:p>
                <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
                <xd:p>WMS2GPM/WMS2GPMDataQualityInformation.xsl</xd:p>
            </xd:desc>
        </xd:doc>
    
    <!-- 
        <xsl:element name="Test_Report">
        <xsl:element name="Measure"></xsl:element>
        <xsl:element name="Evaluation"></xsl:element>
        <xsl:element name="Result"></xsl:element>
        </xsl:element>
    
    -->
        
        <xsl:template name="WMS2GPM_DQ">
            <xsl:element name="Data_Quality_Information">
                
                <xsl:element name="Atribute_Accuracy_Report">
                    <xsl:element name="Test_Report">
                        <xsl:element name="Measure">TIGER/Line Shapefile Quantitative Attribute Accuracy Test</xsl:element>
                        <xsl:element name="Evaluation">Manual and automatic examination of the Non_Quantitative attribute information</xsl:element>
                        <xsl:element name="Result">This information is not fully accurate</xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="Non_Quantitative_Attribute_Accuracy_Report">
                    <xsl:element name="Test_Report">
                        <xsl:element name="Measure">National Standard Codes, Federal Information Processing (FIPS) and the
                            Geographic Names Information System (GNIS) TIGER/Line Shapefile Test</xsl:element>
                        <xsl:element name="Evaluation">Tested against National Standard Codes, Federal Information Processing
                            (FIPS) and the Geographic Names Information System (GNIS)</xsl:element>
                        <xsl:element name="Result">100% accurate for the codes and base names.</xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="Logical_Consistency_Report">
                    <xsl:element name="Test_Report">
                        <xsl:element name="Measure"> The Census Bureau performed automated tests to ensure logical consistency
                            and limits of shapefiles.</xsl:element>
                        <xsl:element name="Evaluation">Node/geometry and topology relationships are collected or generated to
                            satisfy topological edit requirements. These requirements include: (1) Complete
                            chains must begin and end at nodes. (2) Complete chains must connect to each
                            other at nodes. (3) Complete chains do not extend through nodes. (4) Left and
                            right polygons are defined for each complete chain element and are consistent
                            throughout the extract process. (5) The chains representing the limits of the
                            files are free of gaps.</xsl:element>
                        <xsl:element name="Result">There may be some inconsistencies in feature names along features. An
                            anomaly exists with the sporadic occurrence of road segments comprising a
                            complete chain with different MAF/TIGER Feature Census Class Code (MTFCC) values
                            assigned. This problem could affect applications that use the MTFCC values for
                            network analysis, routing, or for assigning symbology to a feature when creating
                            a map.</xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="Completeness_Report">
                    <xsl:element name="Test_Report">
                        <xsl:element name="Measure">Data completeness of the TIGER/Line Shapefiles</xsl:element>
                        <xsl:element name="Result">Data completeness of the TIGER/Line Shapefiles reflects the contents of the
                            Census MAF/TIGER database at the time the TIGER/Line Shapefiles were
                            created.</xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="Horizontal_Positional_Accuracy_Report">
                    <xsl:element name="Test_Report">
                        <xsl:element name="Measure">The Census Bureau uses root mean square error (RMSE) as stated in the
                            FGDC-STD-007. 3-1998, Geospatial Positioning Accuracy Standards, Part 3:
                            National Standard for Spatial Data Accuracy.</xsl:element>
                        <xsl:element name="Evaluation">The Census Bureau uses Global Positioning System (GPS) coordinates at
                            road centerline intersections to evaluate the horizontal spatial accuracy of
                            source files that may be used to realign road features in the MAF/TIGER database
                            and test the horizontal spatial accuracy of the road features in the TIGER/Line
                            Shapefiles. The test compares a survey-grade GPS coordinate to its associated
                            road centerline intersection in the TIGER/Line Shapefiles. The test is based on
                            an independent collection of GPS coordinates for a random sample of road
                            intersections from a centerline file that meet certain criteria. The points are
                            referred to as the sample points and are gathered through a private contractor
                            working for the Census Bureau. Since the collection method uses survey-quality
                            GPS-based field techniques, the resulting control points are considered 'ground
                            truth' against which the TIGER road centerline intersection coordinates are
                            compared. The distances between the coordinates are calculated and the Census
                            Bureau determines the Circular Error 95% (CE95). That is, the accuracy of the
                            file in meters with 95% confidence. The CE95 can be calculated from the mean and
                            standard deviation by using the formula: mean of differences plus (2.65 times
                            the standard deviation). CE95 results reported for each file tested are
                            determined using a spreadsheet with embedded statistical formula. The use and
                            applicability of the spreadsheet and its embedded formula have been verified by
                            Census Bureau statisticians. The basis of the calculation is the use of the root
                            mean square error (RMSE). This is the method as stated in the U.S. Government's
                            Federal Geographic Data Committee Standard FGDC-STD-007.3-1998, Geospatial
                            Positioning Accuracy Standards. Part 3: National Standard for Spatial Data
                            Accuracy. The results of using this measure of accuracy are in compliance with
                            Federal Spatial Data requirements. In terms of the Census Bureau application,
                            the dataset coordinate values are those taken from the centerline file and the
                            coordinate values from an independent source of higher accuracy are those
                            acquired through the Census Bureau's contractor. Please note that the horizontal
                            spatial accuracy, where reported, refers only to the realigned road features
                            identified as matched to the positionally accurate source file with that
                            accuracy. It is not the spatial accuracy of the TIGER/Line Shapefile as a
                            whole.</xsl:element>
                        <xsl:element name="Result">6.5 meters for 5406</xsl:element>
                    </xsl:element>
                </xsl:element>
                
               <!--  <xsl:element name="Source_Information">
                    <xsl:element name="Citation">
                        <xsl:element name="Originator"></xsl:element>
                        <xsl:element name="Publication_Date"></xsl:element>
                        <xsl:element name="Title"></xsl:element>
                    </xsl:element>
                    <xsl:element name="Type_of_Source_Media"></xsl:element>
                    <xsl:element name="Time_Period_of_Content">
                        <xsl:element name="Range_Of_Dates">
                            <xsl:element name="Beginning_Date"></xsl:element>
                            <xsl:element name="Ending_Date"></xsl:element>
                        </xsl:element>
                        <xsl:element name="Currentness_Reference"></xsl:element>
                    </xsl:element>
                    <xsl:element name="Source_Citation_Abbreviation"></xsl:element>
                    <xsl:element name="Source_Contribution"></xsl:element>
                    </xsl:element> -->
                
                <xsl:element name="Source_Information">
                    <xsl:element name="Citation">
                        <xsl:element name="Originator">U.S. Department of Commerce, U.S. Census Bureau, Geography Division</xsl:element>
                        <xsl:element name="Publication_Date">201905</xsl:element>
                        <xsl:element name="Title">Census MAF/TIGER database</xsl:element>
                    </xsl:element>
                    <xsl:element name="Type_of_Source_Media">online</xsl:element>
                    <xsl:element name="Time_Period_of_Content">
                        <xsl:element name="Range_Of_Dates">
                            <xsl:element name="Beginning_Date">201806</xsl:element>
                            <xsl:element name="Ending_Date">201905</xsl:element>
                        </xsl:element>
                        <xsl:element name="Currentness_Reference">publication dat</xsl:element>
                    </xsl:element>
                    <xsl:element name="Source_Citation_Abbreviation">MAF/TIGER</xsl:element>
                    <xsl:element name="Source_Contribution">All line segments</xsl:element>
                </xsl:element>
                
            </xsl:element>
        </xsl:template>
        
</xsl:stylesheet>