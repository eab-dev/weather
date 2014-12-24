<div class="toolbar-item {$placement}">
    {section show=or($show_subtree|count_chars()|eq(0),
                     fetch(content, node, hash( node_id, $module_result.node_id ) ).path_string|contains( concat( '/', $show_subtree, '/' ) ),
                     $requested_uri_string|begins_with( $show_subtree ))}


{cache-block expiry=$caching_duration}
    <div class="toollist">
        <div class="toollist-design">
        <h2>{$title}</h2>

{let forecast=fetch( 'weather', 'forecast', hash( 'location_code', $location_code, 'unit', $unit) )}

{section show=$displaycityname_check|eq('yes')}
	{$forecast.location.city}<br />
{/section}

{section show=$displaydate_check|eq('yes')}
	{$forecast.condition.date}<br />
{/section}

{section show=$displayicon_check|eq('yes')}
	<span title="{$forecast.condition.text}">{$forecast.image}</span><br />
{/section}

{section show=$displaytemperature_check|eq('yes')}
	{$forecast.condition.temp} {$forecast.units.temperature}<br />
{/section}

{/let}
        </div>
    </div>

{/cache-block}
    {/section}
</div>
