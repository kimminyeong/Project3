<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dao" class="com.dao.BoardDAO"/>
<jsp:useBean id="d" class="com.dao.BoardDTO">
 <jsp:setProperty name="d" property="*"/>
 </jsp:useBean>
 <%
 	dao.boardInsert(d);
 	response.sendRedirect("list.jsp");
 %>