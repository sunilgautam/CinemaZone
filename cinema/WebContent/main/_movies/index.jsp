<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Movies</title>
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
    <div class="keepCenter containtWrapper" style="background-color: #D1D1D1;">
        <!--CONTENT-->
        <!--FOR TWO COLUMNS ONLY KEEP contLeft AND contCenter AND CHANGE WIDTH IN CSS-->
        <div class="left contLeft" style="width: 100%;">
            <div class="nowshowingwrapper" style="margin: 2px; overflow: hidden;">
                <div class="nowshowingtop">
                    <span><s:text name="home.nowshowing"></s:text></span>
                </div>
                <div class="nowshowingcontent" style="padding-left: 60px;">
                    <ul class="posterwall">
                    <s:iterator value="moviesInfo" var="movieInfo">
                    	<li>
                            <div class="postercontainer">
                                <h1 class="posterheader">
                                	<s:a action="movies-details" title="">
										<s:param name="movieId" value="#movieInfo.movieId"></s:param>
										<s:param name="movieName" value="#movieInfo.movieName"></s:param>
										<s:param name="src">m</s:param>
										<s:if test="#movieInfo.movieName.length()>33"><s:property value="#movieInfo.movieName.substring(0,30)" />...</s:if><s:else><s:property value="#movieInfo.movieName" /></s:else>
									</s:a>
                                </h1>
                                <div class="left posterimage">
                                    <img width="95" height="140" alt="" src="<s:property value='#movieInfo.mainPosterPic'/>" />
                                    <div class="posterbuy">
                                    <s:a action="bookings" title="Buy tickets">
										<s:param name="movieId" value="#movieInfo.movieId"></s:param>
										<s:param name="movieName" value="#movieInfo.movieName"></s:param>
									</s:a>
                                	</div>
                                </div>
                                <div class="left posterdetails">
                                    <span class="posterstar"><s:text name="home.movie.director"></s:text></span>
                                    <span class="posterstarval"><s:if test="#movieInfo.director.length()>35"><s:property value="#movieInfo.director.substring(0,35)" />...</s:if><s:else><s:property value="#movieInfo.director" /></s:else></span>
                                    <span class="posterdir"><s:text name="home.movie.cast"></s:text></span>
                                    <span class="posterdirval"><s:if test="#movieInfo.cast.length()>120"><s:property value="#movieInfo.cast.substring(0,120)" />...</s:if><s:else><s:property value="#movieInfo.cast" /></s:else></span>
                                </div>
                            </div>
                        </li>
                    </s:iterator>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            
            <div class="nowshowingwrapper" style="margin: 2px; overflow: hidden;">
                <div class="nowshowingtop">
                    <span><s:text name="home.upcoming"></s:text></span>
                </div>
                <div class="nowshowingcontent" style="padding-left: 60px;">
                    <ul class="posterwall">
                    <s:iterator value="upcomingMoviesInfo" var="upcomingMovieInfo">
                    	<li>
                            <div class="postercontainer">
                                <h1 class="posterheader">
                                	<s:a action="movies-details" title="">
										<s:param name="movieId" value="#upcomingMovieInfo.movieId"></s:param>
										<s:param name="movieName" value="#upcomingMovieInfo.movieName"></s:param>
										<s:param name="src">m</s:param>
										<s:if test="#upcomingMovieInfo.movieName.length()>33"><s:property value="#upcomingMovieInfo.movieName.substring(0,30)" />...</s:if><s:else><s:property value="#upcomingMovieInfo.movieName" /></s:else>
									</s:a>
                                </h1>
                                <div class="left posterimage">
                                    <img width="95" height="140" alt="" src="<s:property value='#upcomingMovieInfo.mainPosterPic'/>" />
                                    <div class="poster-release"><s:date name="#upcomingMovieInfo.releaseDateName" format="MMM dd, yyyy" /></div>
                                </div>
                                <div class="left posterdetails">
                                    <span class="posterstar"><s:text name="home.movie.director"></s:text></span>
                                    <span class="posterstarval"><s:if test="#upcomingMovieInfo.director.length()>35"><s:property value="#upcomingMovieInfo.director.substring(0,35)" />...</s:if><s:else><s:property value="#upcomingMovieInfo.director" /></s:else></span>
                                    <span class="posterdir"><s:text name="home.movie.cast"></s:text></span>
                                    <span class="posterdirval"><s:if test="#upcomingMovieInfo.cast.length()>120"><s:property value="#upcomingMovieInfo.cast.substring(0,100)" />...</s:if><s:else><s:property value="#upcomingMovieInfo.cast" /></s:else></span>
                                </div>
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