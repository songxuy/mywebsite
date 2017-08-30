/// <reference path="jquery-3.1.1.min.js" />
$(function () {
    $(".unto").data({ 's': 0 });
    
    $('input[name=name]').blur(function () {//blur写完显示
        val = this.value;
        if (val.length < 2) {
            $(this).next().show();
            $(this).data({ 's': 0 })
        } else {
            $(this).data({ 's': 1 })
            $(this).next().hide();
        }
    });
    $('input[name=password]').blur(function () {//blur写完显示
        val = this.value;
        if (val.length < 8) {
            $(this).next().show();
            $(this).data({ 's': 0 })
        } else {
            $(this).next().hide();
            $(this).data({ 's': 1 })
        }
    });
    $('input[name=repassword]').blur(function () {//blur写完显示
        val = this.value;
        val1 = $('input[name=password]').val();
        if (val1 != val) {
            $(this).next().show();
            $(this).data({ 's': 0 })
        } else {
            $(this).next().hide();
            $(this).data({ 's': 1 })
        }
    });
    $('input[name=mail]').blur(function () {//blur写完显示
        val = this.value;
        if (!val.match(/^\w+@\w+\.\w+$/i)) {
            $(this).next().show();
            $(this).data({ 's': 0 })
        } else {
            $(this).next().hide();
            $(this).data({ 's': 1 })
        }
    });
    $('input[name=phone]').blur(function () {//blur写完显示
        val = this.value;
        if (!val.match(/^1\d{10}$/)) {
            $(this).next().show();
            $(this).data({ 's': 0 })
        } else {
            $(this).next().hide();
            $(this).data({ 's': 1 })
        }
    });
    $("form").submit(function () {
        $(".unto").blur();
        tot = 0;
        $(".unto").each(function () {
            tot = tot + $(this).data("s");
        });

        if (tot != 5) {
            return false;
        }

    });
});

