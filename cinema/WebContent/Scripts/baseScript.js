var globalSettings = {
		baseUrl: "/cinema/",
		homeUrl: "home.action",
		searchString: "Search Movie........",
		searchUrl: "search-movies.action",
		searchKey: "search"
};

function conf() {
    var userSelect = window.confirm("Do you really want to delete this record?\nClick OK to confirm.");
    return userSelect;
}

function deleteHandle(obj) {
	var userSelect = window.confirm("Do you really want to delete this record?\nClick OK to confirm.");
    if(userSelect) {
    	$clickedObject = $(obj);
    	var label = $clickedObject.attr("data-label"),
    	input = $clickedObject.attr("data-input"),
    	target = $clickedObject.attr("data-target"),
        form = $('<form method="post" action="' + target + '"></form>'),
        data_input = '<input name="' + label + '" value="' + input + '" type="hidden" />';

    	form.hide().append(data_input).appendTo('body');
    	form.submit();
    	return false;
    } else {
    	return userSelect;
    }
}

function removeHandle(obj) {
	var userSelect = window.confirm("Do you really want to remove this movie?\nClick OK to confirm.");
    if(userSelect) {
    	$clickedObject = $(obj);
    	var label = $clickedObject.attr("data-label"),
    	input = $clickedObject.attr("data-input"),
    	target = $clickedObject.attr("data-target"),
        form = $('<form method="post" action="' + target + '"></form>'),
        data_input = '<input name="' + label + '" value="' + input + '" type="hidden" />';

    	form.hide().append(data_input).appendTo('body');
    	form.submit();
    	return false;
    } else {
    	return userSelect;
    }
}

function showError(err,clear_all) {
    if(clear_all != null){
        if(clear_all){
            clearMessage();
        }
        else{
            clearMessage("#errorDiv");
        }
    }
    else{
        clearMessage("#errorDiv");
    }
    
    $("#errorDiv").html(closeBtn() + unescape(err)).fadeIn("normal", function () {
        scrollTo(0, 0);
    });
}

function showInfo(inf,clear_all) {
    if(clear_all != null){
        if(clear_all){
            clearMessage();
        }
        else{
            clearMessage("#infoDiv");
        }
    }
    else{
        clearMessage("#infoDiv");
    }
    
    $("#infoDiv").html(closeBtn() + unescape(inf)).fadeIn("normal", function () {
        scrollTo(0, 0);
    });
}

function showWarn(warn,clear_all) {
    if(clear_all != null){
        if(clear_all){
            clearMessage();
        }
        else{
            clearMessage("#warnDiv");
        }
    }
    else{
        clearMessage("#warnDiv");
    }
    
    $("#warnDiv").html(closeBtn() + unescape(warn)).fadeIn("normal", function () {
        scrollTo(0, 0);
    });
}

function showSucc(succ,clear_all) {
    if(clear_all != null){
        if(clear_all){
            clearMessage();
        }
        else{
            clearMessage("#succDiv");
        }
    }
    else{
        clearMessage("#succDiv");
    }
    
    $("#succDiv").html(closeBtn() + unescape(succ)).fadeIn("normal", function () {
        scrollTo(0, 0);
    });
}

function showControlError(object,message) {
    $(object).parent().append("<span class=\"error\">" + message + "</span>");
}

function closeMe(object) {
    $(object).parent().fadeOut("normal");
}

function closeBtn() {
    return "<a href=\"javascript:void(0)\" onclick=\"javascript:closeMe(this);\"></a>";
}

function clearMessage(messagediv){
    if(messagediv != null){
        $(messagediv).hide();
    }
    else{
        $(".showInfo").hide();
    }
}

function clearFormErrors(formObj){
    if(formObj != null){
        $(".error",formObj).remove();
    }
    else{
        $(".error",document).remove();
    }
}

function changeSeatPattern(){
	$("#seatPatternId").change(function(item){
        var selectedpattern = $("#seatPatternId").val();
        var target_container = $("#seat-pattern-container");
        dochangeSeatPattern(selectedpattern, target_container);
    });
}

function dochangeSeatPattern(selectedpattern, target_container){
	if(selectedpattern === undefined || selectedpattern == null || selectedpattern === ""){
    	target_container.removeClass("big-loading");
        target_container.empty();
    } else {
    	$(".seat-pattern-main-wrapper", target_container).hide();
    	target_container.addClass("big-loading");
    	$.ajax(
        {
                type: "POST",
                url: "seatpattern.action",
                cache: false,
                data: {
                    patternid : selectedpattern
                },
                success: function(data){
                    target_container.removeClass("big-loading");
                    target_container.html(data);
                },
                error: function(){
                    target_container.removeClass("big-loading");
                    target_container.empty();
                }
        });
    }
}

function getTotalPageSize() {
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = window.innerWidth + window.scrollMaxX;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
        xScroll = document.body.scrollWidth;
        yScroll = document.body.scrollHeight;
    } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
        xScroll = document.body.offsetWidth;
        yScroll = document.body.offsetHeight;
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) {	// all except Explorer
        if (document.documentElement.clientWidth) {
            windowWidth = document.documentElement.clientWidth;
        } else {
            windowWidth = self.innerWidth;
        }
        windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
        windowWidth = document.documentElement.clientWidth;
        windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
    }
    // for small pages with total height less then height of the viewport
    if (yScroll < windowHeight) {
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    // for small pages with total width less then width of the viewport
    if (xScroll < windowWidth) {
        pageWidth = xScroll;
    } else {
        pageWidth = windowWidth;
    }
    return new Array(pageWidth, pageHeight, windowWidth, windowHeight);
}

var showModel = function() {
	$( "#dialog-message" ).dialog({
		modal: true,
		buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
			}
		}
	});
};

var posterManage = function(movieId){
	settings = {
		movieId : movieId,
		mainFlag : false,
		addUrl : "posters-add-process.action",
		changeMainUrl : "posters-edit-process.action",
		deleteUrl : "posters-delete-process.action",
		arrayPageSize : [],
		overlayBgColor: '#fff',
        overlayOpacity: 0.8,
        validFileTypes : "jpg|png|jpeg|gif|JPG|JPEG|bmp"
	};
	showProgress = function(){
    	settings.arrayPageSize = getTotalPageSize();
		$('body').append('<div id="jquery-overlay" /><div id="poster-progress"></div>');

        // Style overlay and show it
        $('#jquery-overlay').css({
            backgroundColor: settings.overlayBgColor,
            opacity: settings.overlayOpacity,
            width: settings.arrayPageSize[0],
            height: settings.arrayPageSize[1]
        }).fadeIn();
	},
	hideProgress = function(){
		$('#poster-progress').remove();
        $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').remove(); });
	},
	doUpload = function(){
        new AjaxUpload('btnUpload', {
            action: settings.addUrl,
            data: {
            	movieId : settings.movieId,
            	mainFlag : settings.mainFlag
            },
            name: 'fileUpload',
            responseType: 'json',
            onSubmit: function(file, extension) {
                if (! (extension && /^(jpg|png|jpeg|gif|JPG|JPEG|bmp)$/.test(extension))){ 
                    // extension is not allowed
                    showModel();
                    return false;
                }
                showProgress();
                settings.mainFlag = document.getElementById("upload-main-check").checked;
                //console.info(settings.mainFlag);
                this.setData({
                	movieId : settings.movieId,
                	mainFlag : settings.mainFlag
                });
            },
            onComplete: function(file, response) {
                if(response.result == 'SUCCESS') {
                	var newPoster = $('<div class="poster-view-blocks left"><a href="javascript:void(0)" class="close-btn" onclick="javascript:doDelete('+response.data+',this);"></a><img class="main-img" alt="" src="' + response.resource + '" /><div class="main-detail"><label class="manage-label"><tr><td valign="top" align="right"></td><td valign="top" align="left"><input type="checkbox" name="main-check" value="true" id="main-check" onclick="javascript:doChangeMain('+response.data+',this);"/><input type="hidden" id="__checkbox_main-check" name="__checkbox_main-check" value="true" /></td></tr><span>Main</span></label></div></div>');
                	newPoster.hover(function(){
                		$(".close-btn",this).fadeIn();
                	},function(){
                		$(".close-btn",this).fadeOut();
                	});
                	
                    $('.poster-view-inner').append(newPoster);
                    if(settings.mainFlag) {
                    	window.location.href = window.location.href;
                    }
                    settings.mainFlag = false;
                    hideProgress();
                }
                else {
                	settings.mainFlag = false;
                    hideProgress();
                }
            }
        });
	},
	doChangeMain = function(posterId, element){
		if(!element.checked){
			element.checked = true;
			return;
		}
		
		showProgress();
		$.ajax(
        {
            type: "POST",
            url: settings.changeMainUrl,
            cache: false,
            dataType: "json",
            data: {
            	posterId : posterId,
            	movieId : settings.movieId,
            	mainFlag : element.checked
            },
            success: function(data){
                //hideProgress();
            	if(data.result == 'SUCCESS') {
            		window.location.href = window.location.href;
            	} else {
            		hideProgress();
            		element.checked = false;
            	}
            },
            error: function(){
            	hideProgress();
            	element.checked = false;
            }
        });
	},
	doDelete = function(posterId, element){
		showProgress();
		//console.info(element);
		var targetElemtent = $(element).parent();
		var isMain = false;
		var inputs = element.parentNode.getElementsByTagName("input");
		//console.info(inputs);
		//console.info(inputs.length);
		for(var i = 0; i < inputs.length; i++) {
			//console.info(inputs[i].type);
			if(inputs[i].type == "checkbox" && inputs[i].id == "main-check") {
				isMain = inputs[i].checked;
				break;
			}
		}
		
		//console.info(isMain);
		
		$.ajax(
        {
            type: "POST",
            url: settings.deleteUrl,
            cache: false,
            dataType: "json",
            data: {
            	posterId : posterId,
            	movieId : settings.movieId
            },
            success: function(data){
            	if(data.result == 'SUCCESS') {
            		if(isMain) {
            			targetElemtent.hide("slow", function(){window.location.href = window.location.href;});
            		} else {
            			targetElemtent.hide("slow", hideProgress);
            		}
            	} else {
            		hideProgress();
            	}
            },
            error: function(){
            	hideProgress();
            }
        });
	};
};

var sliderManage = function(){
	settings = {
		addUrl : "sliders-upload-process.action",
		arrayPageSize : [],
		overlayBgColor: '#fff',
        overlayOpacity: 0.8,
        validFileTypes : "jpg|png|jpeg|gif|JPG|JPEG|bmp"
	};
	showProgress = function(){
    	settings.arrayPageSize = getTotalPageSize();
		$('body').append('<div id="jquery-overlay" /><div id="poster-progress"></div>');

        // Style overlay and show it
        $('#jquery-overlay').css({
            backgroundColor: settings.overlayBgColor,
            opacity: settings.overlayOpacity,
            width: settings.arrayPageSize[0],
            height: settings.arrayPageSize[1]
        }).fadeIn();
	},
	hideProgress = function(){
		$('#poster-progress').remove();
        $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').remove(); });
	},
	doUpload = function(){
        new AjaxUpload('btnUpload', {
            action: settings.addUrl,
            name: 'fileUpload',
            responseType: 'json',
            onSubmit: function(file, extension) {
                if (! (extension && /^(jpg|png|jpeg|gif|JPG|JPEG|bmp)$/.test(extension))){ 
                    // extension is not allowed
                    showModel();
                    return false;
                }
                showProgress();
            },
            onComplete: function(file, response) {
                if(response.result == 'SUCCESS') {
                	$("#sliderPic").val(response.resource);
                	$("#sliderPic1").val("done");
                	$("#slider-upload-ok").css("display" , "inline-block");
                    hideProgress();
                }
                else {
                	$("#slider-upload-ok").css("display" , "none");
                    hideProgress();
                }
            }
        });
	};
};

var scheduleManage = function(){
	settings = {
		arrayPageSize : [],
		overlayBgColor: '#fff',
        overlayOpacity: 0.8
	};
	showProgress = function(){
    	settings.arrayPageSize = getTotalPageSize();
		$('body').append('<div id="jquery-overlay" /><div id="poster-progress"></div>');

        // Style overlay and show it
        $('#jquery-overlay').css({
            backgroundColor: settings.overlayBgColor,
            opacity: settings.overlayOpacity,
            width: settings.arrayPageSize[0],
            height: settings.arrayPageSize[1]
        }).fadeIn();
	},
	hideProgress = function(){
		$('#poster-progress').remove();
        $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').remove(); });
	},
	showScheduleForm = function(formObj){
		var form = $(formObj);
    	//var messageElement = form.find(".schedule-form-message");
    	//messageElement.empty().addClass('big-loading');
    	var dialogHolder = $("#dialog-holder");
    	dialogHolder.empty().html("Loading...");
    	var dialogBox = dialogHolder.dialog({
											height: 510,
											width: 350,
											modal: true,
											buttons: {
												Close: function() {
													$( this ).dialog( "close" );
												}
											}
										});
    	
    	$.ajax({
            type: "POST",
            url: form.attr("action"),
            cache: false,
            dataType: "html",
            data: {
            	screenId : form.find("#screenId").val(),
            	scheduleDate : form.find("#scheduleDate").val()
            },
            success: function(data){
            	dialogHolder.html(data);
            },
            error: function(){
            	dialogHolder.html("Error occurred. Please try again.");
            }
        });
	},
	manageShowTimes = function(optionObj){
		var option = $(optionObj);
		var optionIndex = $(optionObj).val();
		var srNo = option.parent().parent().find(".labelClass").html();
		if(srNo != undefined && srNo != NaN) {
			var tableRows = option.parent().parent().parent().parent().find("tr");
			
			tableRows.each(function(i){
				if(i == 0 || i > (tableRows.length-3)){
					
				} else {
					if(i > srNo) {
						//console.info(tableRows[i]);
						$(tableRows[i]).find("#timeSlots").val(optionIndex);
					}
				}
			});
			//console.info(tableRows);
		}
	},
	doSchedule = function(formObj){
		var form = $(formObj);
		var messageElement = form.find("#schedule-form-message-element");
    	messageElement.empty().addClass('big-loading');
		
    	var formData = {
    		T1 : 0,
    		T2 : 0,
    		T3 : 0,
    		T4 : 0,
    		T5 : 0,
    		T6 : 0,
    		T7 : 0,
    		
    		M1 : 0,
    		M2 : 0,
    		M3 : 0,
    		M4 : 0,
    		M5 : 0,
    		M6 : 0,
    		M7 : 0
    	};
    	
    	formData.T1 = parseInt(form.find("#timeSlots1").val());
    	formData.T2 = parseInt(form.find("#timeSlots2").val());
    	formData.T3 = parseInt(form.find("#timeSlots3").val());
    	formData.T4 = parseInt(form.find("#timeSlots4").val());
    	formData.T5 = parseInt(form.find("#timeSlots5").val());
    	formData.T6 = parseInt(form.find("#timeSlots6").val());
    	formData.T7 = parseInt(form.find("#timeSlots7").val());
    	
    	formData.M1 = parseInt(form.find("#movieId1").val());
    	formData.M2 = parseInt(form.find("#movieId2").val());
    	formData.M3 = parseInt(form.find("#movieId3").val());
    	formData.M4 = parseInt(form.find("#movieId4").val());
    	formData.M5 = parseInt(form.find("#movieId5").val());
    	formData.M6 = parseInt(form.find("#movieId6").val());
    	formData.M7 = parseInt(form.find("#movieId7").val());
    	
    	var selected = false, showSelectProper = false, showSelectSequence = false;
    	//console.info(formData);
    	//VALIDATION
    	//ROW 1
    	if(formData.T1 != 0 && formData.M1 != 0) {
    		selected = true;
    	} else if(formData.T1 == 0 && formData.M1 == 0) {
    		//NOTHING
    	} else {
    		showSelectProper = true;
    	}
    	
    	//ROW 2
    	if(formData.T2 != 0 && formData.M2 != 0) {
    		if(formData.T2 <= formData.T1) {
    			showSelectSequence = true;
    		} else {
    			selected = true;
    		}
    	} else if(formData.T2 == 0 && formData.M2 == 0) {
    		//NOTHING
    	} else {
    		showSelectProper = true;
    	}
    	
    	//ROW 3
    	if(formData.T3 != 0 && formData.M3 != 0) {
    		if(formData.T3 <= formData.T2 || formData.T3 <= formData.T1) {
    			showSelectSequence = true;
    		} else {
    			selected = true;
    		}
    	} else if(formData.T3 == 0 && formData.M3 == 0) {
    		//NOTHING
    	} else {
    		showSelectProper = true;
    	}
    	
    	//ROW 4
    	if(formData.T4 != 0 && formData.M4 != 0) {
    		if(formData.T4 <= formData.T3 || formData.T4 <= formData.T2 || formData.T4 <= formData.T1) {
    			showSelectSequence = true;
    		} else {
    			selected = true;
    		}
    	} else if(formData.T4 == 0 && formData.M4 == 0) {
    		//NOTHING
    	} else {
    		showSelectProper = true;
    	}
    	
    	//ROW 5
    	if(formData.T5 != 0 && formData.M5 != 0) {
    		if(formData.T5 <= formData.T4 || formData.T5 <= formData.T3 || formData.T5 <= formData.T2 || formData.T5 <= formData.T1) {
    			showSelectSequence = true;
    		} else {
    			selected = true;
    		}
    	} else if(formData.T5 == 0 && formData.M5 == 0) {
    		//NOTHING
    	} else {
    		showSelectProper = true;
    	}
    	
    	//ROW 6
    	if(formData.T6 != 0 && formData.M6 != 0) {
    		if(formData.T6 <= formData.T5 || formData.T6 <= formData.T4 || formData.T6 <= formData.T3 || formData.T6 <= formData.T2 || formData.T6 <= formData.T1) {
    			showSelectSequence = true;
    		} else {
    			selected = true;
    		}
    	} else if(formData.T6 == 0 && formData.M6 == 0) {
    		//NOTHING
    	} else {
    		showSelectProper = true;
    	}
    	
    	//ROW 7
    	if(formData.T7 != 0 && formData.M7 != 0) {
    		if(formData.T7 <= formData.T6 || formData.T7 <= formData.T5 || formData.T7 <= formData.T4 || formData.T7 <= formData.T3 || formData.T7 <= formData.T2 || formData.T7 <= formData.T1) {
    			showSelectSequence = true;
    		} else {
    			selected = true;
    		}
    	} else if(formData.T7 == 0 && formData.M7 == 0) {
    		//NOTHING
    	} else {
    		showSelectProper = true;
    	}
    	
    	var Errors = "";
    	if(!selected) {
    		Errors += "<p class=\"err\">Atleast schedule one show</p>";
    	}
    	
    	if(showSelectProper) {
    		Errors += "<p class=\"err\">Select both show time and movie</p>";
    	}
    	
    	if(showSelectSequence) {
    		Errors += "<p class=\"err\">Select show time in increasing order</p>";
    	}
    	
    	if(selected === true && showSelectProper === false && showSelectSequence === false) {
    		var POSTDATA = form.serializeArray();
    		//console.log(form.serializeArray());
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
	            		window.location.href = window.location.href;
	            	} else {
	            		messageElement.removeClass('big-loading').html("<p class=\"err\">" + data.data + "</p>");
	            	}
	            },
	            error: function(){
	            	messageElement.removeClass('big-loading').html("<p class=\"err\">Error occurred. Try again.</p>");
	            }
	        });
    	} else {
    		messageElement.removeClass('big-loading').html(Errors);
    	}
	},
	doReSchedule = function(formObj){
		var form = $(formObj);
		var userSelect = window.confirm("Do you really want to reschedule for this day?\nClick OK to confirm.");
	    if(userSelect) {
	    	showProgress();

			$.ajax(
	        {
	            type: "POST",
	            url: form.attr("action"),
	            cache: false,
	            dataType: "json",
	            data: {
	            	screenId : form.find("#screenId").val(),
	            	scheduleDate : form.find("#scheduleDate").val()
	            },
	            success: function(data){
	            	if(data.result == 'SUCCESS') {
	            		hideProgress();
	            		window.location.href = window.location.href;
	            	} else {
	            		form.find(".schedule-form-message").html("Error occurred. Try again.");
	            		hideProgress();
	            	}
	            },
	            error: function(){
	            	form.find(".schedule-form-message").html("Error occurred. Try again.");
	            	hideProgress();
	            }
	        });
	    }
	};
};

function youtubeFeedCallback(data) {
	
//    data.entry["title"].$t
//    Math.floor(data.entry["media$group"]["yt$duration"].seconds / 60) + ':' + (data.entry["media$group"]["yt$duration"].seconds % 60)
//    data.entry["media$group"]["media$description"].$t.replace(/\n/g, '<br/>')
//    data.entry["media$group"]["media$thumbnail"][0].url
//    data.entry["media$group"]["media$thumbnail"][0].url
//    data.entry["media$group"]["media$thumbnail"][0].width
//    data.entry["media$group"]["media$thumbnail"][0].height
	//alert($('img[data-ref="'+data.data.id+'"]'));
	var mnt = Math.floor(data.data.duration / 60);
	var scn =(data.data.duration % 60);
	if(scn==0) {
		scn = '00';
	}
	$('img[data-ref="'+data.data.id+'"]')
	.attr('src', data.data.thumbnail.sqDefault)
	.parent("a").parent("div").parent("div")
	.find(".ftag").text(mnt + ':' + scn);
};

function setVideoMetaData(pre, post, videoid, callback, itemObj) {
    $.ajax({
	  url: pre + encodeURIComponent(videoid) + post + callback,
	  cache: true,
	  dataType: "script",
	  success: function(data){},
      error: function(){}
	});
};

var trailerHandle = function(){
	// http://gdata.youtube.com/feeds/api/videos/VIDEOID
	// v=2
	// alt=json-in-script | json | jsonc
	// callback=methodname
	// prettyprint=true
	
	trsettings = {
			youtubeApiUrlPrefix : "http://gdata.youtube.com/feeds/api/videos/",
			youtubeApiUrlPostfix : "?v=2&alt=jsonc&callback=",
			youtubeApiCallBackFunction : "youtubeFeedCallback"
	};
	getVideoDetails = function(container){
		var containerObj = $(container);
		getTrailerImages(containerObj);
	},
	getTrailerImages = function(containerObj) {
		$("img", containerObj).each(function(index) {
			$(this).load(function(){
				$(this).css('display','block').parent("a").removeClass('small-loading');
	            $(this).unbind();
	        });
			setVideoMetaData(trsettings.youtubeApiUrlPrefix, trsettings.youtubeApiUrlPostfix, $(this).attr("data-ref"), trsettings.youtubeApiCallBackFunction, $(this).parent("a").parent("div").parent("div"));
		});
	};
};

var scheduleHandle = function(){
	settingScheduleHandle = {
			partUrl : "movies-details-part.action"
	};
	initScheduleHandle = function() {
		$(".schedule-block-time-item").hover(function(){
			$(this).addClass("schedule-block-time-hover");
		}, function(){
			$(this).removeClass("schedule-block-time-hover");
		});
		
		$(".label-schedule-toggle-icon").click(function(){
			var descObj = $(this).siblings(".schedule-block-time-item-desc");
			var iconObj = $(this);
			if(iconObj.attr("data-status") == 'N') {
				$.ajax({
		            type: "POST",
		            url: globalSettings.baseUrl + settingScheduleHandle.partUrl,
		            cache: false,
		            dataType: "html",
		            data: {
		            	movieId: $(this).attr("data-ref")
		            },
		            success: function(data){
		            	descObj.html(data).slideToggle('slow', function(){
		            		if(iconObj.hasClass("ui-icon-circle-arrow-s")) {
			            		iconObj.attr("data-status", "Y")
			            		.removeClass("ui-icon-circle-arrow-s")
			            		.addClass("ui-icon-circle-arrow-n");
			            	} else {
			            		iconObj.attr("data-status", "Y")
			            		.removeClass("ui-icon-circle-arrow-n")
			            		.addClass("ui-icon-circle-arrow-s");
			            	}
		            	});
		            },
		            error: function(){
		            	descObj.html("Error occurred. Please try again.").slideToggle('slow', function(){
		            		if(iconObj.hasClass("ui-icon-circle-arrow-s")) {
			            		iconObj.attr("data-status", "N")
			            		.removeClass("ui-icon-circle-arrow-s")
			            		.addClass("ui-icon-circle-arrow-n");
			            	} else {
			            		iconObj.attr("data-status", "N")
			            		.removeClass("ui-icon-circle-arrow-n")
			            		.addClass("ui-icon-circle-arrow-s");
			            	}
		            	});
		            }
		        });
			} else {
				descObj.slideToggle('slow', function(){
            		if(iconObj.hasClass("ui-icon-circle-arrow-s")) {
	            		iconObj.removeClass("ui-icon-circle-arrow-s")
	            		.addClass("ui-icon-circle-arrow-n");
	            	} else {
	            		iconObj.removeClass("ui-icon-circle-arrow-n")
	            		.addClass("ui-icon-circle-arrow-s");
	            	}
            	});
			}
		});
	};
};

var seatSelectionHandle = function(){
	initSelection = function() {
		var maxSeatSelection = $("#maxSeatSelection").val();
		var targetSeatSelection = $("#seatsSelected");
		var row, cell;
		
		$(".clickable").click(function(){
			var seat = $(this);
			row = seat.attr("data-row");
			cell = seat.attr("data-cell");
			
			var seatStr = targetSeatSelection.val();
			var arrStr = seatStr.split("$$");
			var count = 0;
			
			if (seat.hasClass("yellow")) {
				// UNSELECT
				var seatStrTmp = "";
				for(var i = 0; i < arrStr.length; i++) {
					if(arrStr[i] == row + ":" + cell) {
						
					} else {
						if(arrStr[i] != "") {
							seatStrTmp = seatStrTmp + "$$" + arrStr[i];
						}
					}
				}
				
				targetSeatSelection.val(seatStrTmp);
				seat.removeClass("yellow");
			} else {
				// SELECT
				for(var i = 0; i < arrStr.length; i++) {
					if(arrStr[i] != "") {
						count++;
					}
				}
				count++;
				if(count > maxSeatSelection) {
					alert("Maximum seats selected");
				} else {
					targetSeatSelection.val(seatStr + "$$" + row + ":" + cell);
					seat.addClass("yellow");
				}
			}
		});
	},
	validateSelection = function() {
		var maxSeatSelection = $("#maxSeatSelection").val();
		var currSeatSelection = $("#seatsSelected").val();
		var arrStr = currSeatSelection.split("$$");
		var count = 0;
		
		for(var i = 0; i < arrStr.length; i++) {
			if(arrStr[i] != "") {
				count++;
			}
		}
		//console.log(count);
		//console.log(maxSeatSelection);
		if(count == maxSeatSelection) {
			return true;
		} else {
			alert("Please select " + maxSeatSelection + " seats");
			return false;
		}
	};
};

var bookingUserHandle = function(){
	initbookingUser = function() {
		var selectOptions = $(".usertype");
		selectOptions.find("input:text").hide();
		selectOptions.find("input:radio").change(function(){
			//alert("changed " + $(this).val());
			var selectedElem = $(this);
			if(selectedElem.val() == 'R') {
				selectedElem.parent().parent().find("input:text").hide().val('$');
				selectedElem.parent().parent().find(".error").hide();
				selectedElem.parent().find("input:password").show().val('').focus();
			} else {
				selectedElem.parent().find("input:text").show().val('').focus();
				selectedElem.parent().parent().find("input:password").hide().val('$');
				selectedElem.parent().parent().find(".error").hide();
			}
		});
	};
};