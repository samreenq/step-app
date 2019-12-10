$("#add-question").click(function () {
    $("#addModal").load("quiz-add");
    $("#addModal").modal("show");
});

$("#quiz-summary").click(function () {
   // alert($("input[name=parent_id]").val());
    $("#addUpdateModal").load("quiz-summary",{topic_id:$("input[name=parent_id]").val()});
    $("#addUpdateModal").modal("show");
});


$(document).on("submit", "#addForm", function (event) {
    event.preventDefault();
    $("#addBtn").attr("disabled", true);
    if($("#lesson_id").length) {
        $("#lesson_id").val($("input[name=parent_id]").val());
    }
    $.post(form_url, $(this).serialize(), function (data) {
        $("#msg").html('<p class="text-green">Record Inserted Successfully</p>');
        $("#addBtn").attr("disabled", false);
        $('#addForm')[0].reset();
        reload = 1;
    }).fail(function (err) {
        $("#addBtn").attr("disabled", false);
        var response = err.responseJSON;
        $.each(response.errors, function (key, value) {
            return $("#msg").html('<p class="text-danger">' + value[0] + '</p>');
        });
    });
});

$(document).on("submit", "#addUpdateForm", function (event) {
    event.preventDefault();
    $("#addBtn").attr("disabled", true);
    if($("#topic_id").length) {
        $("#topic_id").val($("input[name=parent_id]").val());
    }
    $.post(form_summary_url, $(this).serialize(), function (data) {
        $("#msg").html('<p class="text-green">Record Saved Successfully</p>');
        $("#addBtn").attr("disabled", false);
      //  $('#addUpdateForm')[0].reset();
        $('#addUpdateModal').modal('hide');
        reload = 1;
    }).fail(function (err) {
        $("#addBtn").attr("disabled", false);
        var response = err.responseJSON;
        $.each(response.errors, function (key, value) {
            return $("#msg").html('<p class="text-danger">' + value[0] + '</p>');
        });
    });
});

$("#mock-quiz-summary").click(function () {
    // alert($("input[name=parent_id]").val());
    $("#addUpdateMockModal").load("mock-summary");
    $("#addUpdateMockModal").modal("show");
});

$(document).on("submit", "#addUpdateMockForm", function (event) {
    event.preventDefault();
    $("#addBtn").attr("disabled", true);

    $.post(form_summary_url, $(this).serialize(), function (data) {
        $("#msg").html('<p class="text-green">Record Saved Successfully</p>');
        $("#addBtn").attr("disabled", false);
        //  $('#addUpdateForm')[0].reset();
        $('#addUpdateMockModal').modal('hide');
        reload = 1;
    }).fail(function (err) {
        $("#addBtn").attr("disabled", false);
        var response = err.responseJSON;
        $.each(response.errors, function (key, value) {
            return $("#msg").html('<p class="text-danger">' + value[0] + '</p>');
        });
    });
});


$(document).ready(function(){

    if($('#first_word').length > 0){
        var buttons = '<span id="langWrap" style="float:right;">' +
            '<a href="javascript:void(0);" id="lng-en" data-id="en" class="btn btn-primary langBtn">English</a>' +
            '<a href="javascript:void(0);" id="lng-ar" data-id="ar" class="btn btn-default langBtn">Arabic</a></span>';


        $('.panel-heading').prepend(buttons);
      //  $('form').prepend('<input type="hidden" name="lang" id="lang" value="en" />');


        $('.langBtn').on('click',function(){
            $('input[name="lang"]').val( $(this).data('id'));

            if($('.langBtn').hasClass('btn-primary')){

                $('.langBtn').removeClass('btn-primary');
                $('.langBtn').addClass('btn-default');
            }

            $(this).removeClass('btn-default');
            $(this).addClass('btn-primary');

            $.ajax
            ({
                url: lang_url,
                type: 'GET',
                data: {
                    lang: $(this).data('id'),
                   // word_id:1,
                },
                dataType: 'json',
                success: function (data) {

                    $('input[type="text"]').val("");
                    $('textarea').text("");

                    if (data['error'] == 1) {

                    } else {

                        var raw = data.data;
                        $('#first_word').val(raw.first_word);
                        $('#second_word').val(raw.second_word);
                        $('#full_word').val(raw.full_word);
                        $('#sentence').text(raw.sentence);

                    }

                }
            });

        });
    }


});


function addOption() {
    var opt = $("#opt_count").val();
    var optInc = parseInt(opt) + 1;
    if(opt < 5){
        $("#addModalBody").append('<div class="row" id="option-' + optInc + '"><div class="col-sm-10"><label>Option ' + optInc +
            '</label><input type="text" name="option[]" class="form-control" required /><input type="radio" name="correct" value="' + opt +
            '" id="correct' + opt + '"/><label for="correct' + opt + '">Correct Answer</label></div></div>');
        $("#opt_count").val(optInc);
    }
}

function remOption() {
    var opt = $("#opt_count").val();
    if(opt > 2){
        $("#option-"+opt).remove();
        $("#opt_count").val(opt-1);
    }

}

$("#addModal").on('hidden.bs.modal', function () {
    if(reload) {
        location.reload();
    }
})