/// <reference path="jquery-3.1.1.min.js" />
$(function(){
     $('.btn').click(function(){
     $('.write').show();
     });
     $('.write .wtop ul li').eq(4).click(function(){
    $('.main').show();
    $('.write').hide();
     });
     $(".write form").submit(function () {
     	 var username = $.trim($("#name").val());//获取用户名
    var password = $.trim($("#body").val());
    if (username == "" || password == "") {
        layer.alert("题目和内容不能为空哦", {
            title: "提示",
            icon: 5//5是哭 6是笑
        });
        return false;
    }
    });
    $('.me ul li').eq(0).find('span').css({ 'color': '#039EF9','font-weight':'600'});
     $('.me ul li').mouseenter(function () {
        $(this).find('span').css({ 'color': '#039EF9','font-weight':'600' })
        /*$('.me li').not($(this)).css({ 'background': '#fff' });*/
    });
    $('.me ul li').not($('.me ul li:first-child')).mouseleave(function () {
        $(this).find('span').css({ 'color': '#2595C7','font-weight':'400' });
    });
});
function back(){
	$('.main').show();
	$('.showing').hide();
}
function next(j){
	$('.showing').eq(j+1).show();
}
function pre(x){
	if(x>=1){
		$('.showing:visible').hide();
		$('.showing').eq(x-1).show();
		$('.showing:not(eq(x-1)').hide();
	}
} 
function see(i){
	$('.showing').eq(i).show();
}
