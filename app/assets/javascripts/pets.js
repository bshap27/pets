// toggle breed picker
$( document ).ready( function(){
	$('#choose_multiple_breeds, #choose_single_breed').on('click', function(){
		$('#breed-single').toggleClass('hide');
		$('#breed-multiple').toggleClass('hide');
	});

	$('#choose_multiple_breeds').on('click', function(){
		jQuery('select[name="breed_ids[]"]').val(null);
	});

	$('#choose_single_breed').on('click', function(){
		$('#breed-multiple input[type="checkbox"].breed-checkbox').each(function() {
		   this.checked = false;
		});
	});

	$('.soph_breeds').on('click', function(){
		if ($('#breed-single').attr('class') != 'hide') {
			$('#breed-single').toggleClass('hide');
		}
		if ($('#breed-multiple').attr('class') == 'hide') {
			$('#breed-multiple').toggleClass('hide');
		}
		jQuery('select[name="breed_ids[]"]').val(null);

		checkSophBreeds();
	});

	function checkSophBreeds(){
		$('#breed-multiple input[type="checkbox"].breed-checkbox').each(function() {
			if ($(this).attr('class').split(' ').includes('soph-ok')) {
				this.checked = true;
			} else {
				this.checked = false;
			}
		});		
	}

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