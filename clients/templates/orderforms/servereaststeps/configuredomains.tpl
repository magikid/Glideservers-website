<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=3}

</div>

<div class="col-sm-10">

<h5 class="text-center">{$LANG.cartdomainsconfig}</h5>
<p class="text-center">{$LANG.cartdomainsconfigdesc}</p>
<hr class="full"/>


{if $errormessage}<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div></div>{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains">
<input type="hidden" name="update" value="true" />

{foreach key=num item=domain from=$domains}
<h5 class="text-center">{$domain.domain} - {$domain.regperiod} {$LANG.orderyears} {if $domain.hosting}<span>[{$LANG.cartdomainshashosting}]</span>{else}<a href="cart.php" >[{$LANG.cartdomainsnohosting}]</a>{/if}</h5>
{if $domain.configtoshow}
<div class="orderbox">
<ul class="domain-names">
{if $domain.eppenabled}{$LANG.domaineppcode} <li><input type="text" name="epp[{$num}]" value="{$domain.eppvalue}" /> {$LANG.domaineppcodedesc}</li>{/if}
{if $domain.dnsmanagement}<li><label><input type="checkbox" name="dnsmanagement[{$num}]"{if $domain.dnsmanagementselected} checked{/if} /> {$LANG.domaindnsmanagement} ({$domain.dnsmanagementprice})</label></li>{/if}
{if $domain.emailforwarding}<li><label><input type="checkbox" name="emailforwarding[{$num}]"{if $domain.emailforwardingselected} checked{/if} /> {$LANG.domainemailforwarding} ({$domain.emailforwardingprice})</label></li>{/if}
{if $domain.idprotection}<li><label><input type="checkbox" name="idprotection[{$num}]"{if $domain.idprotectionselected} checked{/if} /> {$LANG.domainidprotection} ({$domain.idprotectionprice})</label></li>{/if}
{foreach key=domainfieldname item=domainfield from=$domain.fields}
{$domainfieldname}: {$domainfield}<br />
{/foreach}
</ul>
</div>
{/if}
{/foreach}

{if $atleastonenohosting}
<div class="spacing-20"></div>
<h5 class="text-center">{$LANG.domainnameservers}</h5>
<p  class="text-center">{$LANG.cartnameserversdesc}</p>
<table id="masspay-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
<tr><td>{$LANG.domainnameserver1}:</td><td><input type="text" name="domainns1" class="form-control" value="{$domainns1}" /></td></tr>
<tr><td>{$LANG.domainnameserver2}:</td><td><input type="text" name="domainns2" class="form-control" value="{$domainns2}" /></td></tr>
<tr><td>{$LANG.domainnameserver3}:</td><td><input type="text" name="domainns3" class="form-control" value="{$domainns3}" /></td></tr>
<tr><td>{$LANG.domainnameserver4}:</td><td><input type="text" name="domainns4" class="form-control" value="{$domainns4}" /></td></tr>
<tr><td>{$LANG.domainnameserver5}:</td><td><input type="text" name="domainns5" class="form-control" value="{$domainns5}" /></td></tr>
</table>
{/if}

<p align="center"><input type="submit" value="{$LANG.updatecart}" class="btn btn-success"/></p>

</form>

</div>

</div>
</div>
</div>