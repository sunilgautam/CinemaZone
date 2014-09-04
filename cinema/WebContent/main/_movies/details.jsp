<%@page import="net.sourceforge.jtds.jdbc.DateTime"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Movie - Details</title>
    <%@ include file="/layout/main/scripts.jsp" %>
    <script type="text/javascript">
		
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
				<div>
					<div class="details-header-wrapper">
						<div class="details-header">
							<s:property value="movieInfo.movieName"/>
							<s:property value="movieInfo.cbRating"/>
						</div>
						
						<!-- BACK ACTION BASED ON SOURCE -->
						<s:if test='src=="h"'>
							<s:a action="home" cssClass="topNav" title="%{getText('movie.back.home')}">
								<s:text name="common.home"></s:text>
							</s:a>
						</s:if>
						<s:elseif test='src=="m"'>
							<s:a action="movies" cssClass="topNav" title="%{getText('movie.back.movies')}">
								<s:text name="common.back"></s:text>
							</s:a>
						</s:elseif>
						<s:elseif test='src=="s"'>
							<s:a action="search-movies" cssClass="topNav" title="%{getText('movie.back.search')}">
								<s:param name="search" value="val"></s:param>
								<s:text name="common.back"></s:text>
							</s:a>
						</s:elseif>
						<s:else>
							<s:a action="home" cssClass="topNav" title="%{getText('movie.back.home')}">
								<s:text name="common.home"></s:text>
							</s:a>
						</s:else>
					</div>
					<table>
						<tr>
							<td rowspan="7" valign="top" style="padding: 10px;">
						    	<div class="poster-view-inner">
					    			<div class="poster-view-blocks">
						    			<img width="95" height="140" class="main-img" alt="" src="<s:property value='movieInfo.mainPosterPic'/>" />
						    		</div>
						    	</div>
						    	<s:if test="movieInfo.canBuy==true">
						    		<!-- TICKETS CAN BE SOLD -->
						    		<div class="posterbuy">
	                                    <s:a action="bookings" title="Buy tickets">
											<s:param name="movieId" value="movieInfo.movieId"></s:param>
											<s:param name="movieName" value="movieInfo.movieName"></s:param>
										</s:a>
                                	</div>
						    	</s:if>
						    	<s:else>
						    		<!-- TICKETS CAN NOT BE SOLD -->
						    	</s:else>
							</td>
							<td>
								<p>
								<label class="labelClass details-label" for=""><s:text name="movie.view.director"></s:text></label>
								<label class="labelClass left" for=""><s:property value="movieInfo.director"/></label>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>
								<label class="labelClass details-label" for=""><s:text name="movie.view.cast"></s:text></label>
								<label class="labelClass left" for=""><s:property value="movieInfo.cast"/></label>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>
								<label class="labelClass details-label" for=""><s:text name="movie.view.genre"></s:text></label>
								<label class="labelClass left" for=""><s:property value="movieInfo.genre"/></label>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>
								<label class="labelClass details-label" for=""><s:text name="movie.view.lang"></s:text></label>
								<label class="labelClass left" for=""><s:property value="movieInfo.lang"/></label>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>
								<label class="labelClass details-label" for=""><s:text name="movie.view.duration"></s:text></label>
								<label class="labelClass left" for=""><s:property value="movieInfo.duration"/></label>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>
								<label class="labelClass details-label" for=""><s:text name="movie.view.releaseDate"></s:text></label>
								<label class="labelClass left" for=""><s:property value="movieInfo.releaseDate"/></label>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>
								<label class="labelClass details-label" for=""><s:text name="movie.view.cbRating"></s:text></label>
								<label class="labelClass left" for=""><s:property value="movieInfo.cbRating"/></label>
								</p>
							</td>
						</tr>
					</table>
					<div class="clear"></div>
					<label class="labelClass" for=""><s:text name="movie.view.synopsis"></s:text></label>
					<p><label class="labelClass" for=""><s:property value="movieInfo.synopsis"/></label></p>
					<div style="border-bottom: solid 1px #dcdcdc; height: 5px;"></div>
					<div class="poster-view-wrapper">
				    	<div class="poster-view-inner">
			    		<s:iterator value="movieInfo.otherPosterPic" var="poster">
			    			<div class="poster-view-blocks left">
				    			<img class="main-img" alt="" src="<s:property value='poster'/>" />
				    		</div>
			    		</s:iterator>
			    		<div class="clear"></div>
				    	</div>
				    </div>
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