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
{if $renewalsenabled}<option value="renewals">{$LANG.domainrenewals}</option>{/if}
{/if}
{if $registerdomainenabled}<option value="domains" selected="selected">{$LANG.orderdomainregonly}</option>{/if}
</select></p>
</form>
<hr class="full"/>

{if !$loggedin && $currencies}
<form method="post" action="cart.php?a=add&domain=register">
<p class="text-center">{$LANG.choosecurrency}: <select name="currency" onchange="submit()"  class="choosecat">{foreach from=$currencies item=curr}
<option value="{$curr.id}"{if $curr.id eq $currency.id} selected{/if}>{$curr.code}</option>
{/foreach}</select> <input type="submit" value="{$LANG.go}" /></p>
</form>
<hr class="full"/>
{/if}


<form method="post" action="{$smarty.server.PHP_SELF}?a=add">

{if $errormessage}
<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div></div>
{/if}

<div class="domainoptions">

<div><label><input type="radio" name="domain" value="register" id="selregister"{if $domain eq "register"} checked{/if} /> {$LANG.orderdomainoption1part1} {$companyname} {$LANG.orderdomainoption1part2}</label></div>

<div><label><input type="radio" name="domain" value="transfer" id="seltransfer"{if $domain eq "transfer"} checked{/if} /> {$LANG.orderdomainoption3} {$companyname}</label></div>

</div>
<div class="spacing-20"></div>
<div class="well override domaincheck">

www. <input type="text" name="sld" value="{$sld}" class="choosecat"/> <select name="tld" class="choosecat">
{foreach key=num item=listtld from=$tlds}
<option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
{/foreach}
</select>

</div>

<p align="center"><input type="submit" value="{$LANG.checkavailability}" class="btn btn-success" /></p>

</form>

{if $availabilityresults}
<div class="spacing-40"></div>
<h5 class="text-center">{$LANG.choosedomains}</h5>

<form method="post" action="{$smarty.server.PHP_SELF}?a=add&domain={$domain}">

<table id="tld-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
<thead><tr><th>{$LANG.domainname}</th><th>{$LANG.domainstatus}</th><th>{$LANG.domainmoreinfo}</th></tr></thead>
{foreach key=num item=result from=$availabilityresults}
<tr><td>{$result.domain}</td><td class="{if $result.status eq $searchvar}textgreen{else}textred{/if}">{if $result.status eq $searchvar}<input type="checkbox" name="domains[]" value="{$result.domain}"{if $result.domain|in_array:$domains} checked{/if} /> {$LANG.domainavailable}{else}{$LANG.domainunavailable}{/if}</td><td>{if $result.regoptions}<select name="domainsregperiod[{$result.domain}]" class="choosecat">{foreach key=period item=regoption from=$result.regoptions}{if $regoption.$domain}<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.$domain}</option>{/if}{/foreach}</select>{/if}</td></tr>
{/foreach}
</table>

<p align="center"><input type="submit" value="{$LANG.addtocart}"  class="btn btn-success"/></p>

</form>

{/if}

</div>

</div>
</div>