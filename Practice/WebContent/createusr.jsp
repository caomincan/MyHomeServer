<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New User</title>
</head>
<body>
  <div align='center'>
   <form  action='usrcreate' method='post'>
         <h2> Create New User</h2><br>
         <p>  <% if(request.getAttribute("warning")!=null) { %> 
                  <%=request.getAttribute("warning") %>
               <%} %> </p><br>
         User name(within 10 letters): <input type='text' name='username'><br>
         User password(within 10 letters):<input type='password' name='psd'><br>
         Confirm password:<input type='password' name='cfpsd'><br>
         First name: <input type='text' name='firstname'><br>
         Last name:  <input type='text' name='lastname'> <br>
         Phone number: <input type='text' name='mobile'> <br>
         
         <input type='button' name='choice' value='Login' onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
         <input type='button' name='choice' value='Submit' onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
         <input id="bnType" type="hidden"  name="bnType" value="bnType">
   </form>
   </div>
</body>
</html>