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
    if ($('.meal_field_set').not(':hidden').length == 1) {
        $('.remove_meal_fields').hide();
    }
    $('.position').hide();

    $('form').on('click', '.add_meal_fields', function(event) {
        var mealFieldSet = $('.meal_field_set'),
            currentMenuMeal = mealFieldSet.last(),
            mealTemplate = '<li><div class="meal_field_set">' + currentMenuMeal.html() + '</div></li>',
            mealNumber = mealFieldSet.length;
        mealTemplate = mealTemplate
            .replace(/_\d+_/g, '_' + mealNumber + '_')
            .replace(/\[\d+\]/g, '[' + mealNumber + ']');
        $('.menu_positions').append(mealTemplate).find('input[type=number]').last().attr('value', mealNumber + 1);
        if ($('form').hasClass('edit_menu')) {
            var uniqueId = new Date().getTime();
            var hiddenField = "<input id=\"menu_meals_attributes_" + mealNumber + "_id\" type=\"hidden\" value=\"" + uniqueId + "\" name=\"menu[meals_attributes][" + mealNumber + "][id]\">";
            $('.menu_positions').append(hiddenField);
        }
        var linkToRemove = $('.remove_meal_fields')
        if (linkToRemove.is(":hidden") == true) {
            linkToRemove.show();
        }
        event.preventDefault();
    });

    $('.menu_positions').on('click', '.remove_meal_fields', function(event) {
        $(this).parents('li')
            .find('input[type=number]')
                .attr('value', 0)
                .end()
            .hide();
        if ($('.meal_field_set').not(':hidden').length == 1) {
            $('.remove_meal_fields').hide();
        }
        event.preventDefault();
    });

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
                $(this).closest('div.jquery_no_repeat').removeClass('invalid');
            } else {
                $(this).closest('div.jquery_no_repeat').addClass('invalid');
                alert("Składniki muszą być różne!!!");
                event.preventDefault();
            }
        });
    });
});


