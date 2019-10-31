$("#add-question").click(function () {
    $("#addModal").load("quiz-add");
    $("#addModal").modal("show");
});

$("#quiz-summary").click(function () {
   // alert($("input[name=parent_id]").val());
    $("#addUpdateModal").load("quiz-summary",{lesson_id:$("input[name=parent_id]").val()});
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
    if($("#lesson_id").length) {
        $("#lesson_id").val($("input[name=parent_id]").val());
    }
    $.post(form_summary_url, $(this).serialize(), function (data) {
        $("#msg").html('<p class="text-green">Record Inserted Successfully</p>');
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