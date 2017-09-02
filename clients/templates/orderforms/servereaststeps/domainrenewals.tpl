<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=2}
</div>

<div class="col-sm-10">

<form method="get" action="{$smarty.server.PHP_SELF}">
<p class="text-center">{$LANG.ordercategories}: <select name="gid" onchange="submit()" class="choosecat">
{foreach key=num item=productgroup from=$productgroups}
<option value="{$productgroup.gid}">{$productgroup.name}</option>
{/foreach}
{if $loggedin}
<option value="addons">{$LANG.cartproductaddons}</option>
<option value="renewals" selected="selected">{$LANG.domainrenewals}</option>
{/if}
{if $registerdomainenabled}<option value="domains">{$LANG.orderdomainregonly}</option>{/if}
</select></p>
</form>
<p class="text-center">{$LANG.domainrenewdesc}</p>
<hr class="full"/>

<form method="post" action="cart.php?a=add&renewals=true">

<table id="tld-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
<thead><tr><th></th><th>{$LANG.orderdomain}</th><th>{$LANG.domainstatus}</th><th>{$LANG.domaindaysuntilexpiry}</th><th></th></tr></thead>
{foreach from=$renewals item=renewal}
<tr><td>{if !$renewal.pastgraceperiod}<input type="checkbox" name="renewalids[]" value="{$renewal.id}" />{/if}</td><td>{$renewal.domain}</td><td>{$renewal.status}</td><td>
      {if $renewal.daysuntilexpiry > 30}
        {$renewal.daysuntilexpiry} {$LANG.domainrenewalsdays}
      {elseif $renewal.daysuntilexpiry > 0}
        {$renewal.daysuntilexpiry} {$LANG.domainrenewalsdays}
      {else}
        {$renewal.daysuntilexpiry*-1} {$LANG.domainrenewalsdaysago}
      {/if}
      {if $renewal.ingraceperiod}
      <br/>
       {$LANG.domainrenewalsingraceperiod}
      {/if}
</td><td>
      {if $renewal.beforerenewlimit}
        {$LANG.domainrenewalsbeforerenewlimit|sprintf2:$renewal.beforerenewlimitdays}
      {elseif $renewal.pastgraceperiod}
        {$LANG.domainrenewalspastgraceperiod}
      {else}
        <select name="renewalperiod[{$renewal.id}]" class="choosecat">
        {foreach from=$renewal.renewaloptions item=renewaloption}
          <option value="{$renewaloption.period}">{$renewaloption.period} {$LANG.orderyears} @ {$renewaloption.price}</option>
        {/foreach}
        </select>
      {/if}
</td></tr>
{foreachelse}
<tr><td>{$LANG.domainrenewalsnoneavailable}</td></tr>
{/foreach}
</table>

<p align="center"><input type="submit" value="{$LANG.ordernowbutton}" class="btn btn-success"/></p>

</form>

</div>

</div>
</div>