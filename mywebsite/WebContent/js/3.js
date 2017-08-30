/// <reference path="jquery-3.1.1.min.js" />
var i = 0;
var timer;
$(function () {
    
    $('.div3 ul li ').mouseenter(function () {
        $(this).css({ 'background': '#eee' });
        $(this).find('span').css({ 'color': '#0a95fe' })
        $('.div3 li').not($(this)).css({ 'background': '#0a95fe' });
    });
    $('.div3 ul li ').mouseleave(function () {
       
        $(this).css({ 'background': '#0a95fe' });
        $(this).find('span').css({ 'color': '#fff' });
    });
    $(".imgs").eq(0).show().siblings().hide();//所有标签为ig 0为缩影 class为ig的第一个对象 sibling找到兄弟元素
    //$("#igs").hover(function () { $(".btn").show(); }, function () { $(".btn").hide(); });
    Showtime();

    /*$(".tab").hover(function () {//hover鼠标放上去做什么，放下来做什么
        i = $(this).index();//$(this)鼠标当前放到的那个对象
        Show();
        clearInterval(timer);
    }, function () {
        Showtime();
    }
        );*/
    $(".tab").hover(function () {//hover鼠标放上去做什么，放下来做什么
        i = $(this).index();//$(this)鼠标当前放到的那个对象
        Show();
        clearInterval(timer);
    }, function () {
        Showtime();
    }
        );
    $('.s1 a').hover(function () {
        $(this).css({ 'color': '#ff0000' });
    }, function () {
        $(this).css({ 'color': '#000' });
    });

   
  
   $('.odd').click(function(){
	   $('.div2').toggle();
   });
   $('.div3').mouseleave(function(){
	    $('.div2').hide();
	    });
   $('.ser .log button').click(function(){
   layer.open({
        type: 1,//弹出的是一个div
        title: "头像上传",
        area: ["395px", "275px"],
        content: $(".headimg")
    });
   });
   $(".from form").submit(function () {
     	 var file = $.trim($(".file").val());//获取用户名
    if (file == "") {
        layer.alert("不能为空哦", {
            title: "提示",
            icon: 5//5是哭 6是笑
        });
        return false;
    }
    });
     $(".headimg form").submit(function () {
     	 var file = $.trim($(".headimg .file").val());//获取用户名
    if (file == "") {
        layer.alert("不能为空哦", {
            title: "提示",
            icon: 5//5是哭 6是笑
        });
        return false;
    }
    });
});
function Show() {
    $(".imgs").eq(i).fadeIn(300).siblings().fadeOut(300);
    $(".tab").eq(i).addClass("bg").siblings().removeClass("bg");
}
function Showtime() {
    timer = setInterval(function () {//间隔多久干什么
        i++;
        if (i == 7) {
            i = 0;
        }
        Show();
    }, 3000);
}
function showlog() {
    layer.open({
        type: 1,//弹出的是一个div
        title: "图片上传",
        area: ["395px", "300px"],
        content: $(".from")
    });
}



