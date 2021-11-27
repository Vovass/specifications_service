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


    // перестает работать если начинать вписывать текст !
    $("span[dir='ltr']").mouseup(function(){
        var number;
        var field_number = $(this).prev().attr('class').match(/result_hide_field_\d+/)[0];
        $(".select2-results__options li").mouseup(function (){
            number = $("li[aria-selected='true']").index();
            console.log(number)
        });
        $(".select2-results").mouseup(function(){
            $(".hide").each(function (index) {
                if (index == number) {
                    $(`.hide_result_${index}.${field_number}`).show();
                } else {
                    $(`.hide_result_${index}.${field_number}`).hide();
                }
            });
        });
    });

});
