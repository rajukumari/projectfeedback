<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
String str, str1, name, password;
String t2=new String();
String t=request.getParameter("t");
if(t.equals("2"))
{
	name=request.getParameter("Name");
	password=request.getParameter("PASSWORD");
	//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 	//Connection c=DriverManager.getConnection("jdbc:odbc:college");
         Class.forName("com.mysql.jdbc.Driver");
    Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root","root");
	Statement s =c.createStatement();
	String sql = "select * from admin";
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		str=rs.getString("aduname");	
		str1=rs.getString("adpw");
		if(name.compareTo(str)==0 && password.compareTo(str1)==0)
		{
			%><jsp:forward page="adminhome.html"/> <%
		}
		else{
			
			t2="User Name and password incorrect";		}

	}
	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINSTRATOR LOGIN FORM</title>
<script language="javascript" >
function fun3()
{
	var name=document.adminlogin.Name.value;
	var pass=document.adminlogin.PASSWORD.value;
	if(name =="" || pass == "")
	{
			alert("Enter the Details First");
			document.adminlogin.Name.focus();
			return false;
	}
}
</script>
  <link rel="stylesheet" href="admin.css">
</head>
<body>

<form name="adminlogin" action="adminlogin.jsp?t=2" onsubmit="return fun3()" method=post>
<center>
 <div class="box">
            <h2>Admin Login</h2>
            <form>
                <div class="inputBox">
                    <input type="text" name="Name" required="">
                    <label>Username</label>
                </div>
                <div class="inputBox">
                    <input type="password" name="PASSWORD" required=""><%=t2 %>
                    <label>Password</label>
                </div>
                <input type="submit" name="" value="Submit">

<br><br><br>

<a href="home.html" >Back To Home Page</a><br><br>

</center>
</form>
</body>
</html>