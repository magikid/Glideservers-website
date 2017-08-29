cat <<DOCUMENT
Content-type: text/html
<!DOCTYPE html>
<html>
<title>$(basename "$PATH_INFO")</title>
<xmp theme="united" style="display:none;">
$(cat "$PATH_TRANSLATED")
</xmp>
<script src="//strapdownjs.com/v/0.2/strapdown.js"></script>
</html>
DOCUMENT