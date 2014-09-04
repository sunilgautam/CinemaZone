<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    <%@ include file="/layout/adm/scripts.jsp" %>

  </head>
  
  <body>
    This is TEST. <br>
    <%-- <s:form action="table" >
	    <s:submit />
	</s:form> --%>
	<s:iterator begin="0" end="5" var="a">
		<s:property value="#a"/>K
	</s:iterator>
	<div class="ratings bor half">
		
	</div>
	<div class="ratings one">
		
	</div>
	<div class="ratings one-half">
		
	</div>
	<div class="ratings two">
		
	</div>
	<div class="ratings two-half">
		
	</div>
	<div class="ratings three">
		
	</div>
	<div class="ratings three-half">
		
	</div>
	<div class="ratings four">
		
	</div>
	<div class="ratings four-half">
		
	</div>
	<div class="ratings five">
		
	</div>
  </body>
</html>
