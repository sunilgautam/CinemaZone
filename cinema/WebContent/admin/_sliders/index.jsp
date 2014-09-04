<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Slider</title>
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
	        <div class="content-box-header">
	            <h3><s:text name="slider.all"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:a action="sliders-add" title="" cssClass="anchor"><s:text name="slider.new"></s:text></s:a>
				<table class="GridClass">
				<thead>
					<tr class="GridHead">
						<th>
							<s:text name="movie.view.name"></s:text>
						</th>
						<th>
							&nbsp;
						</th>
						<th>
							&nbsp;
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="sliders" var="slider">
					<tr class="GridRow">
						<td>
							<s:property value="#slider.movieName" />
						</td>
						<td>
							<s:a action="sliders-view" title="" cssClass="anchor">
								<s:param name="sliderId" value="#slider.sliderId"></s:param>
								<s:text name="common.view"></s:text>
							</s:a>
						</td>
						<td>
							<s:a action="sliders-view" title="" data-target="sliders-delete-process" data-label="sliderId" data-input="#{slider.sliderId}" cssClass="anchor" onclick="return deleteHandle(this);">
								<s:param name="sliderId" value="#slider.sliderId"></s:param>
								<s:text name="common.delete"></s:text>
							</s:a>
						</td>
					</tr>
					</s:iterator>
				</tbody>
				</table>
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