<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=3}
</div>

<div class="col-sm-10">

<h5 class="text-center">{$LANG.cartproductconfig}</h5>
<p class="text-center">{$LANG.cartproductdesc}</p>
<hr class="full"/>


<form method="post" action="{$smarty.server.PHP_SELF}?a=confproduct&i={$i}">
<input type="hidden" name="configure" value="true">

{if $errormessage}<div class="spacing-20">
 <div class="alert alert-success text-center login-process"  role="alert">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div></div>{/if}

{if $productinfo}

<div class="orderbox">
<h5>{$productinfo.groupname} - {$productinfo.name}</h5>
<p>{$productinfo.description}</p>
</div>

<input type="hidden" name="previousbillingcycle" value="{$billingcycle}" />
<p>{$LANG.orderbillingcycle}: {if $pricing.type eq "free"}
<input type="hidden" name="billingcycle" value="free" />
{$LANG.orderfree}
{elseif $pricing.type eq "onetime"}
<input type="hidden" name="billingcycle" value="onetime" />
{$pricing.onetime} {$LANG.orderpaymenttermonetime}
{else}
<select name="billingcycle" onchange="submit()" class="choosecat">
{if $pricing.monthly}<option value="monthly"{if $billingcycle eq "monthly"} selected="selected"{/if}>{$pricing.monthly}</option>{/if}
{if $pricing.quarterly}<option value="quarterly"{if $billingcycle eq "quarterly"} selected="selected"{/if}>{$pricing.quarterly}</option>{/if}
{if $pricing.semiannually}<option value="semiannually"{if $billingcycle eq "semiannually"} selected="selected"{/if}>{$pricing.semiannually}</option>{/if}
{if $pricing.annually}<option value="annually"{if $billingcycle eq "annually"} selected="selected"{/if}>{$pricing.annually}</option>{/if}
{if $pricing.biennially}<option value="biennially"{if $billingcycle eq "biennially"} selected="selected"{/if}>{$pricing.biennially}</option>{/if}
{if $pricing.triennially}<option value="triennially"{if $billingcycle eq "triennially"} selected="selected"{/if}>{$pricing.triennially}</option>{/if}
</select>
{/if}</p>

{/if}

{if $productinfo.type eq "server"}
<p class="text-center"><strong>{$LANG.cartconfigserver}</strong></p>
<table  id="masspay-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
<tr><td>{$LANG.serverhostname}:</td><td><input type="text" name="hostname" placeholder="{$LANG.serverhostnameexample}" class="form-control" value="{$server.hostname}" /></td></tr>
<tr><td>{$LANG.serverns1prefix}:</td><td><input type="text" name="ns1prefix"  placeholder="{$LANG.serverns1prefixexample}" class="form-control" value="{$server.ns1prefix}" /></td></tr>
<tr><td>{$LANG.serverns2prefix}:</td><td><input type="text" name="ns2prefix"  placeholder="{$LANG.serverns2prefixexample}" class="form-control" value="{$server.ns2prefix}" /></td></tr>
<tr><td>{$LANG.serverrootpw}:</td><td><input type="password" name="rootpw"  class="form-control" value="{$server.rootpw}" /></td></tr>
</table>
{/if}

{if $configurableoptions}
<div class="spacing-20"></div>
<h5>{$LANG.orderconfigpackage}</h5>
<p>{$LANG.cartconfigoptionsdesc}</p>
<div class="orderbox">
<table  id="tld-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
{foreach key=num item=configoption from=$configurableoptions}
<tr><td>{$configoption.optionname}:</td><td>
{if $configoption.optiontype eq 1}
<select name="configoption[{$configoption.id}]">
{foreach key=num2 item=options from=$configoption.options}
<option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>{$options.name}</option>
{/foreach}
</select>
{elseif $configoption.optiontype eq 2}
{foreach key=num2 item=options from=$configoption.options}
<label><input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if}> {$options.name}</label><br />
{/foreach}
{elseif $configoption.optiontype eq 3}
<label><input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}> {$configoption.options.0.name}</label>
{elseif $configoption.optiontype eq 4}
<input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}"> x {$configoption.options.0.name}
{/if}
</td></tr>
{/foreach}
</table>
</div>
{/if}

{if $addons}
<div class="spacing-20"></div>
<h5>{$LANG.orderchooseaddons}</h5>
<p>{$LANG.orderaddondescription}</p>
<div class="orderbox">
{foreach key=num item=addon from=$addons}
<p><label for="a{$addon.id}" class="hascheckbox">{$addon.checkbox} <strong>{$addon.name}</strong> - {$addon.description} ({$addon.pricing})</label></p>
{/foreach}

</div>
{/if}

{if $customfields}
<div class="spacing-20"></div>
<h5>{$LANG.orderadditionalrequiredinfo}</h5>
<p>{$LANG.cartcustomfieldsdesc}</p>
<div class="orderbox">
<table  id="tld-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
{foreach key=num item=customfield from=$customfields}
<tr><td>{$customfield.name}:</td><td>{$customfield.input} {$customfield.description}</td></tr>
{/foreach}
</table>
</div>
{/if}

{if $domainoption}
<p><strong>{$LANG.cartproductdomain}</strong></p>

{if $domains}
<input type="hidden" name="domainoption" value="{$domainoption}" />
<p>
{foreach key=num item=domain from=$domains}
<input type="hidden" name="domains[]" value="{$domain.domain}" />
<input type="hidden" name="domainsregperiod[{$domain.domain}]" value="{$domain.regperiod}" />
{$LANG.orderdomain} {$num+1} - {$domain.domain}{if $domain.regperiod} ({$domain.regperiod} {$LANG.orderyears}){/if}<br />
{/foreach}
</p>
{/if}

{if $additionaldomainfields}
<table   id="tld-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
{foreach key=domainfieldname item=domainfield from=$additionaldomainfields}
<tr><td nowrap>{$domainfieldname}</td><td>{$domainfield}</td></tr>
{/foreach}
</table>
{/if}

{/if}

<p align="center">{if $firstconfig}<input type="submit" value="{$LANG.addtocart}" " class="btn btn-success"/>{else}<input type="submit" value="{$LANG.updatecart}" class="btn btn-success"/>{/if}</p>

</form>

</div>

</div>
</div>
</div>