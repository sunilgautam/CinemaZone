<%@page import="cinema.main.action.SearchProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="cinema.domain.pojo.UserInfo"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<div class="menuContainer">
	<ul class="menuBar">
        <li><a href="<%= application.getInitParameter("domain") + "home.action" %>" title="">Home</a></li>
        <li><a href="<%= application.getInitParameter("domain") + "movies.action" %>" title="">Movies</a></li>
        <li><a href="<%= application.getInitParameter("domain") + "trailers.action" %>" title="">Trailer</a></li>
        <li><a href="<%= application.getInitParameter("domain") + "schedules.action" %>" title="">Schedule</a></li>
	</ul>
</div>
<div id="searchDiv">
    <div id="searchContainer">
        <input id="searchInput" type="text" maxlength="50" value="Search Movie........" />
        <a href="#" id="searchBtn"></a>
    </div>
</div>
<div id="signingBlock">
    <ul>
        <%
			try
			{
				if (session.getAttribute(cinema.util.Constants.USER_HANDLE) != null) 
				{
				    UserInfo uInfo = (UserInfo) session.getAttribute(cinema.util.Constants.USER_HANDLE);
					if (uInfo != null) 
					{
					    //LOGGED IN USER
					    %>
					    <li>
					    	<span class="welcome">Hi
					    		<span id="userspan">
					    			<a href="<%= application.getInitParameter("domain") + "mybooking.action?userId=" + uInfo.getUserId() + "&userName=" + uInfo.getUserName() %>" title="My Bookings"><%= uInfo.getUserName() %></a>
					    		</span>
					    	</span>
					    </li>
        				<li>,</li>
					    <li>&nbsp;|&nbsp;</li>
				        <li>
				        	<a href="<%= application.getInitParameter("domain") + "logout.action" %>" title="Logout">Logout</a>
				        </li>
					    <%
					} 
					else 
					{
					    //GUEST USER
					    //response.sendRedirect(cinema.util.Constants.DEFAULT_LOGIN_URI_JSP);
					    %>
					    <li>
					    	<span class="welcome">Hi<span id="userspan">Guest</span></span>
					    </li>
        				<li>,</li>
					    <li>
					    	<a href="javascript:void(0)" title="Login" onclick="showLoginForm();">Login</a>
					    </li>
				        <li>&nbsp;|&nbsp;</li>
				        <li>
				        	<a href="javascript:void(0)" title="New User? Register" onclick="showRegisterForm();">Register</a>
				        </li>
				        <%
					}
				} 
				else 
				{
				  	//GUEST USER
				  	//response.sendRedirect(cinema.util.Constants.DEFAULT_LOGIN_URI_JSP);
				    %>
				    <li>
				    	<span class="welcome">Hi<span id="userspan">Guest</span></span>
				    </li>
					<li>,</li>
				    <li>
				    	<a href="javascript:void(0)" title="Login" onclick="showLoginForm();">Login</a>
				    </li>
			        <li>&nbsp;|&nbsp;</li>
			        <li>
			        	<a href="javascript:void(0)" title="New User? Register" onclick="showRegisterForm();">Register</a>
			        </li>
			        <%
				}
			}
			catch(Exception ex)
			{
				response.sendRedirect("error.action");
			}
        
        if (session.getAttribute(cinema.util.Constants.SEARCH_HANDLE) == null) 
        {
            SearchProvider.GetSearchList(session);
        }
		%>
    </ul>
    <script type="text/javascript">
    	var availableSearchOptions = <%= session.getAttribute(cinema.util.Constants.SEARCH_HANDLE).toString() %>;
    </script>
</div>
<div class="clear"></div>