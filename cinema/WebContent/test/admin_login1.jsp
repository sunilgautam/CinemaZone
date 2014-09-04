<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><s:text name="login.title"/></title>
    <c:set var="url">${pageContext.request.requestURL}</c:set>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" ></base>
    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" ></link>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" ></link>
    <link href="Styles/baseStyle.css" rel="stylesheet" type="text/css" ></link>
    <!--[if lt IE 8]>
        <link href="Styles/ieStyle.css" rel="stylesheet" type="text/css" ></link>
    <![endif]-->
    <script src="Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.infinitecarousel3.min.js" type="text/javascript"></script>
    <script src="Scripts/easing.js" type="text/javascript"></script>
    <script src="Scripts/slider.js" type="text/javascript"></script>
</head>
<body>
<div class="completeWidth topFull">
    <div class="keepCenter topWrapper">
        <div class="topLeft">
            <a href="#" class="mainLogo" title="Cinema Zone"></a>
        </div>
    </div>
</div>
<div class="completeWidth containtFull">
    <div class="loginform keepCenter containtWrapper">
        <!--FOR TWO COLUMNS ONLY KEEP contLeft AND contCenter AND CHANGE WIDTH IN CSS-->
        <div>
            <div class="errorDiv">
                <ul class="errorList">
                    <li>* fields are mandetory</li>
                <s:actionerror/>
                </ul>
            </div>
            <s:form action="admin_login" method="POST">
                <table class="logintable">
                    <tr>
                        <td class="tc1">
                            <label for="uName" class="labelClass"><s:text name="login.lblusername"/></label>
                        </td>
                        <td class="tc2">
                            <s:textfield name="uName" cssClass="inpText" />
                        </td>
                        <td class="tc3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="tc1">
                            <label for="uName" class="labelClass"><s:text name="login.lblpassword"/></label>
                        </td>
                        <td class="tc2">
                            <s:textfield name="pWord" cssClass="inpText" />
                        </td>
                        <td class="tc3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="tc1">
                            &nbsp;
                        </td>
                        <td class="tc2">
                            <s:submit cssClass="myButton" value="%{getText('login.submit')}"></s:submit>
                        </td>
                        <td class="tc3">
                            &nbsp;
                        </td>
                    </tr>
                </table>                
            </s:form>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="completeWidth footerFull">
    <div class="keepCenter footerWrapper">
        <div class="center footMenuWrape">
            
            <div class="clear"></div>
        </div>
    </div>
</div>
</body>
</html>