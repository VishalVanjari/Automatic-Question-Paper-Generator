<%@page import="com.quegen.db.ConnectDB" %>
<%@page import="java.sql.*" %>
<%@page import="com.quegen.services.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Doctor</title>
</head>
<body>
<%
	int qid=Integer.parseInt(request.getParameter("q_id"));
	Connection con = ConnectDB.getConnect();
	PreparedStatement ps1 = con.prepareStatement("delete from questions where q_id=?");
	ps1.setInt(1,qid);
	int i = ps1.executeUpdate();
	if(i>0){
		response.sendRedirect("deleteQuestion.jsp");
	}else{
		response.sendRedirect("teacherDashboard.html");
	}
%>
</body>
</html>