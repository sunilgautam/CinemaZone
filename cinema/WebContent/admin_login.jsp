<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Login</title>
    <%@ include file="layout/adm/scripts.jsp" %>
    <script type="text/javascript">
		$(document).ready(function() { 
    	var validator = $("#admin_login").validate({
    		rules: {
    			uName: "required",
    			pWord: "required"
    		},
    		messages: {
                uName: "<s:text name="login.error.blankusername"></s:text>",
    			pWord: "<s:text name="login.error.blankpassword"></s:text>"
    		},
    		// the errorPlacement has to take the table layout into account
    		errorPlacement: function(error, element) {
				error.appendTo ( element.next());
    		}
    	});
    });
	</script>
</head>
<body>
<div class="completeWidth topFull">
    <div class="keepCenter topWrapper">
        <div class="topLeft">
            <!--HEADER-->
            <%@ include file="layout/main/header.jsp" %>
        </div>
    </div>
</div>
<div class="completeWidth containtFull">
    <div class="loginform keepCenter containtWrapper">
        <!--CONTENT-->
        <div>
			<div class="error-info-Div">
				<ul class="errorList">
					<li><s:text name="forms.mandetory"></s:text></li>
					<s:actionmessage/>
					<s:actionerror />
				</ul>
			</div>
			<s:form id="admin_login" name="admin_login" action="admin_login" method="POST" theme="simple">
				<table class="logintable">
					<tr>
						<td class="tc1">
							<label for="uName" class="labelClass"><s:text name="login.lblusername" /></label>
						</td>
						<td class="tc2">
							<s:textfield name="uName" id="uName" maxlength="50" cssClass="inpText" />
							<div class="error-holder "></div>
						</td>
					</tr>
					<tr>
						<td class="tc1">
							<label for="pWord" class="labelClass"><s:text name="login.lblpassword" /></label>
						</td>
						<td class="tc2">
							<s:password name="pWord" id="pWord" maxlength="50" cssClass="inpText" />
							<div class="error-holder "></div>
						</td>
					</tr>
					<tr>
						<td class="tc1">&nbsp;</td>
						<td class="tc2"><s:submit cssClass="myButton" value="%{getText('login.submit')}"></s:submit></td>
					</tr>
				</table>
			</s:form>
		</div>
		<div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="completeWidth footerFull">
    <div class="keepCenter footerWrapper">
        <!--FOOTER-->
    </div>
</div>
</body>
</html>