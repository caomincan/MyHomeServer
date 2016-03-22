<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    <%  
        if(request.getAttribute("id")==null) request.setAttribute("id","0");
        if(request.getAttribute("question")==null) request.setAttribute("question","");
        if(request.getAttribute("A")==null) request.setAttribute("A","");
        if(request.getAttribute("B")==null) request.setAttribute("B","");
        if(request.getAttribute("C")==null) request.setAttribute("C","");
        if(request.getAttribute("D")==null) request.setAttribute("D","");

    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LabVIEW CLAD Practice</title>
</head>
<body>
       <form action='getQ' method="post">
             <input type="hidden" name="NUM" value="1">
             <input type="hidden" name="bnType" value="Start">
             <input type="button" name="command" value="Start" onclick="this.form.submit()"> 
       </form>
        
       <h2> Question <%=request.getAttribute("id").toString()%> </h2>
       <%=request.getAttribute("question") %>

       <form action="getQ" method="post">
            <input type="hidden" name="NUM" value=<%=request.getAttribute("id") %>>
            <input type="radio" name="Usrans" value="0"> A. <%=request.getAttribute("A") %> <br>
            <input type="radio" name="Usrans" value="1"> B. <%=request.getAttribute("B") %> <br>
            <input type="radio" name="Usrans" value="2"> C. <%=request.getAttribute("C") %> <br>
            <input type="radio" name="Usrans" value="3"> D. <%=request.getAttribute("D") %> <br>
            <input type="button" value="Previous" onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
            <input type="button" value="Next" onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
            <input id="bnType" type="hidden"  name="bnType" value="bnType">
       </form> 
</body>
</html>