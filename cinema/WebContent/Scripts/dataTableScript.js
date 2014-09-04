$(document).ready(function(){
	$('.GridClass').dataTable({
		"sDom": "<'grid-top-header'<'grid-top-header-part'l><'grid-top-header-part'f>r>t<'grid-top-footer'<'grid-top-footer-part'i><'grid-top-footer-part center'p>>",
		"sPaginationType": "full_numbers",
		"oLanguage": {
		"sLengthMenu": "_MENU_ records per page",
		"sEmptyTable": "No records found"
		}
	});
});