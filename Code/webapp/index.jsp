<%@ page import="agreement.Packages" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sangzhan
  Date: 2019-12-25
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>欢迎使用KingShark</title>
</head>

<body>
<center>
    <h1>WireShark Pro</h1>
</center>

  <table  width="100%" border="1">
    <tr>
      <th>versions</th>
      <th>Source </th>
      <th>destination </th>
      <th>Protocol </th>
      <th>Length</th>
      <th>start analyze</th>
    </tr>
    <%List<Packages> list= (List<Packages>) request.getAttribute("list");%>
    <tr>
      <% for (Packages items : list) { %>
      <td><%=items.ipversions %></td>
      <td><%=items.ipsourceaddress %></td>
      <td><%=items.ipdestinationaddress%></td>
      <td><%=items.ipagreement%></td>
      <td><%=items.Length%></td>
      <td><button onclick="particularAnalyst()">详细分析</button></td>
      <script>
        function particularAnalyst(){
          alert("IP协议分析:\n\n版本:<%=items.ipversions%>\n首部长度:<%=items.ipheadLength%>\n总长度："
                  + "<%=items.iptotalLength%>\n标识:<%=items.ipidentificationNumber%>\n标志:<%=items.ipsignnumber%>"
                  + "\n片偏移:<%=items.ipSliceOffsetNUmber%>\n协议:<%=items.ipagreement%>\n首部校验和:<%=items.ipheadCheckSum%>"
                  + "\n源地址:<%=items.ipsourceaddress%>\n目的地址:<%=items.ipdestinationaddress%>");
          <%if(items.ipagreement=="TCP"){%>
          alert("TCP协议分析:\n源端口:<%=items.tcpsourcePort%>\n目的端口:<%=items.tcpdestinationPort%>\n序号:"
                  +"<%=items.tcpserialNumber%>\n确认号:<%=items.tcpconfirmationNumber%>\n窗口大小:<%=items.tcpwindowSize%>");
          <%}%>
          <%if(items.ipagreement=="ICMP"){%>
          alert("ICMP协议分析:\n\n类型:<%=items.icmpType%>\n代码:<%=items.icmpcode%>\n校验和:<%=items.icmpChecksum%>");
          <%}%>
          <%if(items.ipagreement=="UDP"){%>
          alert("UDP协议分析:\n\n源端口:<%=items.udpsourcePort%>\n目的端口:<%=items.udpdestinationPort%>"
                  +"\n长度:<%=items.udpLength%>\n校验和:<%=items.udpChecksum%>");
          <%}%>
          alert("数据包:<%=items.response%>");
        }
      </script>
    </tr>
    <%}%>

  </table>
</body>
</html>
