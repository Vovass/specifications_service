$(document).ready(function(){
    $('.sel_desc').change(function(){
        var field_number = $(this).attr('class').match(/result_hide_field_\d+/)[0];
        var optionSelected = $("option:selected", this);
        var number = parseInt(optionSelected.attr('class').match(/\d+/)[0]);
        $(".hide").each(function (index) {
            if (index == number) {
                $(`.hide_result_${index}.${field_number}`).show();
            } else {
                $(`.hide_result_${index}.${field_number}`).hide();
            }
        });
    });
});
