<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
    <script type="text/javascript">
		$(document).ready(function() {
    	var validator = $("#frm_register_user").validate({
    		rules: {
    			email: {
    					required: true,
    					email: true
    			},
    			password: {
						required: true,
    					minlength: 5
    			},
    			confPassword: {
    				required: true,
    				equalTo: "#password"
    			},
    			firstName: "required",
   				cityId: "required",
   				mobileNo: {
   					required: true,
   					rangelength:[10,10],
    				number: true
    			}
    		},
    		messages: {
    			email: {
					required: "<s:text name="register.blank.email"></s:text>",
					email: "<s:text name="register.invalid.email"></s:text>"
				},
				password: {
					required: "<s:text name="register.blank.password"></s:text>",
					minlength: "<s:text name="register.invalid.password"></s:text>"
				},
				confPassword: {
					required: "<s:text name="register.blank.confirm"></s:text>",
					equalTo: "<s:text name="register.invalid.confirm"></s:text>"
				},
				firstName: "<s:text name="register.blank.fname"></s:text>",
				cityId: "<s:text name="register.blank.city"></s:text>",
				mobileNo: {
					required: "<s:text name="register.blank.mobile"></s:text>",
					rangelength: "<s:text name="register.invalid.mobile"></s:text>",
					number: "<s:text name="register.invalid.mobile"></s:text>"
				}
    		},
    		submitHandler: function(form) {
    			doUserRegister(form);
			}
    	});
	    });
	</script>
	<div class="error-info-Div">
		<ul class="errorList">
			<li><s:text name="forms.mandetory"></s:text></li>
			<s:actionmessage/>
			<s:actionerror />
		</ul>
	</div>
	<s:form id="frm_register_user" name="frm_register_user" action="user_register" method="POST" theme="simple">
    <table class="form_table" style="width:100%;">
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.email"></s:text></label>
            </td>
            <td class="control_cell">
                <s:textfield name="email" id="email" cssClass="inpText" maxlength="80" cssStyle="width:250px;" />
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.password"></s:text></label>
            </td>
            <td class="control_cell">
                <s:password name="password" id="password" cssClass="inpText" cssStyle="width:250px;" />
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.confirm"></s:text></label>
            </td>
            <td class="control_cell">
                <s:password name="confPassword" id="confPassword" maxlength="80" cssClass="inpText" cssStyle="width:250px;" />
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.fname"></s:text></label>
            </td>
            <td class="control_cell">
                <s:textfield name="firstName" id="firstName" maxlength="30" cssClass="inpText" cssStyle="width:250px;" />
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.lname"></s:text></label>
            </td>
            <td class="control_cell">
                <s:textfield name="lastName" id="lastName" maxlength="30" cssClass="inpText" cssStyle="width:250px;" />
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.gender"></s:text></label>
            </td>
            <td class="control_cell">
                <input type="radio" name="gender" id="gender-male" checked="checked" value="Male" />
				<label for="gender-male"><s:text name="register.gender.male"></s:text></label>
				&nbsp;&nbsp;
				<input type="radio" name="gender" id="gender-female" value="Female" />
				<label for="gender-female"><s:text name="register.gender.female"></s:text></label>
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.city"></s:text></label>
            </td>
            <td class="control_cell">
                <s:select name="cityId" id="cityId" list="citiesList" cssClass="dropList" headerKey="" headerValue="Select"></s:select>
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                <label class="labelClass" for=""><s:text name="register.mobile"></s:text></label>
            </td>
            <td class="control_cell">
                <s:textfield name="mobileNo" id="mobileNo" maxlength="10" cssClass="inpText" cssStyle="width:250px;" />
            </td>
        </tr>
        <tr>
        	<td class="label_cell">
                &nbsp;
            </td>
            <td class="control_cell">
                <s:submit cssClass="myButton" value="%{getText('common.save')}"></s:submit>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <div id="register-form-message-element" class="schedule-form-message">
                	
                </div>
            </td>
        </tr>
    </table>
</s:form>