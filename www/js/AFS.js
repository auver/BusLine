$(document).ready(function(){
	$(".station").keyup(function(){
  		str=$(this).val();
		if (str=="")
		{
			$(this).parents(".txtbox").find('ul').html("");
			return;
		}
		$Rthis=$(this);
		$.post("autoFinishStation.asp",{q:str,h:$Rthis.attr("id"),t:$Rthis.parents(".txtbox").find('ul').attr("id")},
			function(data,status){
			$Rthis.parents(".txtbox").find('ul').html(data);
		});
		
if( $(this).parents(".txtbox").find('ul').html() ) 
	$(this).parents(".txtbox").find('ul').show();
$(this).parents(".txtbox").find('ul').scrollLeft( $(this).scrollLeft() );
$(this).parents(".txtbox").find('ul').scrollTop( $(this).scrollTop()+$(this).height() );
$(this).parents(".txtbox").find('ul').width( $(this).width() );

	});

})

function IS(a,h,t){
	document.getElementById(h).value=a;
	document.getElementById(t).style.display="none";
}
// JavaScript Document
