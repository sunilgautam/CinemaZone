var handleLogin = function(){
	var dialogBox;
	settings = {
			arrayPageSize : [],
			overlayBgColor: '#fff',
	        overlayOpacity: 0.8,
	        loginUrl: "login.action",
	        registerUrl: "register.action",
	        accountUrl: "mybooking.action"
	};
	showLoginForm = function(formObj){
		var form = $(formObj);
    	//var messageElement = form.find(".schedule-form-message");
    	//messageElement.empty().addClass('big-loading');
    	var dialogHolder = $("#dialog-holder");
    	dialogHolder.empty().html("Loading...");
    	dialogBox = dialogHolder.dialog({
    		 								title:"Login",
											height: 250,
											width: 350,
											modal: true
										});
    	
    	$.ajax({
            type: "POST",
            url: globalSettings.baseUrl + settings.loginUrl,
            cache: false,
            dataType: "html",
            data: {},
            success: function(data){
            	dialogHolder.html(data);
            },
            error: function(){
            	dialogHolder.html("Error occurred. Please try again.");
            }
        });
	},
	showRegisterForm = function(formObj){
		var form = $(formObj);
    	//var messageElement = form.find(".schedule-form-message");
    	//messageElement.empty().addClass('big-loading');
    	var dialogHolder = $("#dialog-holder");
    	dialogHolder.empty().html("Loading...");
    	dialogBox = dialogHolder.dialog({
    		 								title:"Registration",
											height: 500,
											width: 650,
											modal: true
										});
    	
    	$.ajax({
            type: "POST",
            url: globalSettings.baseUrl + settings.registerUrl,
            cache: false,
            dataType: "html",
            data: {},
            success: function(data){
            	dialogHolder.html(data);
            },
            error: function(){
            	dialogHolder.html("Error occurred. Please try again.");
            }
        });
	},
	doUserLogin = function(formObj){
		var form = $(formObj);
		var messageElement = form.find("#login-form-message-element");
    	messageElement.empty().addClass('big-loading');
    	var POSTDATA = form.serializeArray();
    	
    	$.ajax(
        {
            type: "POST",
            url: form.attr("action"),
            cache: false,
            dataType: "json",
            data: POSTDATA,
            success: function(data){
            	if(data.result == 'SUCCESS') {
            		messageElement.removeClass('big-loading').html("Done.");
            		var userData = data.data.split("||");
            		for(var i = 0; i < userData.length; i++)
            		{
            			if(userData[i] === "null") {
            				userData[i] = "";
                		}
            		}
            		//userId 0
            		//userName 1
            		//email 2
            		//fName 3
            		//lName 4
            		//gender 5
            		//mobileNo 6
            		//city 7
            		var ulString = "<li><span class=\"welcome\">Hi<span id=\"userspan\">";
            		ulString += "<a href=\"" + globalSettings.baseUrl + settings.accountUrl + "?userId=" + userData[0] + "&userName=" + userData[1] + "\" title=\"My Bookings\">" + userData[1] + "</a> </span></span></li>";
            		ulString += "<li>,</li><li>&nbsp;|&nbsp;</li><li><a href=\"logout.action\" title=\"Logout\">Logout</a></li>";
            		$("#signingBlock ul").html(ulString);
            		
            		if(dialogBox !== undefined) {
            			dialogBox.dialog( "close" );
            		}
            	} else {
            		messageElement.removeClass('big-loading').html("<p class=\"err\">" + data.data + "</p>");
            	}
            },
            error: function(){
            	messageElement.removeClass('big-loading').html("<p class=\"err\">Error occurred. Try again.</p>");
            }
        });
	},
	doUserRegister = function(formObj){
		var form = $(formObj);
		var messageElement = form.find("#register-form-message-element");
    	messageElement.empty().addClass('big-loading');
    	var POSTDATA = form.serializeArray();
    	
    	$.ajax(
        {
            type: "POST",
            url: form.attr("action"),
            cache: false,
            dataType: "json",
            data: POSTDATA,
            success: function(data){
            	if(data.result == 'SUCCESS') {
            		messageElement.removeClass('big-loading').html("Done.");
            		var userData = data.data.split("||");
            		for(var i = 0; i < userData.length; i++)
            		{
            			if(userData[i] === "null") {
            				userData[i] = "";
                		}
            		}
            		//userId 0
            		//userName 1
            		//email 2
            		//fName 3
            		//lName 4
            		//gender 5
            		//mobileNo 6
            		//city 7
            		var ulString = "<li><span class=\"welcome\">Hi<span id=\"userspan\">";
            		ulString += "<a href=\"" + globalSettings.baseUrl + settings.accountUrl + "?userId=" + userData[0] + "&userName=" + userData[1] + "\" title=\"My Bookings\">" + userData[1] + "</a> </span></span></li>";
            		ulString += "<li>,</li><li>&nbsp;|&nbsp;</li><li><a href=\"logout.action\" title=\"Logout\">Logout</a></li>";
            		$("#signingBlock ul").html(ulString);
            		
            		if(dialogBox !== undefined) {
            			dialogBox.dialog( "close" );
            			window.location.href = globalSettings.baseUrl + globalSettings.homeUrl;
            		}
            	} else {
            		messageElement.removeClass('big-loading').html("<p class=\"err\">" + data.data + "</p>");
            	}
            },
            error: function(){
            	messageElement.removeClass('big-loading').html("<p class=\"err\">Error occurred. Try again.</p>");
            }
        });
	};
};

$(document).ready(function(){
	handleLogin();
	
	$("#searchInput").bind({
        focusin: function () {
            var strSearch = $.trim($(this).val());
            if (strSearch == globalSettings.searchString) {
                $(this).val("");
            }
        },
        focusout: function () {
            var strSearch = $.trim($(this).val());
            if (strSearch == "") {
                $(this).val(globalSettings.searchString);
            }
        },
        keydown: function (event) {
            if (event.keyCode == '13') {
                event.preventDefault();
                $("#searchBtn").trigger("click");
            }
        }
    });

    $("#searchBtn").click(function () {
        var strSearch = $.trim($("#searchInput").val());
        if (strSearch == globalSettings.searchString) {
            return false;
        }
        //strSearch = strSearch.replace(/ /g, "-");
        if (strSearch != "" && strSearch != globalSettings.searchString) {
            window.location = globalSettings.baseUrl + globalSettings.searchUrl + "?" + globalSettings.searchKey + "=" + strSearch;
        }
        else {
            return false;
        }
    });
});