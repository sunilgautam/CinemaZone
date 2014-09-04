<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Admin | Movie</title>
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
	            <h3><s:text name="movie.all"></s:text></h3>
	        </div>
	        <div class="content-box-content">
	            <div class="error-info-Div">
					<ul class="errorList">
						<li><s:text name="forms.mandetory"></s:text></li>
						<s:actionmessage/>
						<s:actionerror />
					</ul>
				</div>
				<s:a action="movies-add" title="" cssClass="anchor"><s:text name="movie.new"></s:text></s:a>
				<s:a action="movies" title="" cssClass="anchor"><s:text name="movie.current"></s:text></s:a>
				<table class="GridClass">
				<thead>
					<tr class="GridHead">
						<th>
							<s:text name="movie.view.id"></s:text>
						</th>
						<th>
							<s:text name="movie.view.name"></s:text>
						</th>
						<th>
							<s:text name="movie.view.director"></s:text>
						</th>
						<th>
							<s:text name="movie.view.releaseDate"></s:text>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="movies" var="movie">
					<tr class="GridRow">
						<td>
							<s:property value="#movie.movieId" />
						</td>
						<td>
							<s:property value="#movie.movieName" />
						</td>
						<td>
							<s:property value="#movie.director" />
						</td>
						<td>
							<s:property value="#movie.releaseDate" />
						</td>
					</tr>
					</s:iterator>
				</tbody>
				</table>
				<s:a action="movies" title="Back" cssClass="anchor margin10"><s:text name="common.back"></s:text></s:a>
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