<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Processing payment ...</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	window.history.forward(1);
    	$(document).ready(function(){
    		setTimeout(function(){window.location="booking-process-payment.action";}, 2000);
    	});
    </script>
</head>
<body>
	<div class="request-process">
		<s:text name="booking.payment.processing"></s:text>
	</div>
</body>
</html>