{set-block scope=global variable=cache_ttl}0{/set-block}

{cache-block keys=array( $object.id ) expiry=$object.data_map.caching_duration.data_int}

{def
	$location_code =  $object.data_map.location_code.content
	$unit = 'c'
	$weather = fetch( 'weather', 'forecast', hash( 'location_code', $location_code, 'unit', $unit) )
}

<div class="frontpage-weather">
<h2>{$object.name|wash}</h2>

	<div class="weather-image">{$weather.image|insert(4, concat(" alt=\"", $weather.condition.text|i18n('design/weather'), "\""))}</div>
	<div class="weather-summary">
		<p>{$weather.condition.text|i18n('design/weather')}, {$weather.condition.temp}&deg;{$weather.units.temperature}</p>
		<p><b>{$weather.forecast.2.date|strtotime|datetime( 'custom', '%l' )}:</b> {$weather.forecast.2.text|i18n('design/weather')}, {$weather.forecast.2.low}&ndash;{$weather.forecast.2.high}&deg;{$weather.units.temperature}</p>
	</div>
</div>

{/cache-block}

{if or( $object.can_edit, $object.can_remove)}
<div class="controls">
	<form action={"/content/action"|ezurl} method="post">
		{if $object.can_edit}
		<input type="image" name="EditButton" src={"edit.gif"|ezimage} alt="Edit" title="Edit this weather box" />
		<input type="hidden" name="RedirectURIAfterPublish" value="{$node.parent.url}" />
		<input type="hidden" name="RedirectIfDiscarded" value="{$node.parent.url}" />
		<input type="hidden" name="ContentObjectLanguageCode" value="{$object.current_language}" />
		{/if}
		{if $object.can_remove}
		<input type="image" name="ActionRemove" src={"trash.gif"|ezimage} alt="Remove" title="Delete this weather box" />
		{/if}
		<input type="hidden" name="ContentObjectID" value="{$object.id}" />
		<input type="hidden" name="NodeID" value="{$node.node_id}" />
		<input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
	</form>	
</div>
{/if}
