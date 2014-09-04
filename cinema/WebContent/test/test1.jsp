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
    
    <title>My JSP 'test1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <% //response.setContentType("text/plain"); %>
  <body>
    <h1>Struts 2 Iterator tag example</h1>

	<h3>Simple Iterator</h3>
	<ol>
	<s:iterator value="comboMeals">
	  <li><s:property /></li>
	</s:iterator>
	</ol>
	
	<h3>Iterator with IteratorStatus</h3>
	<table>
	<s:iterator value="comboMeals" status="comboMealsStatus">
	  <tr>
	  	<s:if test="#comboMealsStatus.even == true">
	      <td style="background: #CCCCCC"><s:property/></td>
	    </s:if>
	    <s:elseif test="#comboMealsStatus.first == true">
	      <td><s:property/> (This is first value) </td>
	    </s:elseif>
	    <s:else>
	      <td><s:property/></td>
	    </s:else>
	  </tr>
	</s:iterator>
	</table>
	<br />
	<h3><s:property value="userName"/></h3>
	<br /><br />
	<h4><s:property value="jsonData"/></h4>
	<br />
	<h4><s:property value="path"/></h4>
  </body>
</html>
