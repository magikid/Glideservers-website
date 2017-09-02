<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=1}
</div>

<div class="col-sm-10">

<form method="get" action="{$smarty.server.PHP_SELF}">
<p class="text-center">{$LANG.ordercategories}: <select name="gid" onchange="submit()" class="choosecat">
{foreach key=num item=productgroup from=$productgroups}
<option value="{$productgroup.gid}"{if $gid eq $productgroup.gid} selected="selected"{/if}>{$productgroup.name}</option>
{/foreach}
{if $loggedin}
<option value="addons">{$LANG.cartproductaddons}</option>
{if $renewalsenabled}<option value="renewals">{$LANG.domainrenewals}</option>{/if}
{/if}
{if $registerdomainenabled}<option value="domains">{$LANG.orderdomainregonly}</option>{/if}
</select></p>
</form>

<hr class="full"/>

{if !$loggedin && $currencies}
<form method="post" action="cart.php?gid={$gid}">
<p  class="text-center">{$LANG.choosecurrency}: <select name="currency"  class="choosecat" onchange="submit()">{foreach from=$currencies item=curr}
<option value="{$curr.id}"{if $curr.id eq $currency.id} selected{/if}>{$curr.code}</option>
{/foreach}</select> <input type="submit" value="{$LANG.go}" class="btn btn-lg" /></p>
</form>
<hr class="full"/>
{/if}


{foreach key=num item=product from=$products}
<div class="orderbox">

<form method="post" action="{$smarty.server.PHP_SELF}?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}">
<div class="row">
<div class="col-sm-6">
<h5>{$product.name}</h5>
{if $product.qty!=""}<p>({$product.qty} {$LANG.orderavailable})</p>{/if}
<p>{$product.description}</p>
{if $product.freedomain}<<p>>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomaindescription}</p>{/if}
</div>
<div class="col-sm-6 spacing-40">
{if $product.bid}
<p  class="text-center"><strong>{$LANG.bundledeal}</strong></p>
{if $product.displayprice}<p  class="text-center">{$product.displayprice}</p>{/if}
{elseif $product.paytype eq "free"}
<p class="text-center">{$LANG.orderfree}</p>

<input type="hidden" name="billingcycle" value="free" />
{elseif $product.paytype eq "onetime"}
{if $product.pricing.hasconfigoptions}<p class="text-center">{$LANG.startingfrom}</p> {/if}<p class="text-center">{$product.pricing.onetime}</p> <p class="text-center">{$LANG.orderpaymenttermonetime}</p>
<input type="hidden" name="billingcycle" value="onetime" />
{elseif $product.paytype eq "recurring"}
<div class="text-center">
<select name="billingcycle"  class="choosecat">
{if $product.pricing.monthly}<option value="monthly">{$product.pricing.monthly}</option>{/if}
{if $product.pricing.quarterly}<option value="quarterly">{$product.pricing.quarterly}</option>{/if}
{if $product.pricing.semiannually}<option value="semiannually">{$product.pricing.semiannually}</option>{/if}
{if $product.pricing.annually}<option value="annually">{$product.pricing.annually}</option>{/if}
{if $product.pricing.biennially}<option value="biennially">{$product.pricing.biennially}</option>{/if}
{if $product.pricing.triennially}<option value="triennially">{$product.pricing.triennially}</option>{/if}
</select>
</div>
{/if}
<p class="spacing-20 text-center"><input type="submit" value="{$LANG.ordernowbutton}"{if $product.qty eq "0"} disabled{/if} class="btn btn-success"/></p>
</div>
</div>
</form>

</div>
{/foreach}

<p class="spacing-20"><img align="left" src="images/padlock.gif" border="0" alt="Secure Transaction" style="padding-right: 10px;" /> {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}</p>

</div>

</div>
</div>
