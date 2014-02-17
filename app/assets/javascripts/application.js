// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//
$(document).ready(function() {
    if ($('.ingredient_fields').not(':hidden').length == 1) {
        $('.remove_ingredient_fields').hide();
    }

    $('form').on('click', '.add_ingredient_fields', function(event) {
        var ingredientFields = $('.ingredient_fields'),
            currentDishIngredients = ingredientFields.last(),
            ingredientTemplate = '<div class="ingredient_fields">'+ currentDishIngredients.html() + '</div>',
            ingredientNumber = ingredientFields.length;
        ingredientTemplate = ingredientTemplate
            .replace(/_\d+_/g, '_' + ingredientNumber + '_')
            .replace(/\[\d+\]/g, '[' + ingredientNumber + ']');
        $('.ingredient_form_fields').append(ingredientTemplate);
        if ($('form').hasClass('edit_dish')) {
            var uniqueId = new Date().getTime();
            var hiddenField = "<input id=\"dish_ingredients_attributes_" + ingredientNumber + "_id\" type=\"hidden\" value=\"" + uniqueId + "\" name=\"dish[ingredients_attributes][" + ingredientNumber + "][id]\">";
            $('.ingredient_form_fields').append(hiddenField);
        }
        var linkToRemove = $('.remove_ingredient_fields')
        if (linkToRemove.is(":hidden") == true) {
            linkToRemove.show();
        }
        event.preventDefault();
    });

    $('.ingredient_form_fields').on('click', '.remove_ingredient_fields', function(event) {
        $(this).parent('.ingredient_fields')
            .find('input[type=number]')
                .val(0)
                .end()
            .hide();
        if ($('.ingredient_fields').not(':hidden').length == 1) {
            $('.remove_ingredient_fields').hide();
        }
        event.preventDefault();
    });

    $('form[class$=dish]').submit(function(event) {
        $(this).find('input.jquery_required').each(function() {
            if ($(this).val() == '') {
                event.preventDefault();
                $(this).parent().addClass('invalid');
            } else {
                $(this).parent().removeClass('invalid');
            }
        });
        var names = [];
        $(this).find('option').not(':hidden').filter(':selected').each(function() {
            var product = $(this).text();
            if ($.inArray(product, names) == -1 ) {
                names.push(product);
                $(this).parent('select.jquery_required').removeClass('invalid');
            } else {
                $(this).parent('select.jquery_required').addClass('invalid');
                alert("Składniki muszą być różne!!!");
                event.preventDefault();
            }
        });
    });
});


