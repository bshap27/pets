// toggle breed picker
$( document ).ready( function(){
	$('#choose_multiple_breeds, #choose_single_breed').on('click', function(){
		$('#breed-single').toggleClass('hide');
		$('#breed-multiple').toggleClass('hide');
	});

	$('#choose_multiple_breeds').on('click', function(){
		// update select within <div id="breed-single"> to nil
		// jQuery('select[name="breed"] option:selected')
		jQuery('select[name="breed_ids[]"]').val(null);
	});

	$('#choose_single_breed').on('click', function(){
		$('#breed-multiple input[type="checkbox"].breed-checkbox').each(function() {
		   this.checked = false;
		});
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