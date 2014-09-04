<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
    <script type="text/javascript">
		$(document).ready(function() {
    	var validator = $("#user_login").validate({
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
    		},
    		submitHandler: function(form) {
    			doUserLogin(form);
			}
    	});
    });
	</script>
	<s:form id="user_login" name="user_login" action="user_login" method="POST" theme="simple">
		<table class="logintable">
			<tr>
				<td class="tc1">
					<label for="uName" class="labelClass"><s:text name="login.lblusername" /></label>
				</td>
				<td class="tc2">
					<s:textfield name="uName" id="uName" maxlength="80" cssClass="inpText" />
					<div class="error-holder "></div>
				</td>
			</tr>
			<tr>
				<td class="tc1">
					<label for="pWord" class="labelClass"><s:text name="login.lblpassword" /></label>
				</td>
				<td class="tc2">
					<s:password name="pWord" id="pWord" maxlength="80" cssClass="inpText" />
					<div class="error-holder "></div>
				</td>
			</tr>
			<tr>
				<td class="tc1">&nbsp;</td>
				<td class="tc2"><s:submit cssClass="myButton" value="%{getText('login.submit')}"></s:submit></td>
			</tr>
			<tr>
	            <td colspan="2" style="text-align:center;">
	                <div id="login-form-message-element" class="schedule-form-message">
	                	
	                </div>
	            </td>
	        </tr>
		</table>
	</s:form>