<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Ticket - edit</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <style type="text/css">
    .big-loading{
	    background-position: center 20px;
	}
    </style>
    <script type="text/javascript">
    	$(document).ready(function() {
    	var validator = $("#frm_editticketcost").validate({
    		rules: {
    			ticketCost: {
    				required: true,
    				number: true
    			}
    		},
    		messages: {
    			ticketCost: {
    				required: "<s:text name="ticketcost.blank.cost"></s:text>",
    				number: "<s:text name="ticketcost.invalid.cost"></s:text>"
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
            <%@ include file="/layout/adm/header.jsp" %>
        </div>
        <div class="topBottom">
            <!--MENU-->
            <%@ include file="/layout/adm/menu.jsp" %>
        </div>
    </div>
</div>
<div class="completeWidth containtFull">
    <div class="keepCenter containtWrapper">
        <!--CONTENT-->
        <div class="content-box">
	        <div class="content-box-header">
	            <h3><s:text name="ticketcost.edit"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:form id="frm_editticketcost" name="frm_editticketcost" action="tickets-edit-process" method="POST" theme="simple">
			    <table class="form_table">
			    	<tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="ticketcost.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="movieName" id="movieName" cssClass="inpText" cssStyle="border-width: 0px; width: 500px; outline: none;" readonly="true" value="%{ticketcost.getMovieName()}" />
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="ticketcost.seattype"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="seatType" id="seatType" cssClass="inpText" cssStyle="border-width: 0px; width: 500px; outline: none;" readonly="true" value="%{ticketcost.getSeatType()}" />
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="ticketcost.cost"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="ticketCost" id="ticketCost" maxlength="15" cssClass="inpText" value="%{ticketcost.getTicketCost()}" />
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <s:hidden name="ticketCostId" value="%{ticketcost.getTicketCostId()}"></s:hidden>
			            </td>
			            <td class="control_cell">
			                <s:submit cssClass="myButton" value="%{getText('common.update')}"></s:submit>
			                <s:a action="tickets" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
			            </td>
			        </tr>
			    </table>
			</s:form>
			</div>
		</div>
		<div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="completeWidth footerFull">
    <div class="keepCenter footerWrapper">
        <!--FOOTER-->
        <%@ include file="/layout/adm/footer.jsp" %>
    </div>
</div>
</body>
</html>