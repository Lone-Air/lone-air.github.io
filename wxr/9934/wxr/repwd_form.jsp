<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%
HttpSession session1=request.getSession();
String userid="";
try{
	userid=session1.getAttribute(userid);
	if(userid.equals("")||userid==null){
		throw;
	}
}catch(Exception e){
	response.sendRedirect("login.html");
}
%>

<html>
<head>
	<meta charset="utf-8" />
	<title>reset password</title>
	<link rel="stylesheet" type="text/css" href="../css/header.css" />
	<link rel="stylesheet" type="text/css" href="../css/loginpage.css?v=1" />
<!--[if IE]>
<script type="text/javascript">alert("此为IE版本，可能会不稳定")</script>
<![endif]-->
</head>
<body>
<div id="header">
	<a href="./">
		<span style="color:#ff0000">9</span>
		<span style="color:#0000ff">9</span>
		<span style="color:#00ff00">3</span>
		<span style="color:#ff00ff">4</span>
		<span style="color:#fff000">小</span>
		<span style="color:#00cccc">游</span>
		<span style="color:#ff0000">戏</span>
	</a>
	<div style="height:3px;width:100%;background-color:#aaaaaa;" align="center"></div>
	<div style="height:3px;width:100%;background-color:#ffffff;" align="center"></div>
</div>
<a href="#top"><div id="topbutton" style="display:hidden"></div></a>
<script>
(function(){
	var topE=document.getElementById("topbutton");
	window.onload=document.body.onscroll=function(){
		if(window.scrollY>10){
			topE.style.display="block"
		}else{
			topE.style.display="none"
		}
	}
})()
</script>

<div id="content" align="center">
	<div id="login">
		<form id="main" method="post" action="signup.jsp">
			<table class="layout-table">
				<tr>
					<td>账号：</td>
					<td>
						<%=userid%><br />
						<a href="login.html">变更...</a>
					</td>
				</tr>
				<tr>
					<td>旧密码：</td>
					<td>
						<div id="oldshow"></div>
						<input type="text" id="oldact" />
					</td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td>
						<div id="pwdshow"></div>
						<input type="text" id="pwdact" />
					</td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td>
						<div id="pwdshow2"></div>
						<input type="text" id="pwdact2" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="button" value="清空密码" id="reset" />
						<input type="submit" value="注册" id="subm" />
					</td>
				</tr>
			</table>
			<input type="hidden" id="password" name="password" />
		</form>
	</div>
	<a href="login.html">登录现有账号</a>
</div>

<script>
var pwdshow	=document.getElementById("pwdshow"),
	pwdact	=document.getElementById("pwdact"),
	pwdshow2=document.getElementById("pwdshow2"),
	pwdact2	=document.getElementById("pwdact2"),
	oldshow2=document.getElementById("oldshow2"),
	oldact2	=document.getElementById("oldact2"),
	pwdsubm	=document.getElementById("password"),
	pwdrst	=document.getElementById("reset"),
	subm	=document.getElementById("subm"),
	form	=document.getElementById("main"),
	oldv	="",
	pwdv	="",
	pwdv2	="";

oldshow.onclick=function(){
	oldact.focus();
}
oldact.onfocus=function(){
	oldshow.style.padding="0px 1px";
	oldshow.style.border="2px solid #000";
}
oldact.onblur=function(){
	oldshow.style.padding="1px 2px";
	oldshow.style.border="1px solid #767676";
}
oldact.oninput=function(){
	oldact.value=oldact.value.replace(/[^a-zA-Z0-9+=_-]/g,'');	// 字母、数字、加号、等号、下划线、减号，全局匹配
	if(oldact.value.length==1){
		oldv+=oldact.value;
	}
	oldact.value="";
	oldshow.innerText="*".repeat(Math.min(oldv.length,25));
}


pwdshow.onclick=function(){
	pwdact.focus();
}
pwdact.onfocus=function(){
	pwdshow.style.padding="0px 1px";
	pwdshow.style.border="2px solid #000";
}
pwdact.onblur=function(){
	pwdshow.style.padding="1px 2px";
	pwdshow.style.border="1px solid #767676";
}
pwdact.oninput=function(){
	pwdact.value=pwdact.value.replace(/[^a-zA-Z0-9+=_-]/g,'');	// 字母、数字、加号、等号、下划线、减号，全局匹配
	if(pwdact.value.length==1){
		pwdv+=pwdact.value;
	}
	pwdact.value="";
	pwdshow.innerText="*".repeat(Math.min(pwdv.length,25));
}


pwdshow2.onclick=function(){
	pwdact2.focus();
}
pwdact2.onfocus=function(){
	pwdshow2.style.padding="0px 1px";
	pwdshow2.style.border="2px solid #000";
}
pwdact2.onblur=function(){
	pwdshow2.style.padding="1px 2px";
	pwdshow2.style.border="1px solid #767676";
}
pwdact2.oninput=function(){
	pwdact2.value=pwdact2.value.replace(/[^a-zA-Z0-9+=_-]/g,'');	// 字母、数字、加号、等号、下划线、减号，全局匹配
	if(pwdact2.value.length==1){
		pwdv2+=pwdact2.value;
	}
	pwdact2.value="";
	pwdshow2.innerText="*".repeat(Math.min(pwdv2.length,25));
}


pwdrst.onclick=function(){
	pwdshow.innerText=pwdact.value=pwdshow2.innerText=pwdact2.value=pwdsubm=pwdv="";
	pwdact.focus();
}
subm.onclick=function(){
	var r=true;
	if(document.getElementById("username").value.length>16){
		alert("账号最长16字符，支持中文、英文、数字、符号。");
		r=false;
	}
	if(pwdv.length<4||pwdv.length>26){
		alert("密码为4-25位，支持英文、数字。");
		r=false;
	}
	if(pwdv!=pwdv2){
		alert("密码不相同。");
		r=false;
	}
	return r;
}
</script>
</body>
</html>