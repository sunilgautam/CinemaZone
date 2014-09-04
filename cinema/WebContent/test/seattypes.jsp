<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Seats</title>
<%@ include file="/layout/adm/scripts.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	var validator = $("#frm_addseatprice").validate({
		rules:{
			ddl: "required"
		},
		messages:{
			ddl: "Select"
		}
	});
    });
</script>
</head>
<body>
	<table class="GridClass">
	<s:iterator value="seattypes" status="seattype">
	<tr>
		<td>
		<s:property value="getSeatTypeId()"/>
		</td>
		<td>
		<s:property value="getSeatType()"/>
		</td>
		<td>
		<s:property value="getBasePrice()"/>
		</td>
	</tr>
	</s:iterator>
	</table>
	
	<s:form id="frm_addseatprice1" name="frm_addseatprice1" action="screens-add-process" method="POST" theme="simple">
	    <table class="form_table">
	    	<s:iterator value="seattypes" status="seattype">
	        <tr>
	        	<td class="label_cell">
	                <label class="labelClass" for=""><s:property value="getSeatType()"/></label>
	            </td>
	            <td class="control_cell">
	                <s:textfield name="screenName" id="screenName" type="email" cssClass="inpText" value="%{getBasePrice()}" />
	            </td>
	        </tr>
	        </s:iterator>
	        <tr>
	        	<td class="label_cell">
	                &nbsp;
	            </td>
	            <td class="control_cell">
	                <s:submit cssClass="myButton" value="%{getText('common.save')}"></s:submit>
	                <s:a action="screens" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
	            </td>
	        </tr>
	    </table>
	</s:form>
	
	<form id="frm_addseatprice" name="frm_addseatprice" action="/cinema/seattypestest.action" method="POST">
	    <table class="form_table">
	    	<tr>
	        	<td class="label_cell">
	                <label class="labelClass" for="">Select</label>
	            </td>
	            <td class="control_cell">
	                <select name="ddl" id="ddl" class="dropList">
	                	<option value>Select</option>
	                	<option value="1">123</option>
	                	<option value="2">456</option>
	                </select>
	            </td>
	        </tr>
	        <tr>
	        	<td class="label_cell">
	                <label class="labelClass" for="">Platinum</label>
	            </td>
	            <td class="control_cell">
	                <input type="text" name="dt1" id="dt1" value="250" class="inpText" required="true" number="true" />
	                <input type="hidden" name="dt0" value="1" />
	                <s:textfield ></s:textfield>
	            </td>
	        </tr>
	        <tr>
	        	<td class="label_cell">
	                <label class="labelClass" for="">Golden</label>
	            </td>
	            <td class="control_cell">
	                <input type="text" name="dt1" id="dt2" value="200" class="inpText" required="true" number="true" />
	                <input type="hidden" name="dt0" value="2" />
	            </td>
	        </tr>
	        <tr>
	        	<td class="label_cell">
	                <label class="labelClass" for="">Silver</label>
	            </td>
	            <td class="control_cell">
	                <input type="text" name="dt1" id="dt3" value="150" class="inpText" required="true" number="true" />
	                <input type="hidden" name="dt0" value="3" />
	            </td>
	        </tr>
	        <tr>
	        	<td class="label_cell">
	                &nbsp;
	            </td>
	            <td class="control_cell">
	                <input type="submit" id="frm_addseatprice_0" value="Save" class="myButton"/>
	                <a id="frm_addseatprice_" href="/cinema/screens.action" class="anchor margin10" title="Back">Back</a>
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>