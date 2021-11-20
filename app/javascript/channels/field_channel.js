$(document).ready(function(){
    $('#sel').change(function(){
        var optionSelected = $("option:selected", this);
        var number = parseInt(optionSelected.attr('class').match(/\d+/)[0]);
        $(".hide").each(function (index) {
            if (index == number) {
                $(`.hide_result_${index}`).show();
            } else {
                $(`.hide_result_${index}`).hide();
            }
        });
    });
});
