<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Trailers<s:property value="search"/> </title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script src="<%= application.getInitParameter("domain") + "Scripts/videobox.js" %>" type="text/javascript"></script>
    <script type="text/javascript">
    	$(function() {
	    	var settings = {
	    			containerResizeSpeed: 350
	        };
	        $('.trailer-item-anc').videoBox(settings);
	        
	        trailerHandle();
	    	getVideoDetails("#trailer-list");
    	});
    </script>
</head>
<body>
<div class="completeWidth topFull">
    <div class="keepCenter topWrapper">
        <div class="topLeft">
            <!--HEADER-->
            <%@ include file="/layout/main/header.jsp" %>
        </div>
        <div class="topBottom">
            <!--MENU-->
            <%@ include file="/layout/main/menu.jsp" %>
        </div>
    </div>
</div>
<div class="completeWidth containtFull">
    <div class="keepCenter containtWrapper" style="background-color: #D1D1D1;">
        <!--CONTENT-->
        <!--FOR TWO COLUMNS ONLY KEEP contLeft AND contCenter AND CHANGE WIDTH IN CSS-->

        <div class="left contLeft" style="width: 100%; width: solid 2px #222;">
            <div class="nowshowingwrapper" style="margin: 2px; overflow: hidden;">
                <div class="nowshowingtop">
                    <span><s:text name="trailer.all"></s:text></span>
                </div>
                <div class="nowshowingcontent" style="">
                    <ul id="trailer-list" class="trailer-wrapper">
                    	<!-- TRAILERS WILL BE APPENDED HERE -->
                    	<s:iterator value="trailers" var="trailer">
                    	<li>
                    		<div class="left trailer-container">
                    			<h1 class="posterheader htag">
                    				<s:if test="#trailer.movieName.length()>28">
										<s:property value="#trailer.movieName.substring(0,25)" />...
                    				</s:if>
                    				<s:else>
										<s:property value="#trailer.movieName" />
                    				</s:else>
                    			</h1>
                    			<div class="trailer-item">
                   					<a href="<s:property value='#trailer.trailerLink'/>" class="trailer-item-anc small-loading">
                   						<img class="trailer-item-img" style="display: none;" data-ref='<s:property value='%{extractVideoId(#trailer.trailerLink)}' />' alt="" src="">
									</a>
								</div>
								<h1 class="posterheader ftag">00:00</h1>
							</div>
						</li>
						</s:iterator>
                    </ul>
                    <div class="clear"></div>
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
        <%@ include file="/layout/main/footer.jsp" %>
    </div>
</div>
</body>
</html>