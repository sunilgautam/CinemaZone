<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Poster</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script type="text/javascript">
    
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
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<s:actionmessage />
						<s:actionerror />
					</ul>
				</div>
				<table class="form_table">
			        <tr>
			        	<td class="label_cell">
			                <label class="labelClass" for=""><s:text name="poster.view.movie"></s:text></label>
			            </td>
			            <td class="control_cell">
			                <label class="labelClass" for=""><s:property value="movieName"/></label>
			            </td>
			        </tr>
			    </table>
			    <div class="poster-view-wrapper">
			    	<div class="poster-view-inner">
		    		<s:iterator value="posters" var="poster">
		    			<div class="poster-view-blocks left">
			    			<img class="main-img" alt="" src="<s:property value='posterThumb'/>" />
			    			<div class="main-detail">
		    				<s:if test="mainFlag==true">
		    					<label class="main-icon"></label>
			    				<label class="main-label left">Main</label>
		    				</s:if>
			    			</div>
			    		</div>
		    		</s:iterator>
		    		<div class="clear"></div>
			    	</div>
			    </div>
			    <s:a action="posters" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
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