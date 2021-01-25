{*
Copyright 2011-2015 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}
    Broneeringu detailid:
    <br/>
    <br/>

    Kasutaja: {$UserName}<br/>
    {if !empty($CreatedBy)}
        Broneerija: {$CreatedBy}
        <br/>
    {/if}
    Algus: {formatdate date=$StartDate key=reservation_email}<br/>
    Lõpp: {formatdate date=$EndDate key=reservation_email}<br/>
    {if $ResourceNames|count > 1}
        Väljakud:<br/>
        {foreach from=$ResourceNames item=resourceName}
            {$resourceName}<br/>
        {/foreach}
        {else}
        Väljak: {$ResourceName}<br/>
    {/if}

    {if $ResourceImage}
        <div class="resource-image"><img src="{$ScriptUrl}/{$ResourceImage}"/></div>
    {/if}

    Pealkiri: {$Title}<br/>
    Kirjeldus: {$Description|nl2br}

    {if count($RepeatDates) gt 0}
        <br/>
        Broneering esineb järgneval kuupäeval:
        <br/>
    {/if}

    {foreach from=$RepeatDates item=date name=dates}
        {formatdate date=$date}<br/>
    {/foreach}

    {if $Accessories|count > 0}
        <br/>Accessories:<br/>
        {foreach from=$Accessories item=accessory}
            ({$accessory->QuantityReserved}) {$accessory->Name}<br/>
        {/foreach}
    {/if}

    {if $Attributes|count > 0}
        <br/>
        {foreach from=$Attributes item=attribute}
            <div>{control type="AttributeControl" attribute=$attribute readonly=true}</div>
        {/foreach}
    {/if}

    {if $RequiresApproval}
        <br/>
        One or more of the resources reserved require approval before usage.  Please ensure that this reservation request is approved or rejected.
    {/if}

    <br/>
    <br/>
    <a href="{$ScriptUrl}/{$ReservationUrl}">Vaata seda broneeringut</a> | <a href="{$ScriptUrl}">Logi sisse Rannahalli kalendrisse</a>
