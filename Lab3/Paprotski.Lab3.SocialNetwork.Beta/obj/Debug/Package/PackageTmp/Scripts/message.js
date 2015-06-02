$(document).ready(function () {
    $("#characterLeft").text("2000 символов осталось");

    $("#message").keydown(function () {
        var maxLength = 2000;
        var currentLength = $(this).val().length;

        if (currentLength >= maxLength) {
            $("#characterLeft").text("Достигнут лимит сообщения.");
            $("#btnSubmit").addClass("disabled");
        } else {
            var charactes = maxLength - currentLength;
            $("#characterLeft").text(charactes + " символов осталось");
            $("#btnSubmit").removeClass("disabled");
        }
    });
});
