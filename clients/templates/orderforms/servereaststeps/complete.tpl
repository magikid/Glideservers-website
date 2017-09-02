<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=5}

</div>

<div class="col-sm-10">

<h5 class="text-center">{$LANG.orderconfirmation}</h5>
<hr class="full"/>
<p  class="text-center">{$LANG.orderreceived}</p>

<div class="orderbox ordernum">
    {$LANG.ordernumberis} {$ordernumber}
</div>

<p>{$LANG.orderfinalinstructions}</p>

{if $invoiceid && !$ispaid}
<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">{$LANG.ordercompletebutnotpaid}</div></div>
<p align="center"><a href="viewinvoice.php?id={$invoiceid}" target="_blank">{$LANG.invoicenumber}{$invoiceid}</a></p>
{/if}

{foreach from=$addons_html item=addon_html}
<div class="spacing-20"></div>
<p>{$addon_html}</p>
<div class="spacing-20"></div>
{/foreach}

{if $ispaid}
<!-- Enter any HTML code which needs to be displayed once a user has completed the checkout of their order here - for example conversion tracking and affiliate tracking scripts -->
{/if}

<p align="center"><a href="clientarea.php">{$LANG.ordergotoclientarea}</a></p>

</div>

</div>
</div>
</div>