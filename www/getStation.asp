<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<%
response.expires=-1

Dim Coon
Set Coon=Server.CreateObject("ADODB.Connection")
Coon.Open "Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog=Line;Data Source=(local);Integrated Security=SSPI; UID=guest ; pwd=123456",1,1

Dim a
a=request.querystring("q")

sql="EXEC [GETSTATION] N'" & a & "'"

Set rs=Coon.Execute(sql)

if(rs.EOF) Then
response.Write("<p>没有查询到结果</p>")
response.end 
End if
response.Write("<p>")
do until rs.EOF
  for each x in rs.Fields
  if x.value=true Then 
    response.write("（上行）")
	elseif x.value=false Then response.write("（下行）")
	else
	%>

<a href="getLine.asp?q=<%=x.value%>" target="new"><%=x.value%></a>
<%
	end if
  next
  rs.MoveNext
loop
%>
</p>
