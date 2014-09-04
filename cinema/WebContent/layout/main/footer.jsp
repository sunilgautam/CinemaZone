<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<div class="center footMenuWrape">
    <ul class="footmenuBar">
    	<li><a href="<%= application.getInitParameter("domain") + "home.action" %>" title="">Home</a></li>
    	<li><a href="<%= application.getInitParameter("domain") + "movies.action" %>" title="">Movies</a></li>
    	<li><a href="<%= application.getInitParameter("domain") + "trailers.action" %>" title="">Trailer</a></li>
    	<li><a href="<%= application.getInitParameter("domain") + "schedules.action" %>" title="">Schedule</a></li>
    </ul>
    <div class="clear"></div>
    <script type="text/javascript">
    	$(document).ready(function() {
    		var docHeight = $(window).height();
    		if($(document).height() === docHeight) {
    			var footerElement = $(".footerFull");
    			footerElement.css('marginTop',(docHeight - footerElement.offset().top - 25));
    		}
    		
    		$( "#searchInput" ).autocomplete({
    			source: availableSearchOptions
    		});
    	});
    </script>
</div>