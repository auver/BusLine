<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<%Session.CodePage=65001%>
<%
Dim a
a=request.querystring("q")
%>
<html><head>
<meta charset="utf-8">
<title>合肥公交查询-<%=a%></title>
</head><body>
<%
response.expires=-1

Dim Coon
Set Coon=Server.CreateObject("ADODB.Connection")
Coon.Open "Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog=Line;Data Source=(local);Integrated Security=SSPI; UID=guest ; pwd=123456",1,1

sql="EXEC [GETService] N'"& a &"',1"

Set rs=Coon.Execute(sql)

if(rs.EOF) Then 
response.Write("<p>没有查询到结果</p>")
response.end 
End if

tmp=rs.GetRows()

%>
<table width="600" border="1" align="center" cellspacing="0">
  <tr>
    <td width="100"><strong>线路名称</strong></td>
    <td colspan="3"><%=tmp(0,0)%></td>
  </tr>
  <tr>
    <td><strong>运营公司</strong></td>
    <td colspan="3"><%=tmp(8,0)%></td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#CCCCCC"><strong>上行路线</strong></td>
  </tr>
  <tr>
    <td>发车间隔</td>
    <td colspan="3"><%=tmp(1,0)%></td>
  </tr>
  <tr>
    <td>冬季首班车</td>
    <td width="100"><%=tmp(2,0)%></td>
    <td width="100">冬季末班车</td>
    <td width="100"><%=tmp(3,0)%></td>
  </tr>
  <tr>
    <td>夏季首班车</td>
    <td><%=tmp(4,0)%></td>
    <td>夏季末班车</td>
    <td><%=tmp(5,0)%></td>
  </tr>
  <tr>
    <td>非空调车价格</td>
    <td><%=FormatCurrency(tmp(6,0))%></td>
    <td>空调车价格</td>
    <td><%=FormatCurrency(tmp(7,0))%></td>
  </tr>
  <tr>
    <td>途径站点</td>
    <td colspan="3"><%

sql="EXEC [GETLine] N'"& a &"',1"

Set rs=Coon.Execute(sql)

do until rs.EOF
  co=1
  for each x in rs.Fields
    response.write( x.value )
	if co\2=0 Then
	response.write(".")
	elseif co\2=1 Then
	response.Write(" ")
	end if
	co=co+1
  next
  rs.MoveNext
loop

''''''开始输出下行线路

sql="EXEC [GETService] N'"& a &"',0"
Set rs=Coon.Execute(sql)
if(rs.EOF) Then 
response.Write("</td></tr></table>")
response.end 
End if
tmp=rs.GetRows()

%></td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#CCCCCC"><strong>下行路线</strong></td>
  </tr>
  <tr>
    <td>发车间隔</td>
    <td colspan="3"><%=tmp(1,0)%></td>
  </tr>
  <tr>
    <td>冬季首班车</td>
    <td><%=tmp(2,0)%></td>
    <td>冬季末班车</td>
    <td><%=tmp(3,0)%></td>
  </tr>
  <tr>
    <td>夏季首班车</td>
    <td><%=tmp(4,0)%></td>
    <td>夏季末班车</td>
    <td><%=tmp(5,0)%></td>
  </tr>
  <tr>
    <td>非空调车价格</td>
    <td><%=FormatCurrency(tmp(6,0))%></td>
    <td>空调车价格</td>
    <td><%=FormatCurrency(tmp(7,0))%></td>
  </tr>
  <tr>
    <td>途径站点</td>
    <td colspan="3"><%

sql="EXEC [GETLine] N'"& a &"',0"
Set rs=Coon.Execute(sql)

do until rs.EOF
  co=1
  for each x in rs.Fields
    response.write( x.value )
	if co\2=0 Then
	response.write(".")
	elseif co\2=1 Then
	response.Write(" ")
	end if
	co=co+1
  next
  rs.MoveNext
loop

%></td>
  </tr>
</table>
</body>
</html>
