/// <reference path="jquery-3.1.1.min.js" />
$(function(){
   $(".se").click(function () {
        $('.more1').toggle();
    });
    $('.more1').mouseleave(function(){
    $('.more1').hide();
    });
    $('.more1 ul li ').mouseenter(function () {
        $(this).css({ 'background': '#eee' });
        $(this).find('span').css({ 'color': '#17ADBD' })
        $('.more1 li').not($(this)).css({ 'background': '#17ADBD' });
    });
    $('.more1 ul li ').mouseleave(function () {
       
        $(this).css({ 'background': '#17ADBD' });
        $(this).find('span').css({ 'color': '#fff' });
    });
});