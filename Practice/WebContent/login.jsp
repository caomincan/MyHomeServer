<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
   <div align='center'>
   <form  action='usrcheck' method='post'>
         <h2> User Login</h2><br>
         <p>  <% if(request.getAttribute("warning")!=null) { %> 
                  <%=request.getAttribute("warning") %>
               <%} %> </p><br>
         User name: <br>
         <input type='text' name='username'><br>
         User password:<br>
         <input type='password' name='psd'><br>
         <input type='button' name='choice' value='Login' onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
         <input type='button' name='choice' value='Create User' onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
         <input id="bnType" type="hidden"  name="bnType" value="bnType">
   </form>
   </div>
</body>
</html>