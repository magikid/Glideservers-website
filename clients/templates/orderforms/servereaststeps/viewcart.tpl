<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />
<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>
<script type="text/javascript" src="includes/jscript/creditcard.js"></script>

{literal}
<script language="javascript">
function removeItem(type,num) {
    var response = confirm("{/literal}{$LANG.cartremoveitemconfirm}{literal}");
    if (response) {
        window.location = 'cart.php?a=remove&r='+type+'&i='+num;
    }
}
function emptyCart(type,num) {
    var response = confirm("{/literal}{$LANG.cartemptyconfirm}{literal}");
    if (response) {
        window.location = 'cart.php?a=empty';
    }
}
</script>
{/literal}
<script>
window.langPasswordStrength = "{$LANG.pwstrength}";
window.langPasswordWeak = "{$LANG.pwstrengthweak}";
window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
</script>

<div class="row spacing-40">
<div class="col-sm-2">

{if $checkout}
{include file="orderforms/verticalsteps/verticalsteps.tpl" step=5}
{else}
{include file="orderforms/verticalsteps/verticalsteps.tpl" step=4}
{/if}
</div>

<div class="col-sm-10">

{if !$checkout}

<h5 class="text-center">{$LANG.ordersummary}</h5>
<hr class="full"/>
{if $errormessage}<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div></div>{elseif $promotioncode && $rawdiscount eq "0.00"}<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">{$LANG.promoappliedbutnodiscount}</div></div>{/if}

{if $bundlewarnings}
<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">
<strong>{$LANG.bundlereqsnotmet}</strong><br />
{foreach from=$bundlewarnings item=warning}
{$warning}<br />
{/foreach}
</div>
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?a=view">

<table id="masspay-table" class="responsive wow fadeInUp tablesaw tablesaw-stack" data-mode="stack">
<thead><tr><th>{$LANG.orderdesc}</th><th>{$LANG.orderprice}</th></tr></thead>

{foreach key=num item=product from=$products}
<tr><td>
<strong>{$product.productinfo.groupname} - {$product.productinfo.name}</strong>{if $product.domain} ({$product.domain}){/if}<br />
{if $product.configoptions}
{foreach key=confnum item=configoption from=$product.configoptions}&nbsp;&raquo; {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />{/foreach}
{/if}
<a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" class="cartedit">[{$LANG.carteditproductconfig}]</a> <a href="#" onclick="removeItem('p','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
{if $product.allowqty}
<br /><br />
<div class="alignright">{$LANG.cartqtyenterquantity} <input type="text" name="qty[{$num}]"  value="{$product.qty}" /> <input type="submit" value="{$LANG.cartqtyupdate}" /></div>
{/if}
</td><td><strong>{$product.pricingtext}{if $product.proratadate}<br />({$LANG.orderprorata} {$product.proratadate}){/if}</strong></td></tr>
{foreach key=addonnum item=addon from=$product.addons}
<tr><td><strong>{$LANG.orderaddon}</strong> - {$addon.name}</td><td><strong>{$addon.pricingtext}</strong></td></tr>
{/foreach}
{/foreach}

{foreach key=num item=addon from=$addons}
<tr><td>
<strong>{$addon.name}</strong><br />
{$addon.productname}{if $addon.domainname} - {$addon.domainname}<br />{/if}
<a href="#" onclick="removeItem('a','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
</td><td><strong>{$addon.pricingtext}</strong></td></tr>
{/foreach}

{foreach key=num item=domain from=$domains}
<tr><td>
<strong>{if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
{if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
{if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
{if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
<a href="{$smarty.server.PHP_SELF}?a=confdomains" class="cartedit">[{$LANG.cartconfigdomainextras}]</a> <a href="#" onclick="removeItem('d','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
</td><td><strong>{$domain.price}</strong></td></tr>
{/foreach}

{foreach key=num item=domain from=$renewals}
<tr><td>
<strong>{$LANG.domainrenewal}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
{if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
{if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
{if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
<a href="#" onclick="removeItem('r','{$num}');return false" class="cartremove">[{$LANG.cartremove}]</a>
</td><td><strong>{$domain.price}</strong></td></tr>
{/foreach}

{if $cartitems==0}
<tr><td>
{$LANG.cartempty}
</td></tr>
{/if}

</table>

</form>

<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
<input type="hidden" name="validatepromo" value="true" />
<p align="center"><strong>{$LANG.orderpromotioncode}:</strong> {if $promotioncode}{$promotioncode} - {$promotiondescription}<br /><a href="{$smarty.server.PHP_SELF}?a=removepromo">{$LANG.orderdontusepromo}</a>{else}<input type="text" name="promocode" class="choosecat" /> <input type="submit" value="{$LANG.orderpromovalidatebutton}" class="btn btn-lg"/>{/if}
</form>

<div class="spacing-20"></div>
<div class="row">
<div class="col-sm-7 center-block">
<ul class="display-list">
<li>{$LANG.ordersubtotal}: <b>{$subtotal}</b></li>
{if $promotioncode}<li>{$promotiondescription}: <b>{$discount}</b></li>{/if}
{if $taxrate}{$taxname} <li>@ {$taxrate}%: <b>{$taxtotal}</b></li>{/if}
{if $taxrate2}{$taxname2} <li>@ {$taxrate2}%: <b>{$taxtotal2}</b></li>{/if}
<li>{$LANG.ordertotalduetoday}: <b>{$total}</b></li>
{if $totalrecurringmonthly || $totalrecurringquarterly || $totalrecurringsemiannually || $totalrecurringannually || $totalrecurringbiennially || $totalrecurringtriennially}
<li>{$LANG.ordertotalrecurring} <b>{if $totalrecurringmonthly}{$totalrecurringmonthly} {$LANG.orderpaymenttermmonthly}</li>{/if}
{if $totalrecurringquarterly}<li>{$totalrecurringquarterly} {$LANG.orderpaymenttermquarterly}</li>{/if}
{if $totalrecurringsemiannually}<li>{$totalrecurringsemiannually} {$LANG.orderpaymenttermsemiannually}</li>{/if}
{if $totalrecurringannually}<li>{$totalrecurringannually} {$LANG.orderpaymenttermannually}</li>{/if}
{if $totalrecurringbiennially}<li>{$totalrecurringbiennially} {$LANG.orderpaymenttermbiennially}</li>{/if}
{if $totalrecurringtriennially}<li>{$totalrecurringtriennially} {$LANG.orderpaymenttermtriennially}</li>{/if}</b>
{/if}
</ul>
</div>
</div>

<div class="spacing-20"></div>
<p align="center"><input type="button" value="&laquo; {$LANG.orderstartover}" onclick="window.location='cart.php?a=startover'" class="btn btn-danger" /> <input type="button"  class="btn btn-success" value="{$LANG.checkout} &raquo;" onclick="window.location='cart.php?a=checkout'"{if $cartitems==0} disabled{/if} /></p>

{foreach from=$gatewaysoutput item=gatewayoutput}
<div class="gateway"><strong>- {$LANG.or} -</strong><br /><br />{$gatewayoutput}</div>
{/foreach}

{else}

{literal}<script language="javascript">
function showloginform() {
    jQuery("#loginfrm").slideToggle();
    jQuery("#mainfrm").slideToggle();
}
function domaincontactchange() {
    if (jQuery("#domaincontact").val()=="addingnew") {
        jQuery("#domaincontactfields").slideDown();
    } else {
        jQuery("#domaincontactfields").slideUp();
    }
}
function showCCForm() {
    jQuery("#ccinputform").slideDown();
}
function hideCCForm() {
    jQuery("#ccinputform").slideUp();
}
function useExistingCC() {
    jQuery(".newccinfo").hide();
}
function enterNewCC() {
    jQuery(".newccinfo").show();
}
</script>{/literal}

<p class="ordertotal text-center">{$LANG.ordertotalduetoday}: <strong>{$total}</strong></p>
<hr class="full"/>
<h5 class="text-center">{$LANG.checkout}</h5>
<hr class="full"/>
{if $errormessage}<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div></div>{/if}

<div class="spacing-20"></div>
<h5 class="text-center">{$LANG.yourdetails}</h5>
<hr class="full"/>
{if !$loggedin}<p class="text-center"><b>{$LANG.alreadyregistered} <a href="{$smarty.server.PHP_SELF}?a=login" onclick="showloginform();return false;">{$LANG.clickheretologin}</a></b></p>{/if}

<form action="dologin.php" method="post">
<div id="loginfrm" style="display:none;">
<div class="row">
<div class="col-sm-7 center-block">
<table id="masspay-table" class="responsive tablesaw tablesaw-stack" data-mode="stack">
<tr><td class="fieldarea" align="right">{$LANG.loginemail}:</td><td><input type="text" name="username" value="{$username}" /></td></tr>
<tr><td class="fieldarea" align="right">{$LANG.loginpassword}:</td><td><input type="password" name="password" /></td></tr>
</table>
</div>
</div>
<p align="center"><input type="submit" value="{$LANG.loginbutton}" class="btn btn-danger"/></p>
</div>
</form>

<form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" id="mainfrm">
<input type="hidden" name="submit" value="true" />

<table id="viewcart-table" class="responsive tablesaw tablesaw-stack" data-mode="stack">
  <tr><td class="halftable" valign="top">
<table>
<tr><td>{$LANG.clientareafirstname}</td><td>{if $loggedin}{$clientsdetails.firstname}{else}<input type="text" name="firstname" value="{$clientsdetails.firstname}" />{/if}</td></tr>
<tr><td>{$LANG.clientarealastname}</td><td>{if $loggedin}{$clientsdetails.lastname}{else}<input type="text" name="lastname" value="{$clientsdetails.lastname}" />{/if}</td></tr>
<tr><td>{$LANG.clientareacompanyname}</td><td>{if $loggedin}{$clientsdetails.companyname}{else}<input type="text" name="companyname" value="{$clientsdetails.companyname}" />{/if}</td></tr>
<tr><td>{$LANG.clientareaemail}</td><td>{if $loggedin}{$clientsdetails.email}{else}<input type="text" name="email" value="{$clientsdetails.email}" />{/if}</td></tr>
{if $loggedin}
{else}
<tr><td>{$LANG.clientareapassword}</td><td><input type="password" name="password" id="newpw" value="{$password}" /></td></tr>
<tr><td>{$LANG.clientareaconfirmpassword}</td><td><input type="password" name="password2" value="{$password2}" /></td></tr>
{/if}
<tr><td>{$LANG.clientareaaddress1}</td><td>{if $loggedin}{$clientsdetails.address1}{else}<input type="text" name="address1" value="{$clientsdetails.address1}" />{/if}</td></tr>
</td>
</tr>
</table>
</td>
<td class="halftable"  valign="top">
<table>
<tr><td>{$LANG.clientareaaddress2}</td><td>{if $loggedin}{$clientsdetails.address2}{else}<input type="text" name="address2" value="{$clientsdetails.address2}" />{/if}</td></tr>
<tr><td>{$LANG.clientareacity}</td><td>{if $loggedin}{$clientsdetails.city}{else}<input type="text" name="city" value="{$clientsdetails.city}" />{/if}</td></tr>
<tr><td>{$LANG.clientareastate}</td><td>{if $loggedin}{$clientsdetails.state}{else}<input type="text" name="state" value="{$clientsdetails.state}" />{/if}</td></tr>
<tr><td>{$LANG.clientareapostcode}</td><td>{if $loggedin}{$clientsdetails.postcode}{else}<input type="text" name="postcode" value="{$clientsdetails.postcode}" />{/if}</td></tr>
<tr><td>{$LANG.clientareacountry}</td><td>{if $loggedin}{$clientsdetails.country}{else}{$clientcountrydropdown|replace:'name="country"':'name="country"'|replace:'United States Outlying Islands':'US Outlying Islands'}{/if}</td></tr>
<tr><td>{$LANG.clientareaphonenumber}</td><td>{if $loggedin}{$clientsdetails.phonenumber}{else}<input type="text" name="phonenumber" value="{$clientsdetails.phonenumber}" />{/if}</td></tr>
</table>
</td>
  </tr>
</table>

{if !$loggedin}<p class="pass-stength-cart"><script language="javascript">showStrengthBar();</script></p><div class="spacing-20"></div>{/if}

{if !$loggedin && ($customfields || $securityquestions)}
<table id="masspay-table" class="responsive tablesaw tablesaw-stack" data-mode="stack">
{if $securityquestions && !$loggedin}
<tr><td>{$LANG.clientareasecurityquestion}</td><td><select name="securityqid" class="choosecat">
{foreach key=num item=question from=$securityquestions}
    <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>{$question.question}</option>
{/foreach}
</select></td></tr>
<tr><td>{$LANG.clientareasecurityanswer}</td><td><input type="password" name="securityqans" value="{$securityqans}"></td></tr>
{/if}
{foreach key=num item=customfield from=$customfields}
<tr><td>{$customfield.name}</td><td>{$customfield.input} {$customfield.description}</td></tr>
{/foreach}
</table>
{/if}

{if $domainsinorder}
<h5 class="text-center">{$LANG.domainregistrantinfo}</h5>
<hr class="full"/>

<p class="text-center">{$LANG.domainregistrantchoose}<br/><select name="contact" id="domaincontact" onchange="domaincontactchange()" class="choosecat">
    <option value="">{$LANG.usedefaultcontact}</option>
{foreach from=$domaincontacts item=domcontact}
    <option value="{$domcontact.id}"{if $contact==$domcontact.id} selected{/if}>{$domcontact.name}</option>
{/foreach}
    <option value="addingnew"{if $contact eq "addingnew"} selected{/if}>{$LANG.clientareanavaddcontact}...</option>
</select></p>

<div id="domaincontactfields">
<table id="viewcart-table" class="responsive tablesaw tablesaw-stack" data-mode="stack">
  <tr><td class="halftable" valign="top">
<table>
<tr><td>{$LANG.clientareafirstname}</td><td><input type="text" name="domaincontactfirstname"   value="{$domaincontact.firstname}" /></td></tr>
<tr><td>{$LANG.clientarealastname}</td><td><input type="text" name="domaincontactlastname"  value="{$domaincontact.lastname}" /></td></tr>
<tr><td>{$LANG.clientareacompanyname}</td><td><input type="text" name="domaincontactcompanyname"  value="{$domaincontact.companyname}" /></td></tr>
<tr><td>{$LANG.clientareaemail}</td><td><input type="text" name="domaincontactemail"  value="{$domaincontact.email}" /></td></tr>
<tr><td>{$LANG.clientareaphonenumber}</td><td><input type="text" name="domaincontactphonenumber"  value="{$domaincontact.phonenumber}" /></td></tr>
</table>
</td>
<td class="halftable"  valign="top">
<table>
<tr><td>{$LANG.clientareaaddress1}</td><td><input type="text" name="domaincontactaddress1"   value="{$domaincontact.address1}" /></td></tr>
<tr><td>{$LANG.clientareaaddress2}</td><td><input type="text" name="domaincontactaddress2"  value="{$domaincontact.address2}" /></td></tr>
<tr><td>{$LANG.clientareacity}</td><td><input type="text" name="domaincontactcity"  value="{$domaincontact.city}" /></td></tr>
<tr><td>{$LANG.clientareastate}</td><td><input type="text" name="domaincontactstate"  value="{$domaincontact.state}" /></td></tr>
<tr><td>{$LANG.clientareapostcode}</td><td><input type="text" name="domaincontactpostcode"  value="{$domaincontact.postcode}" /></td></tr>
<tr><td>{$LANG.clientareacountry}</td><td>{$domaincontactcountrydropdown|replace:'name="domaincontactcountry"':'name="domaincontactcountry"'|replace:'United States Outlying Islands':'US Outlying Islands'}</td></tr>
</table>
</td></tr></table>
</div>

{/if}

<div class="spacing-20"></div>
<h5 class="text-center">{$LANG.orderpaymentmethod}</h5>
<hr class="full"/>
<div class="row">
<div class="col-sm-5 center-block">
<p>{foreach key=num item=gateway from=$gateways}<input type="radio" name="paymentmethod" value="{$gateway.sysname}" id="pgbtn{$num}" onclick="{if $gateway.type eq "CC"}showCCForm(){else}hideCCForm(){/if}"{if $selectedgateway eq $gateway.sysname} checked{/if} /><label for="pgbtn{$num}" class="radio-inline">{$gateway.name}</label> <br/>{/foreach}</p>
</div>
</div>

<div id="ccinputform"{if $selectedgatewaytype neq "CC"} style="display:none;"{/if}>
<table id="masspay-table" class="responsive tablesaw tablesaw-stack" data-mode="stack">
{if $clientsdetails.cclastfour}<tr><td></td><td><input type="radio" name="ccinfo" value="useexisting" id="useexisting" onclick="useExistingCC()"{if $clientsdetails.cclastfour} checked{else} disabled{/if} /> <label for="useexisting" class="radio-inline">{$LANG.creditcarduseexisting}{if $clientsdetails.cclastfour} ({$clientsdetails.cclastfour}){/if}</label><br />
<input type="radio" name="ccinfo" value="new" id="new" onclick="enterNewCC()"{if !$clientsdetails.cclastfour || $ccinfo eq "new"} checked{/if} /> <label for="new" class="radio-inline">{$LANG.creditcardenternewcard}</label></td></tr>{else}<input type="hidden" name="ccinfo" value="new" />{/if}
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td>{$LANG.creditcardcardtype}</td><td><select name="cctype" class="choosecat" id="cctype">
{foreach key=num item=cardtype from=$acceptedcctypes}
<option{if $cctype eq $cardtype} selected{/if}>{$cardtype}</option>
{/foreach}
</select></td></tr>
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td>{$LANG.creditcardcardnumber}</td><td><input type="text" name="ccnumber" value="{$ccnumber}" class="form-control" autocomplete="off" /></td></tr>
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td>{$LANG.creditcardcardexpires}</td><td>

<div class="row">
<div class="col-sm-8 center-block">
<div class="row">
<div class="col-sm-6">
   <select name="ccexpirymonth" id="ccexpirymonth" class="newccinfo choosecat">
{foreach from=$months item=month}
<option{if $ccexpirymonth eq $month} selected{/if}>{$month}</option>
{/foreach}</select>
</div>
<div class="col-sm-6">
 <select name="ccexpiryyear" class="newccinfo  choosecat">
{foreach from=$expiryyears item=year}
<option{if $ccexpiryyear eq $year} selected{/if}>{$year}</option>
{/foreach}
</select>
</div>
</div>
</div>
</div>
</td></tr>
{if $showccissuestart}
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td>{$LANG.creditcardcardstart}</td><td><select name="ccstartmonth" id="ccstartmonth" class="newccinfo  choosecat">
{foreach from=$months item=month}
<option{if $ccstartmonth eq $month} selected{/if}>{$month}</option>
{/foreach}</select> / <select name="ccstartyear" class="newccinfo  choosecat">
{foreach from=$startyears item=year}
<option{if $ccstartyear eq $year} selected{/if}>{$year}</option>
{/foreach}
</select></td></tr>
<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td>{$LANG.creditcardcardissuenum}</td><td><input type="text" name="ccissuenum" value="{$ccissuenum}" maxlength="3" class="form-control"/></td></tr>
{/if}
<tr><td>{$LANG.creditcardcvvnumber}</td><td><input type="text" name="cccvv" id="cccvv" value="{$cccvv}" autocomplete="off" class="form-control"/><a href="#" onclick="window.open('images/ccv.gif','','width=280,height=200,scrollbars=no,top=100,left=100');return false">{$LANG.creditcardcvvwhere}</a></td></tr>
{if $shownostore}<tr><td>&nbsp;</td><td><label><input type="checkbox" name="nostore" /> {$LANG.creditcardnostore}</label></td></tr>{/if}
</table>
</div>

{if $shownotesfield}
<div class="spacing-20"></div>
<h5 class="text-center">{$LANG.ordernotes}</h5>
<p><textarea name="notes" rows="4" class="form-control" onFocus="if(this.value=='{$LANG.ordernotesdescription}'){ldelim}this.value='';{rdelim}" onBlur="if (this.value==''){ldelim}this.value='{$LANG.ordernotesdescription}';{rdelim}">{$notes}</textarea></p>
{/if}

{if $accepttos}
<p align="center"><input type="checkbox" name="accepttos" id="accepttos" /> <label for="accepttos">{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></label><p>
{/if}

<p align="center"><input type="submit" class="btn btn-success btn-lg" value="{$LANG.completeorder} &raquo;"{if $cartitems==0} disabled{/if} onclick="this.value='{$LANG.pleasewait}'" /></p>
<div class="spacing-20"></div>
<p class="text-center">{$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}</p>

</form>

{/if}

</div>

</div>
</div>
</div>