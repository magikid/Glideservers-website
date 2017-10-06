
        </div><!-- /.main-content -->
        {if $secondarySidebar->hasChildren()}
            <div class="col-md-3 pull-md-left sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
            </div>
        {/if}
    </div>
    <div class="clearfix"></div>
</section>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<!-- FOOTER -->
<div w3-include-html="https://www.glideservers.com/includes/footer.html" class="footer"></div>
<!-- END FOOTER -->
<!--  NAVIGATION MENU AREA -->
 <div w3-include-html="https://www.glideservers.com/includes/social.html" class="social"></div>
 
<script src="{$BASE_PATH_JS}/bootstrap.min.js"></script>
<script src="{$BASE_PATH_JS}/jquery-ui.min.js"></script>
<script>
     w3.includeHTML();
 </script>
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
