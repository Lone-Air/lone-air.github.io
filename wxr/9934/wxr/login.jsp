<%@ page contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<html>
<head>
<meta charset="utf-8" />
<title>login</title>
</head>
<body>
login
<%
/*
create table allusers(
id int primary key,
userid char(32),
password char(25)
);
*/
Connection conn=null;
ResultSet rs=null;
PreparedStatement pstmt=null;
boolean auth_pass=false;
String userid="";
String pwd="";
try{
	userid=request.getParameter("username");
	pwd=request.getParameter("password");
	conn=DriverManager.getConnection("proxool.orcl");
	conn.setAutoCommit(false);
	pstmt=conn.prepareStatement("select * from allusers where trim(userid)=?");
	pstmt.setString(1,userid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		if(rs.getString("password").trim().equals(pwd)){
			auth_pass=true;
			out.println("0<br />");
		}else{
			auth_pass=false;
			out.println("1<br />");
		}
	}else{
		auth_pass=false;
		out.println("2<br />");
	}
}catch(Exception e){}finally{
	try{conn.setAutoCommit(true);}catch(Exception ex){}
	try{rs.close();}catch(Exception ex){}
	rs=null;
	try{pstmt.close();}catch(Exception ex){}
	pstmt=null;
	try{conn.close();}catch(Exception ex){}
	conn=null;
	out.println(auth_pass);
	if(auth_pass){
		HttpSession session1=request.getSession();
		session1.setAttribute("userid",userid);
		response.sendRedirect("./");
	}else{
		response.sendRedirect("login.html");
	}
}
%>
</body>
</html>
