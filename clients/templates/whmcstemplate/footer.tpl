
        </div><!-- /.main-content -->
        {if $secondarySidebar->hasChildren()}
            <div class="col-md-3 pull-md-left sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
            </div>
        {/if}
    </div>
    <div class="clearfix"></div>
</section>
<!-- FOOTER -->
<div class="footer">
<div class="container">
   <div class="row">
   <div class="col-sm-3">
    <h4>VPS Hosting</h4>
    <ul>
      <li><a href="https://www.glideservers.com/ssd-vps" title="">SSD VPS</a></li>
      <li><a href="https://www.glideservers.com/vps" title="">HDD VPS</a></li>
    </ul>
  </div>
  <div class="col-sm-3">
    <h4>Support</h4>
    <ul>
      <li><a href="https://www.glideservers.com/clients/submitticket.php" title="">Support Tickets</a></li>
      <li><a href="https://www.glideservers.com/clients/knowledgebase.php?action=displayarticle&id=9" title="">Acceptable Usage Policy</a></li>
      <li><a href="https://www.glideservers.com/clients/knowledgebase.php?action=displayarticle&id=10" title="">Terms & Conditions</a></li>
    </ul>
  </div>
</div>
</div>
</div>
</div>
<!-- END FOOTER -->
<!-- SOCIAL & COPYRIGHT -->
<div class="social">
  <div class="row">
    <div class="col-sm-12">
     <ul class="social-links">
	  <li><a href="https://www.facebook.com/glideservers" title="Facebook"><i class="fa fa-facebook"></i></a></li>
      <li><a href="https://twitter.com/GlideServers" title="Twitter"><i class="fa fa-twitter"></i></a></li>
    </ul>
    <p class="text-center">Copyright© GlideServers 2017. All rights reserved.</p>
  </div>
</div>
</div>
<!-- END OF SOCIAL & COPYRIGHT -->
<script src="{$BASE_PATH_JS}/bootstrap.min.js"></script>
<script src="{$BASE_PATH_JS}/jquery-ui.min.js"></script>
<script type="text/javascript">
    var csrfToken = '{$token}';
</script>
<script src="{$WEB_ROOT}/templates/{$template}/js/hoverIntent.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/superfish.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/jquery.slicknav.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/custom.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/whmcs.js"></script>
{$footeroutput}
</body>
</html>
