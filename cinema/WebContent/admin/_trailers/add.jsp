<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Trailer - add</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script type="text/javascript">
		$(document).ready(function() {
    	var validator = $("#frm_addtrailer").validate({
    		rules: {
    			movieId: "required",
    			trailerLink: {
                        required: true,
                        url: true
    			}
    		},
    		messages: {
    			movieId: "<s:text name="trailer.blank.movie"></s:text>",
                trailerLink: {
                	required: "<s:text name="trailer.blank.link"></s:text>",
                    url: "<s:text name="trailer.invalid.link"></s:text>"
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
	            <h3><s:text name="trailer.add"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<li><s:text name="trailer.link.example"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:form id="frm_addtrailer" name="frm_addtrailer" action="trailers-add-process" method="POST" theme="simple">
			    <table class="form_table">
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="trailer.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:select name="movieId" id="movieId" list="moviesList" cssClass="dropList" headerKey="" headerValue="Select"></s:select>
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="trailer.link"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <s:textfield name="trailerLink" id="trailerLink" maxlength="150" cssClass="inpText" cssStyle="width: 400px;" />
			            </td>
			        </tr>
			        <tr>
			        	<td class="label_cell">
			                &nbsp;
			            </td>
			            <td class="control_cell">
			                <s:submit cssClass="myButton" value="%{getText('common.save')}"></s:submit>
			                <s:a action="trailers" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
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