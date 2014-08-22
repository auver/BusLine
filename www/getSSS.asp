<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<%
response.expires=-1

Dim Coon
Set Coon=Server.CreateObject("ADODB.Connection")
Coon.Open "Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog=Line;Data Source=(local);Integrated Security=SSPI; UID=guest ; pwd=123456",1,1

Dim a
a=request.querystring("a")
Dim b
b=request.querystring("b")

sql="EXEC [GETSSS] N'"&a&"',	N'"&b&"'"

Set rs=Coon.Execute(sql)
if(rs.EOF) Then
response.Write("<p>没有查询到结果</p>")
response.end 
End if

response.Write("<p>查询只显示前10个最优结果</p>")

do until rs.EOF
  for each x in rs.Fields
  if x.name="line1" Then 
	%><p>先乘 <a href="getLine.asp?q=<%=x.value%>" target="_blank"><%=x.value%></a>路，<%
  elseif x.name="station1" Then
  %>从 <%=x.value%> 站上车，<%
  elseif x.name="station2" Then
  %>在 <%=x.value%> 站下车<%
  elseif x.name="rank1" Then
  %>(经过<%=x.value%>站)。<%
  elseif x.name="line2" Then
  %>换乘 <a href="getLine.asp?q=<%=x.value%>" target="_blank"><%=x.value%></a>路，<%
  elseif x.name="station3" Then
  %>在 <%=x.value%> 站下车<%
  elseif x.name="rank2" Then
  %>(经过<%=x.value%>站)。<%
  elseif x.name="Total" Then
  %>总共经过<%=x.value%>站。</p><%
  end if 
  next
  rs.MoveNext
loop

%>
