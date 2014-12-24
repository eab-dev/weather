<?php

$FunctionList = array();

$FunctionList['forecast'] = array(
								'name' => 'forecast',
								'call_method' => array(
														'include_file' => 'extension/weather/classes/class.Weather.php',
														'class' => 'Weather',
														'method' => 'getForecast'
													),
								'parameter_type' => 'standard',
								'parameters' => array( array( 'name' => 'location_code',
                                                             'type' => 'string',
                                                             'required' => true ),
                                                      array( 'name' => 'unit',
                                                             'type' => 'string',
                                                             'required' => true,
                                                             'default' => 'c' ) )
							);

?>
