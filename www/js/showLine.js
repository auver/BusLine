function insertLine(a){
	document.getElementById("lineName").value=a;
	$("#tipText1").hide();
	autoFinishLine();
}

function autoFinishLine(){
var str=document.getElementById("lineName").value;
if (str=="")
	{
		document.getElementById("tipText1").innerHTML="";
		return;
	}
if (window.XMLHttpRequest)
  {// 针对 IE7+, Firefox, Chrome, Opera, Safari 的代码
  xmlhttp=new XMLHttpRequest();
  }
else
  {// 针对 IE6, IE5 的代码
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("tipText1").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","autoFinishLine.asp?q="+str,true);
xmlhttp.send();
$("#tipText1").show();
$("#tipText1").scrollLeft( $("#lineName").scrollLeft() );
$("#tipText1").scrollTop( $("#lineName").scrollTop()+$("#lineName").height() );
$("#tipText1").width( $("#lineName").width() );
}

function showLine()
{
str=document.getElementById("lineName").value;
if (str=="")
  {
  document.getElementById("txtHint1").innerHTML="<p>请输入线路信息！</p>";
  return false;
  }
if (window.XMLHttpRequest)
  {// 针对 IE7+, Firefox, Chrome, Opera, Safari 的代码
  xmlhttp=new XMLHttpRequest();
  }
else
  {// 针对 IE6, IE5 的代码
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint1").innerHTML=xmlhttp.responseText;
    }
  }
document.getElementById("txtHint1").innerHTML="查询中……";
xmlhttp.open("GET","getLine.asp?q="+str,true);
xmlhttp.send();
return false;  
}
// JavaScript Document
