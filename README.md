weather
=======

eZ Publish 3 weather tool by Łukasz Serwatka.
French translation and eZ Publish 4 update by [Andy Caiger](http://eab.uk/ac)
Original at http://projects.ez.no/weather

##Summary

Fetch function for eZ Publish which gives possibility to fetch weather
information from weather.yahoo.com base on XML content. It takes 2
parameters, `location_code` which you can check on weather.yahoo.com
pages for your region (part of URL) and `unit` which is f or c
(temperature unit).

##Requirements

This version requires eZ Publish 4 or eZ Publish 5 Legacy Edition.
The [original version](http://projects.ez.no/weather) requires eZ Publish 3.

##Install

1. Put weather extension in to your eZ publish extension directory.
2. Enable extension in Admin interface. Setup->Extensions
3. If you want to create and embed content objects of class `weather`, install the supplied package:

        php ./ezpm.php import extension/weather/packages/weather.ezpkg
        php ./ezpm.php install weather

##Example template code:

Weather tool you can add using administration interface Design -> Toolbar management

Or you can create and embed content objects of class `weather` in an XML attribute.
The template `extension/weather/design/standard/override/templates/embed/weather.tpl`
will be used to render the object.
