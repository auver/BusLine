function showSS()
{
	str1=document.getElementById("station1").value;
	str2=document.getElementById("station2").value;
if ( str1=="" || str2=="" )
  {
  document.getElementById("txtHint3").innerHTML="<p>请输入站点信息！</p>";
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
    document.getElementById("txtHint3").innerHTML=xmlhttp.responseText;
    }
  }
document.getElementById("txtHint3").innerHTML="查询中……";
if( document.getElementById("transfer0").checked )
{
xmlhttp.open("GET","getSS.asp?a="+str1+"&b="+str2,true);
}
else 
{
xmlhttp.open("GET","getSSS.asp?a="+str1+"&b="+str2,true);
}
xmlhttp.send();
return false;  
}// JavaScript Document
