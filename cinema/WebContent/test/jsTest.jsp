<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>JSTEST</title>
<%@ include file="/layout/adm/scripts.jsp" %>
    <script src="<%= application.getInitParameter("domain") + "Scripts/ajaxupload.js" %>" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	$(".poster-view-blocks").hover(function(){
    		$(".close-btn",this).fadeIn();
    	},function(){
    		$(".close-btn",this).fadeOut();
    	});
    	
    	$(".testblock").hover(function(){
    		$(".close-btn",this).fadeIn();
    	},function(){
    		$(".close-btn",this).fadeOut();
    	}).find(".close-btn")
    	  .click(function(event){console.info("clicked => " + event.target);})
    	  .end()
    	  .find("#main-check")
    	  .click(function(event){console.info("checkbox clicked => " + event.target);});
    	
    	$("#addNew").click(function(){
    		$(".poster-view-inner").append('<div class="poster-view-blocks left"><a href="javascript:void(0)" class="close-btn" onclick="javascript:doDelete(2,this);"></a><img class="main-img" alt="" src="/cinema/posters/HO00004430.jpg" /><div class="main-detail"><label class="manage-label"><tr><td valign="top" align="right"></td><td valign="top" align="left"><input type="checkbox" name="main-check" value="true" id="main-check" onclick="javascript:doChangeMain(2,this);"/><input type="hidden" id="__checkbox_main-check" name="__checkbox_main-check" value="true" /></td></tr><span>Main</span></label></div></div>');
    	});
    	
    	var posterMn = function(){
    		settings = {
    			addUrl : "posters-add-process.action",
    			changeMainUrl : "posters-edit-process.action",
    			deleteUrl : "posters-delete-process.action",
    			arrayPageSize : [],
    			overlayBgColor: '#fff',
    	        overlayOpacity: 0.8,
    	        validFileTypes : "jpg|png|jpeg|gif|JPG|JPEG|bmp"
    		};
    		doChangeMain = function(posterId, element){
    			console.info("posterId => " + posterId);
    			console.info("element => " + element);
    		},
    		doDelete = function(posterId, element){
    			console.info("posterId => " + posterId);
    			console.info("element => " + element);
    		};
    	};
    	
    	var a = posterMn();
    });
	</script>
</head>
<body>
	<a href="#" id="addNew">Add</a>
	<div class="poster-view-wrapper">
  		<div class="poster-view-inner">
 			<div class="poster-view-blocks left">
 				<a href="javascript:void(0)" class="close-btn" onclick="javascript:doDelete(1,this);"></a>
  				<img class="main-img" alt="" src="/cinema/posters/HO00004430.jpg" />
	  			<div class="main-detail">
	  				<label class="manage-label">
				   <input type="checkbox" name="main-check" id="main-check" checked="checked" onclick="javascript:doChangeMain(1,this);"/>
				   <span>Main</span>
				 </label>
	  			</div>
  			</div>
  		</div>
  		<!-- <div class="poster-view-inner">
 			<div class="poster-view-blocks testblock left">
 				<a href="javascript:void(0)" class="close-btn"></a>
  				<img class="main-img" alt="" src="/cinema/posters/HO00004430.jpg" />
	  			<div class="main-detail">
	  				<label class="manage-label">
				   	<input type="checkbox" name="main-check" id="main-check" checked="checked"/>
				   	<span>Main</span>
				 </label>
	  			</div>
  			</div>
  		</div> -->
  	</div>
</body>
</html>