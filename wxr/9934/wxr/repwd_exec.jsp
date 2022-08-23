<%@ page contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<html>
<head>
<meta charset="utf-8" />
<title>signup</title>
</head>
<body>
signup_page
<%
/*
create table allusers(
id int primary key auto_increment,
userid char(32),
password char(25)
);
*/
Connection conn=null;
ResultSet rs=null;
PreparedStatement pstmt=null;
boolean succ=false;
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
		succ=false;
	}else{
		try{
//			pstmt=conn.prepareStatement("insert into allusers (id,userid,password) values (srluid.nextval,?,?)");// Oracle
			pstmt=conn.prepareStatement("insert into allusers (userid,password) values (?,?)");// MySQL
			pstmt.setString(1,userid);
			pstmt.setString(2,pwd);
			pstmt.executeUpdate();
			conn.commit();
			//代码执行到这里，说明访问成功
			succ=true;
		}catch(Exception ex){
			succ=false;
		}
	}
}catch(Exception e){
	succ=false;
}finally{
	try{conn.setAutoCommit(true);}catch(Exception ex){}
	try{rs.close();}catch(Exception ex){}
	rs=null;
	try{pstmt.close();}catch(Exception ex){}
	pstmt=null;
	try{conn.close();}catch(Exception ex){}
	conn=null;
	if(succ){
		response.sendRedirect("login.html");
	}else{
		response.sendRedirect("signup.html");
	}
}
%>
</body>
</html>
