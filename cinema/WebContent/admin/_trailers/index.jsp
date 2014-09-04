<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Trailer</title>
    <%@ include file="/layout/adm/scripts.jsp" %>
    <script src="<%= application.getInitParameter("domain") + "Scripts/videobox.js" %>" type="text/javascript"></script>
    <script type="text/javascript">
    $(function() {
    	// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
    	var settings = {
    			containerResizeSpeed: 350
        };
        $('.video-preview-link').videoBox(settings);
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
	            <h3><s:text name="trailer.all"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:a action="trailers-add" title="" cssClass="anchor"><s:text name="trailer.new"></s:text></s:a>
				<table class="GridClass">
				<thead>
					<tr class="GridHead">
						<th>
							<s:text name="trailer.view.id"></s:text>
						</th>
						<th>
							<s:text name="trailer.view.movie"></s:text>
						</th>
						<th>
							<s:text name="trailer.view.link"></s:text>
						</th>
						<th>
							&nbsp;
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
					<s:iterator value="trailers" var="trailer">
					<tr class="GridRow">
						<td>
							<s:property value="#trailer.trailerId" />
						</td>
						<td>
							<s:property value="#trailer.movieName" />
						</td>
						<td>
							<s:property value="#trailer.trailerLink" />
						</td>
						<td>
							<s:a value="%{#trailer.trailerLink}" title="" cssClass="anchor video-preview-link"><s:text name="common.preview"></s:text></s:a>
						</td>
						<td>
							<s:a action="trailers-edit" title="" cssClass="anchor">
								<s:param name="trailerId" value="#trailer.trailerId"></s:param>
								<s:text name="common.edit"></s:text>
							</s:a>
						</td>
						<td>
							<s:a action="trailers-view" title="" data-target="trailers-delete-process" data-label="trailerId" data-input="#{trailer.trailerId}" cssClass="anchor" onclick="return deleteHandle(this);">
								<s:param name="trailerId" value="#trailer.trailerId"></s:param>
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