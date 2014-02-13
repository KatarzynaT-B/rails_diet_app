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
//function remove_fields(link) {
//    $(link).previous("input[type=hidden]").value = "1";
//    $(link).closest('.ingredient_fields').hide();
//}

//function add_fields(link, association, content) {
//    var new_id = new Date().getTime();
//    var regexp = new RegExp("new_" + association, "g")
//    $(link).up().insert({
//        before: content.replace(regexp, new_id)
//    });
//}

$(document).ready(function() {
    $('form').on('click', '.add_fields', function(event) {
        var ingredientFields = $('.ingredient_fields');
        var currentDishIngredients = ingredientFields.last();
        var ingredientTemplate = '<div class="ingredient_fields">'+ currentDishIngredients.html() + '</div>';
        var ingredientNumber = ingredientFields.length;
        ingredientTemplate = ingredientTemplate.replace(/_\d+_/g, '_' + ingredientNumber + '_').replace(/\[\d+\]/g, '[' + ingredientNumber + ']');
        $('.ingredient_form_fields').append(ingredientTemplate);
        if ($('form').hasClass('edit_dish')) {
            var uniqueId = new Date().getTime();
            var hiddenField = "<input id=\"dish_ingredients_attributes_" + ingredientNumber + "_id\" type=\"hidden\" value=\"" + uniqueId + "\" name=\"dish[ingredients_attributes][" + ingredientNumber + "][id]\">";
            $('.ingredient_form_fields').append(hiddenField);
        }
        event.preventDefault();
    });
});


