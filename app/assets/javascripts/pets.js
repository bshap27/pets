// toggle breed picker
$( document ).ready( function(){
	$('#choose_multiple_breeds, #choose_single_breed').on('click', function(){
		$('#breed-single').toggleClass('hide');
		$('#breed-multiple').toggleClass('hide');
	});

	$('#deselect_all, #select_all').on('click', function(){
		if (this.id == 'deselect_all'){
			var check = false;
		} else if (this.id == 'select_all') {
			var check = true;
		}
		$('#deselect_all').toggleClass('hide');
		$('#select_all').toggleClass('hide');
		$('input[type="checkbox"].breed-checkbox').each(function() {
		   this.checked = check;
		});
	});

});


// $(':checkbox').each(function() {
//      this.checked = false;                        
//  });