<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<%
response.expires=-1

Dim Coon
Set Coon=Server.CreateObject("ADODB.Connection")
Coon.Open "Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog=Line;Data Source=(local);Integrated Security=SSPI; UID=guest ; pwd=123456",1,1

Dim a
a=request.Form("q")
Dim h
h=request.Form("h")
Dim t
t=request.Form("t")
sql="SELECT STname FROM Station WHERE (STname LIKE '%"&a&"%' AND STname!='"&a&"');"

Set rs=Coon.Execute(sql)

if(rs.EOF) Then 
response.end 
End if

do until rs.EOF
  for each x in rs.Fields
    %>
<li><a href="javascript:IS('<%=x.value%>','<%=h%>','<%=t%>');"><%=x.value%></a></li>
<%
	next
  rs.MoveNext
loop
%>
