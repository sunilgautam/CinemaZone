<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Payment</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	window.history.forward(1);
    	$(document).ready(function(){
    		
    	});
    </script>
</head>
<body>
<div class="completeWidth topFull">
    <div class="keepCenter topWrapper">
        <div class="topLeft">
            <!--HEADER-->
            <%@ include file="/layout/main/header.jsp" %>
        </div>
    </div>
</div>
<div class="completeWidth topFull keepCenter">
    <div class="payment-result">
    	<s:if test="successFlag==true">
    		<div class="payment-result-pass">
	    		<s:text name="booking.payment.processing.success"></s:text>
    		</div>
    	</s:if>
    	<s:else>
    		<div class="payment-result-fail">
    			<s:text name="booking.payment.processing.fail"></s:text>
    		</div>
    	</s:else>
    	<div class="payment-result-option">
    		<h3>
    			<s:text name="booking.payment.processing.go"></s:text>
    			<s:a action="home" title="" cssClass="anchor"><s:text name="common.home"></s:text></s:a>
    		</h3>
    	</div>
    </div>
</div>
</body>
</html>