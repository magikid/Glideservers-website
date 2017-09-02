<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div class="row spacing-40">
<div class="col-sm-2">

{include file="orderforms/verticalsteps/verticalsteps.tpl" step=5}

</div>
<div class="col-sm-10">
<h5 class="text-center">{$LANG.cartexistingclientlogin}</h5>

{if $incorrect}<div class="spacing-20">
 <div class="alert alert-danger text-center login-incorrect"  role="alert">{$LANG.loginincorrect}</div></div>{/if}

<p class="text-center">{$LANG.cartexistingclientlogindesc}</p>

<form action="dologin.php" method="post">
<div class="row">
<div class="col-sm-7 center-block">
<table id="masspay-table" class="responsive tablesaw tablesaw-stack" data-mode="stack">
<tr><td>{$LANG.loginemail}:</td><td><input type="text" name="username" value="{$username}" /></td></tr>
<tr><td>{$LANG.loginpassword}:</td><td><input type="password" name="password" /></td></tr>
</table>
</div>
</div>
<p align="center"><input type="submit" value="{$LANG.loginbutton}"  class="btn btn-danger"/></p>

</form>

<div class="spacing-20"></div>
<p class="text-center"><strong>{$LANG.loginforgotten}</strong>
<br/><a href="pwreset.php" target="_blank">{$LANG.loginforgotteninstructions}</a></p>

</div>
</div>