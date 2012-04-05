$(document).ready(function(){
 $("#nav").hover(function(){
   $(".l2").show().css({  
position:'absolute', 

});  
});
});
$(document).ready(function(){
$("#nav").mouseleave(function(){  
$(".l2").slideUp(300);  
});
});
 

