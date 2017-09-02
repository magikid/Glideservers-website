<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=2}
</div>

<div class="col-sm-10">

<h5 class="text-center">{$productinfo.groupname} - {$productinfo.name}</h5>
<p class="text-center">{$LANG.cartproductdomaindesc}</p>

<hr class="full"/>

<form method="post" action="{$smarty.server.PHP_SELF}?a=add&pid={$pid}">
{foreach from=$passedvariables key=name item=value}
<input type="hidden" name="{$name}" value="{$value}" />
{/foreach}

{if $errormessage}<div class="spacing-20">
 <div class="alert alert-success text-center login-process"  role="alert">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div></div>{/if}


<div class="domainoptions">

{if $incartdomains}
<div><label><input type="radio" name="domainoption" value="incart" id="selincart" onclick="document.getElementById('register').style.display='none';document.getElementById('transfer').style.display='none';document.getElementById('owndomain').style.display='none';document.getElementById('subdomain').style.display='none';document.getElementById('incart').style.display=''" /> {$LANG.cartproductdomainuseincart}</label></div>
{/if}

{if $registerdomainenabled}
<div><label><input type="radio" name="domainoption" value="register" id="selregister" onclick="document.getElementById('register').style.display='';document.getElementById('transfer').style.display='none';document.getElementById('owndomain').style.display='none';document.getElementById('subdomain').style.display='none';document.getElementById('incart').style.display='none'" /> {$LANG.orderdomainoption1part1} {$companyname} {$LANG.orderdomainoption1part2}</label></div>
{/if}

{if $transferdomainenabled}
<div><label><input type="radio" name="domainoption" value="transfer" id="seltransfer" onclick="document.getElementById('register').style.display='none';document.getElementById('transfer').style.display='';document.getElementById('owndomain').style.display='none';document.getElementById('subdomain').style.display='none';document.getElementById('incart').style.display='none'" /> {$LANG.orderdomainoption3} {$companyname}</label></div>
{/if}

{if $owndomainenabled}
<div><label><input type="radio" name="domainoption" value="owndomain" id="selowndomain" onclick="document.getElementById('register').style.display='none';document.getElementById('transfer').style.display='none';document.getElementById('owndomain').style.display='';document.getElementById('subdomain').style.display='none';document.getElementById('incart').style.display='none'" /> {$LANG.orderdomainoption2}</label></div>
{/if}

{if $subdomains}
<div><label><input type="radio" name="domainoption" value="subdomain" id="selsubdomain" onclick="document.getElementById('register').style.display='none';document.getElementById('transfer').style.display='none';document.getElementById('owndomain').style.display='none';document.getElementById('subdomain').style.display='';document.getElementById('incart').style.display='none'" /> {$LANG.orderdomainoption4}</label></div>
{/if}

</div>

<div class="spacing-20"></div>


<div class="orderbox">

<div id="incart" align="center">{$LANG.cartproductdomainchoose}: <select name="incartdomain"  class="choosecat">
{foreach key=num item=incartdomain from=$incartdomains}
<option value="{$incartdomain}">{$incartdomain}</option>
{/foreach}
</select>
</div>

<div id="register" align="center">www. <input type="text" name="sld[0]" value="{$sld}"  class="choosecat"/> <select name="tld[0]"  class="choosecat">
{foreach key=num item=listtld from=$registertlds}
<option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
{/foreach}
</select>
</div>

<div id="transfer" align="center">www. <input type="text" name="sld[1]" value="{$sld}"  class="choosecat"/> <select name="tld[1]"  class="choosecat">
{foreach key=num item=listtld from=$transfertlds}
<option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
{/foreach}
</select>
</div>

<div id="owndomain" align="center">www. <input type="text" name="sld[2]" value="{$sld}"  class="choosecat"/> . <input type="text" name="tld[2]" value="{$tld}"  class="choosecat"/></div>

<div id="subdomain" align="center">http:// <input type="text" name="sld[3]" value="{$sld}"  class="choosecat" /> <select name="tld[3]"  class="choosecat">{foreach from=$subdomains key=subid item=subdomain}<option value="{$subid}">{$subdomain}</option>{/foreach}</select></div>

</div>

<script language="javascript" type="text/javascript">
document.getElementById('incart').style.display='none';
document.getElementById('register').style.display='none';
document.getElementById('transfer').style.display='none';
document.getElementById('owndomain').style.display='none';
document.getElementById('subdomain').style.display='none';
document.getElementById('sel{$domainoption}').checked='true';
document.getElementById('{$domainoption}').style.display='';
</script>

{if $availabilityresults}
<div class="spacing-40"></div>
<h5 class="text-center">{$LANG.choosedomains}</h5>

<table id="tld-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
<thead><tr><th>{$LANG.domainname}</th><th>{$LANG.domainstatus}</th><th>{$LANG.domainmoreinfo}</th></tr></thead>
{foreach key=num item=result from=$availabilityresults}
<tr><td>{$result.domain}</td><td class="{if $result.status eq $searchvar}textgreen{else}textred{/if}">{if $result.status eq $searchvar}<input type="checkbox" name="domains[]" value="{$result.domain}"{if $num eq 0} checked{/if} /> {$LANG.domainavailable}{else}{$LANG.domainunavailable}{/if}</td><td>{if $result.regoptions}<select name="domainsregperiod[{$result.domain}]"   class="choosecat">{foreach key=period item=regoption from=$result.regoptions}{if $regoption.$domainoption}<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.$domainoption}</option>{/if}{/foreach}</select>{/if}</td></tr>
{/foreach}
</table>

{/if}

{if $freedomaintlds}* <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</em>{/if}

<p align="center"><input type="submit" value="{$LANG.ordercontinuebutton}"  class="btn btn-success"/></p>

</form>

</div>

</div>
</div>
</div>