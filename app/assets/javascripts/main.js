
/* Table initialisation */
$(function() {
	$('#example').dataTable( {
        "bDestroy": true,
		"aaSorting": [[ 1, "asc" ]],
		"sDom": "<'row'<'span5'l><'offset1 span4'f>r>t<'row'<'span5'i><'span5'p>>",
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