<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=1}
</div>

<div class="col-sm-10">

<form method="get" action="{$smarty.server.PHP_SELF}">
<p class="text-center">{$LANG.ordercategories}: <select name="gid" onchange="submit()"  class="choosecat">
{foreach key=num item=productgroup from=$productgroups}
<option value="{$productgroup.gid}">{$productgroup.name}</option>
{/foreach}
<option value="addons" selected="selected">{$LANG.cartproductaddons}</option>
{if $renewalsenabled}<option value="renewals">{$LANG.domainrenewals}</option>{/if}
{if $registerdomainenabled}<option value="domains">{$LANG.orderdomainregonly}</option>{/if}
</select></p>
</form>

<hr class="full"/>

{foreach from=$addons item=addon}
<div class="orderbox">
<form method="post" action="{$smarty.server.PHP_SELF}?a=add">
<input type="hidden" name="aid" value="{$addon.id}" />
<div class="row">
<div class="col-sm-6">
<h5>{$addon.name}</h5>
<p>{$addon.description}</p>
<p>
{if $addon.free}
{$LANG.orderfree}
{else}
{$addon.recurringamount} {$addon.billingcycle}{if $addon.setupfee} + {$addon.setupfee} {$LANG.ordersetupfee}{/if}
{/if}
</p>
</div>
<div class="col-sm-6  spacing-20">
<p align="center">
{$LANG.cartproductaddonschoosepackage}<br/><select name="productid"  class="choosecat">{foreach from=$addon.productids item=product}
<option value="{$product.id}">{$product.product}{if $product.domain} - {$product.domain}{/if}</option>
{/foreach}</select> <p class="text-center"><input type="submit" value="{$LANG.ordernowbutton} &raquo;" class="btn btn-success" /></p>
</p>
</div>
</div>
</form>
</div>
{/foreach}

{if $noaddons}
<div class="errorbox">{$LANG.cartproductaddonsnone}</div>
{/if}

</div>

</div>
</div>
</div>