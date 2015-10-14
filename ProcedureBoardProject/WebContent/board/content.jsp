<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.dao.*"%>
<jsp:useBean id="dao" class="com.dao.BoardDAO"/>
<%
	String strNo=request.getParameter("no");
	String strPage=request.getParameter("page");
	String strRn=request.getParameter("rn");
	// DB연동
	BoardDTO d = dao.boardContentData(Integer.parseInt(strNo));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" type="text/css" href="board.css"/>
</head>
<body>
	<center>
		<h3>내용보기</h3>
		  <center>
    <table border=1 width=500 cellpadding="0" cellspacing="0">
      <tr heigth=27>
        <td width=20% align=center bgcolor="#ccccff">번호</td>
        <td width=30% align=center><%=d.getNo() %></td>
        <td width=20% align=center bgcolor="#ccccff">작성일</td>
        <td width=30% align=center><%=d.getRegdate().toString() %></td>
      </tr>
      <tr heigth=27>
        <td width=20% align=center bgcolor="#ccccff">이름</td>
        <td width=30% align=center><%=d.getName() %></td>
        <td width=20% align=center bgcolor="#ccccff">조회수</td>
        <td width=30% align=center><%=d.getHit() %></td>
      </tr>
      <tr heigth=27>
        <td width=20% align=center bgcolor="#ccccff">제목</td>
        <td colspan="3" align=left><%=d.getSubject() %></td>
      </tr>
      <tr>
        <td align=left valign="top" height=200 colspan="4">
        <%=d.getContent() %>
        </td>
      </tr>

    </table>
    <table border=0 width=500>
    	<tr>
    		<td align=right>
    			<a href="update.jsp?no=<%=strNo%>&page=<%=strPage%>">수정</a>&nbsp;
    			<a href="delete.jsp?no=<%=strNo%>&page=<%=strPage%>">삭제</a>&nbsp;
    			<a href="list.jsp?page=<%=strPage %>">목록</a>&nbsp;
      </tr>
    </table>
  </center>
	</center>
</body>
</html>