// toggle breed picker
$( document ).ready( function(){

	$("#remasonry").on('click', function(){
		$('.grid').masonry();
	});

	// $('#choose_multiple_breeds, #choose_single_breed').on('click', function(){
	// 	$('#breed-single').toggleClass('hide');
	// 	$('#breed-multiple').toggleClass('hide');
	// 	switch (this.id){
	// 		case 'choose_single_breed':
	// 			uncheckAllBreeds();
	// 			break;
	// 		case 'choose_multiple_breeds':
	// 			nullifyBreedSelect();
	// 			break;
	// 	}
	// });

	$('.soph_breeds').on('click', function(){
		selectSophBreeds();
	});

	function selectSophBreeds(){
		$('.breed-checkbox').each(function() {
			this.checked = $(this).attr('class').split(' ').includes('soph-ok');
		});
	}

	function uncheckAllBreeds() {
		$('.breed-checkbox').each(function() {
		   this.checked = false;
		});
	}

	function nullifyBreedSelect(){
		if ($('#breed_select option').last().val() != "Multiple Selected") {
			$('#breed_select').append($('<option>', {
	    	value: null,
	    	text: 'Multiple Selected'
			}));
		}
		$('#breed_select').val('Multiple Selected');
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


	$("#save-multiple").on('click', function(){
		nullifyBreedSelect();
	});

	$('#breed_select').on('change', function(){
		uncheckAllBreeds();
	});

	$('#saved_searches').on('change', function(){
		var deactivate_form = $(this).children('option:selected').attr('value') != '';
		$("#search-form input, #search-form checkbox, #search-form select, #choose_multiple_breeds, .soph_breeds").prop('disabled', deactivate_form);
	});

	$('#save-search-checkbox').on('click', function(){
			$('#search-name').toggleClass('hide');
	});

});