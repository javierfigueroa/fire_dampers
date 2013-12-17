
/* Table initialisation */
$(function() {
	$('#example').dataTable( {
		"aaSorting": [[ 1, "asc" ]],
		"sDom": "<'row'<'span3'l><'offset1 span4'f>r>t<'row'<'span3'i><'offset1 span4'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		},
		"aoColumnDefs": [ 
      		{ "bSortable": false, "sWidth": "50px", "aTargets": [ "actions" ] },
      		{ "asSorting": [ "asc", "desc" ], "aTargets": [ "status" ] }      		
    	]
	} );
} );