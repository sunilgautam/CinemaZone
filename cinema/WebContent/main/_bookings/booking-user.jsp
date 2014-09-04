<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Login</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
    	$(document).ready(function(){
    		bookingUserHandle();
    		initbookingUser();
    		
    		var validatorUserInput = $("#frm_booking_user").validate({
        		rules: {
        			email: {
    					required: true,
    					email: true
    			},
        			pWord: "required",
        			mobileNo: {
       					required: true,
       					rangelength:[10,10],
        				number: true
        			}
        		},
        		messages: {
        			email: {
    					required: "<s:text name="booking.blank.email"></s:text>",
    					email: "<s:text name="booking.invalid.email"></s:text>"
    				},
        			pWord: "<s:text name="booking.blank.password"></s:text>",
        			mobileNo: {
    					required: "<s:text name="booking.blank.mobile"></s:text>",
    					rangelength: "<s:text name="booking.invalid.mobile"></s:text>",
    					number: "<s:text name="booking.invalid.mobile"></s:text>"
    				}
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
            <%@ include file="/layout/main/header.jsp" %>
        </div>
        <div class="topBottom">
            <!--MENU-->
            <%@ include file="/layout/main/menu.jsp" %>
        </div>
    </div>
</div>
<div class="completeWidth containtFull">
    <div class="keepCenter containtWrapper" style="background-color: #fff;">
        <!--CONTENT-->
        <!--FOR TWO COLUMNS ONLY KEEP contLeft AND contCenter AND CHANGE WIDTH IN CSS-->
        <div class="schedule-block-wrapper">
        	<div class="nowshowingtop">
            	<span><s:text name="booking.user.login"></s:text></span>
           	</div>
           	<div class="error-info-Div">
				<ul class="errorList">
					<li><s:text name="forms.mandetory"></s:text></li>
					<s:actionmessage/>
					<s:actionerror />
				</ul>
			</div>
        	<s:form id="frm_booking_user" name="frm_booking_user" action="booking-post-user" method="POST" theme="simple">
		    <table class="form_table" style="width:100%;">
		        <tr>
		        	<td class="label_cell" style="width: 165px;">
		                <label class="labelClass" for=""><s:text name="booking.user.email"></s:text></label>
		            </td>
		            <td class="control_cell">
		                <s:textfield name="email" id="email" value="" cssClass="inpText" maxlength="80" cssStyle="width:250px;" />
		            </td>
		        </tr>
		        <tr>
		        	<td class="label_cell" style="width: 165px;">
		                &nbsp;
		            </td>
		            <td class="control_cell">
		                <label class="labelClass usertype" for="user-registered">
		                	<input type="radio" name="userType" id="user-registered" checked="checked" value="R" />
							<s:text name="booking.user.registered"></s:text>
							<br />&nbsp;&nbsp;&nbsp;&nbsp;
							<s:password name="pWord" id="pWord" maxlength="80" value="" cssClass="inpText" />
						</label>
						<label class="labelClass usertype" for="user-anonumous">
							<input type="radio" name="userType" id="user-anonumous" value="A" />
							<s:text name="booking.user.anonymous"></s:text>
							<br />&nbsp;&nbsp;&nbsp;&nbsp;
							<s:textfield name="mobileNo" id="mobileNo" maxlength="10" value="" cssClass="inpText" />
						</label>
		            </td>
		        </tr>
		        <tr>
		        	<td class="label_cell" style="width: 165px;">
		                &nbsp;
		            </td>
		            <td class="control_cell">
		                <s:submit cssClass="myButton" value="%{getText('booking.user.submit')}"></s:submit>
		                <s:a action="schedules" title="" cssClass="anchor margin10"><s:text name="common.cancel"></s:text></s:a>
		            </td>
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
        <%@ include file="/layout/main/footer.jsp" %>
    </div>
</div>
</body>
</html>