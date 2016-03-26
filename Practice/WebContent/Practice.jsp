<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    <%  
    final Integer  TOTAL = 40;
    char[] thisUsrAns;  
    if(request.getAttribute("id")==null) request.setAttribute("id","0");
    if(session.getAttribute("ans")==null){
        	thisUsrAns= new char[TOTAL];
            for(int i=0;i<TOTAL;i++)
 			   thisUsrAns[i]=' ';
     	   session.setAttribute("ans", String.valueOf(thisUsrAns));
        }
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LabVIEW CLAD Practice</title>
</head>
<body>
       <% if(((String)request.getAttribute("id")).equals("0")){ %> 
        <h2>Certified LabVIEW Associate Developer Exam</h2>
        <h4> Note:  .</h4>
             <ul>  <li>The copyright of questions belong to National Instrument </li>
                   <li> No use of commercial. This site is only purpose for web database application training </li>
                   </ul>   
       
        <p> Exam Details: 
            <ul> <li> Time allocated: 1 hour </li>
                 <li> Type of exam items: Multiple choice </li>
                 <li> Number of exam items: 40 questions </li>
                 <li> Passing Grade: 70% </li>
            </ul>
            </p>  
       <form action='getQ' method="post">
             <input type="hidden" name="NUM" value="1">
             <input type="hidden" name="bnType" value="Start">
             <input type="button" name="command" value="Start" onclick="this.form.submit()"> 
       </form>
       <%} else {  %>
       <h2> Question <%=request.getAttribute("id").toString()%> </h2>
      <h4><%=request.getAttribute("question") %> </h4>
       <form action="getQ" method="post">
            <input type="hidden" name="NUM" value=<%=request.getAttribute("id") %>>
            <input id="A" type="radio" name="Usrans" value="A"> A. <%=request.getAttribute("A") %> <br>
            <input id="B" type="radio" name="Usrans" value="B"> B. <%=request.getAttribute("B") %> <br>
            <input id="C" type="radio" name="Usrans" value="C"> C. <%=request.getAttribute("C") %> <br>
            <input id="D" type="radio" name="Usrans" value="D"> D. <%=request.getAttribute("D") %> <br>
            <input type="button" value="Previous" onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
            <input type="button" value="Next" onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
            <input type="button" value="Submit" onclick="document.getElementById('bnType').value=this.value;this.form.submit()">
            <input id="bnType" type="hidden"  name="bnType" value="bnType">
       </form>
            <%  Integer x = Integer.valueOf((String)request.getAttribute("id"))-1;
                String checked = session.getAttribute("ans").toString();
                if(checked.charAt(x) != ' ') {
            %>
                  <script  type="text/javascript">
                        var name = '<%=checked.charAt(x) %>';
                        document.getElementById(name).checked="checked";
                  </script>
            <%}
                } %>
</body>
</html>