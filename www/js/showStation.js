function insertStation(a){
	document.getElementById("stationName").value=a;
	$("#tipText2").hide();
	autoFinishStation();
}

function autoFinishStation(){
var str=document.getElementById("stationName").value;
if (str=="")
	{
		document.getElementById("tipText2").innerHTML="";
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
    document.getElementById("tipText2").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","autoFinishStation.asp?q="+str,true);
xmlhttp.send();
$("#tipText2").show();
$("#tipText2").scrollLeft( $("#stationName").scrollLeft() );
$("#tipText2").scrollTop( $("#stationName").scrollTop()+$("#stationName").height() );
width=$("#stationName").width();
$("#tipText2").width( $("#stationName").width() );
}


function showStation()
{
	
	str=document.getElementById("stationName").value;
if (str=="")
  {
  document.getElementById("txtHint2").innerHTML="<p>请输入站点信息！</p>";
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
    document.getElementById("txtHint2").innerHTML=xmlhttp.responseText;
    }
  }
document.getElementById("txtHint2").innerHTML="查询中……";
xmlhttp.open("GET","getStation.asp?q="+str,true);
xmlhttp.send();
 return false;  
}// JavaScript Document
