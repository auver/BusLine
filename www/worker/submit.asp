<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
response.expires=-1

Dim Coon
Set Coon=Server.CreateObject("ADODB.Connection")
Coon.Open "Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog=Line;Data Source=(local);Integrated Security=SSPI; UID=worker ; pwd=worker",1,1

Dim SEnum
SEnum=request.querystring("SEnum")
Dim isUp
isUp=request.querystring("isUp")
Dim STname
STname=request.querystring("STname")
Dim rank
rank=request.QueryString("rank")

sql="EXEC [COMPLETELine] N'"& SEnum &"',"& isUp &",N'"& STname &"'," & rank

Set rs=Coon.Execute(sql)

%>


