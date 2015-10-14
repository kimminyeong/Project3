<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.dao.*,java.text.*"%>
<jsp:useBean id="dao" class="com.dao.BoardDAO"/>
<%
	String strPage = request.getParameter("page");
	if(strPage==null)
	{
		// list.jsp?page=1
		strPage="1";
	}
	int curpage = Integer.parseInt(strPage);
	List<BoardDTO> list = dao.boardListData(curpage);
	int totalpage = dao.boardTotalPage();
	int count = dao.boardRowCount();
	count = count-((curpage*10)-10);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board.css"/>
</head>
<body>
	<center>
		<h3>자유게시판</h3>
		<table border=0 width=700>
			<tr>
				<td align=Left>
					<a href="insert.jsp">등록</a>
				</td>
			</tr>
		</table>
		<table border=0 width=700>
			<tr bgcolor=#ccffcc>
				<th height=10% width=10%>번호</th>
				<th height=10% width=45%>제목</th>
				<th height=10% width=15%>이름</th>
				<th height=10% width=20%>작성일</th>
				<th height=10% width=10%>조회수</th>
			</tr>
			<%
				for(BoardDTO d:list)
				{
			%>
					<td width=10% align=center><%=count-- %></td>
					<td width=45% align=left>
					<%
						if(d.getGroup_tab()>0)
						{
							for(int i=0; i<d.getGroup_tab(); i++)
							{
								out.println("&nbsp;&nbsp;");
							}
							out.println("<img src=\"image/re_icon.gif\">");
						}
					%>
					<%
						String msg="관리자에 의해 삭제된 게시물입니다";
						if(!msg.equals(d.getSubject()))
						{
					%>
					<a href="content.jsp?no=<%=d.getNo()%>&page=<%=curpage%>&rn=<%=d.getRownum()%>">
					<%=d.getSubject() %></a>
					<%
						}
						else
						{
					%>
							<span style="color:gray"><%=d.getSubject() %></span>
					<%
						}					
					%>	
					<%
						String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
						String dbday = d.getRegdate().toString();
						if(today.equals(dbday))
						{
							//SimpleDateFormat cannot be resolved to a type
							out.println("<sup><img src=\"image/icon_new.png\"></sup>");
						}
					%>
					</td>
					<td width=15% align=center><%=d.getName() %></td>
					<td width=20% align=center><%=d.getRegdate().toString()%></td>
					<td width=10% align=center><%=d.getHit() %></td>
					</tr>	
			<%
				}
			%>
			</table>
			<hr width=700>
			<table border=0 width=700>
				<tr>
					<td align=right>
					<%=curpage %> page / <%=totalpage %> pages
					</td>
				</tr>
			</table>
	</center>
</body>
</html>