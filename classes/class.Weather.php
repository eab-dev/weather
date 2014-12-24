<?php

class Weather
{

    function getForecast( $locationCode, $unit )
    {
        $source = file_get_contents( 'http://weather.yahooapis.com/forecastrss?w=' . $locationCode . '&u=' . $unit );

        if ( !$source )
            return false;

        $xml = new eZXML();
        $dom =& $xml->domTree( $source );
        $root =& $dom->root();
        $forecastCount = 0;

        $data = array();

        foreach ( $root->Children[0]->children() as $item )
        {
            if ( $item->attributeCount() > 0 )
            {
                foreach ( $item->Attributes as $attribute )
                {
                    $data[$item->Name][$attribute->Name] = $attribute->content();
                }
            }
            if ( $item->Name == 'item' )
            {
                foreach ( $item->children() as $subitem )
                {
                    if ( $subitem->Name == 'description' )
                    {
                        $data[$subitem->Name] = $subitem->Children[0]->content();

                        if ( preg_match( "/\<img [^>]*\/\>/", $subitem->Children[0]->content(), $matches ) )
                            $data['image'] = $matches[0];
                    }

                    if ( $subitem->Name == 'forecast' )
                    {
                        $forecastCount++;
                        if ( $subitem->attributeCount() > 0 )
                        {
                            foreach ( $subitem->Attributes as $attribute)
                            {
                                $data[$subitem->Name][$forecastCount][$attribute->Name] = $attribute->content();
                            }
                        }
                    }
                    else
                    {
                        if ( $subitem->attributeCount() > 0 )
                        {
                            foreach ( $subitem->Attributes as $attribute )
                            {
                                $data[$subitem->Name][$attribute->Name] = $attribute->content();
                            }
                        }
                    }
                }
            }
        }

        return array( 'result' => $data );
    }
}

?>
