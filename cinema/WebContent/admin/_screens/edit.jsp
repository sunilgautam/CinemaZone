<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Screen - edit</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <style type="text/css">
    .big-loading{
	    background-position: center 20px;
	}
    </style>
    <script type="text/javascript">
    	$(document).ready(function() {
    	var validator = $("#frm_editscreen").validate({
    		rules: {
    			screenName: "required",
    			seatPatternId: "required"
    		},
    		messages: {
                screenName: "<s:text name="screen.blankname"></s:text>",
                seatPatternId: "<s:text name="screen.blank.pattern"></s:text>"
    		}
    	});
        
	    changeSeatPattern();
	    var selectedpattern = $("#seatPatternId").val();
        var target_container = $("#seat-pattern-container");
        dochangeSeatPattern(selectedpattern, target_container);
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
	            <h3><s:text name="screen.edit"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:form id="frm_editscreen" name="frm_editscreen" action="screens-edit-process" method="POST" theme="simple">
			    <table class="form_table">
			    	<tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="screen.view.id"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="labelClass" for=""><s:property value="screen.getScreenId()"/></label>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="screen.name"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="screenName" maxlength="50" id="screenName" cssClass="inpText" value="%{screen.getScreenName()}"></s:textfield>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="screen.pattern"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select name="seatPatternId" id="seatPatternId" list="patterns" cssClass="dropList" headerKey="" headerValue="Select" value="%{screen.getSeatPatternId()}"></s:select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <s:hidden name="screenId" value="%{screen.getScreenId()}"></s:hidden>
			            </td>
			            <td class="control_cell">
			                <s:submit cssClass="myButton" value="%{getText('common.update')}"></s:submit>
			                <s:a action="screens" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
			            </td>
			        </tr>
			    </table>
			</s:form>
			<div id="seat-pattern-container">
       			
       		</div>
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