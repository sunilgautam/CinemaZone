<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Seats</title>
<%@ include file="/layout/adm/scripts.jsp" %>
<script src="<%= application.getInitParameter("domain") + "Scripts/videobox.js" %>" type="text/javascript"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function() {
	// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
	var settings = {
			containerResizeSpeed: 350
    };
    $('#videoContainer a').videoBox(settings);
});
</script>
</head>
<body>
<div id="videoContainer">
<a href="http://www.youtube.com/embed/NaL5fqDMms0?rel=0" id="pop" >Model</a>
<a href="http://www.youtube.com/embed/NaL5fqDMms0?rel=0" id="pop" >Model</a>
<a href="http://www.youtube.com/embed/NaL5fqDMms0?rel=0" id="pop" >Model</a>
<a href="http://www.youtube.com/embed/NaL5fqDMms0?rel=0" id="pop" >Model</a>
<a href="http://www.youtube.com/embed/NaL5fqDMms0?rel=0" id="pop" >Model</a>
</div>
</body>
</html>