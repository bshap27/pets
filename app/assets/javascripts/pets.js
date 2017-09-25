// toggle breed picker
$( document ).ready( function(){

	$('#choose_multiple_breeds, #choose_single_breed').on('click', function(){
		$('#breed-single').toggleClass('hide');
		$('#breed-multiple').toggleClass('hide');
		switch (this.id){
			case 'choose_single_breed':
				uncheckAllBreeds();
				break;
			case 'choose_multiple_breeds':
				nullifyBrandSelect();
				break;
		}
	});

	$('.soph_breeds').on('click', function(){
		selectSophBreeds();
	});

	function selectSophBreeds(){
		$('#breed-single').addClass('hide');
		$('#breed-multiple').removeClass('hide');
		nullifyBrandSelect();
		$('#breed-multiple input[type="checkbox"].breed-checkbox').each(function() {
			this.checked = $(this).attr('class').split(' ').includes('soph-ok');
		});
	}

	function uncheckAllBreeds() {
		$('#breed-multiple input[type="checkbox"].breed-checkbox').each(function() {
		   this.checked = false;
		});
	}

	function nullifyBrandSelect(){
		jQuery('select[name="breed_ids[]"]').val(null);
	}

	$('#deselect_all, #select_all').on('click', function(){
		toggleChecks(this);
	});

	function toggleChecks(clicked){
		var check = clicked.id == 'select_all';
		$('#deselect_all').toggleClass('hide');
		$('#select_all').toggleClass('hide');
		$('input[type="checkbox"].breed-checkbox').each(function() {
		   this.checked = check;
		});
	};

});