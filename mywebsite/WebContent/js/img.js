/// <reference path="jquery-3.1.1.min.js" />
$(function(){
 $('.name1 .btn1 button').click(function(){
   layer.open({
        type: 1,//��������һ��div
        title: "ͼƬ�ϴ�",
        area: ["395px", "275px"],
        content: $(".from")
    });
   });
   $(".from form").submit(function () {
     	 var file = $.trim($(".file").val());//��ȡ�û���
    if (file == "") {
        layer.alert("����Ϊ��Ŷ", {
            title: "��ʾ",
            icon: 5//5�ǿ� 6��Ц
        });
        return false;
    }
    });
    baguetteBox.run('.tz-gallery');
     var i=0;
    $('.demenu .alls').click(function(){
    if(i%2==0){
    $(this).css({'background':'#17ADBD'});
     $(':checkbox').attr({ 'checked': "checked" });
      
    }else{
    	$(this).css({'background':'#fff'});
    	$(':checkbox').attr({ 'checked': false});
    }
    i++;
    });
    $('.dele .demenu button').click(function(){
    $('.dele').hide();
    return false;
    });
    $('.name1 .btn3 button').click(function(){
    $('.dele').show();
    });
     $('.menu1 ul li').eq(0).css({ 'color': '#000','font-weight':'600'});
     $('.menu1 ul li').mouseenter(function () {
        $(this).css({ 'color': '#000','font-weight':'600' })
        /*$('.me li').not($(this)).css({ 'background': '#fff' });*/
    });
    $('.menu1 ul li').not($('.menu1 ul li:first-child')).mouseleave(function () {
        $(this).css({ 'color': '#7e8a8c','font-weight':'400' });
    });
});