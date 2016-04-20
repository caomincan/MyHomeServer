<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Your Test Result</title>
<% 
  final Integer  TOTAL = 40;
  String result =(String) session.getAttribute("ans");
  String correctAns = (String) session.getAttribute("right");
  Integer point =0;
%>
</head>
<body>
   <div align="center">
      <h2> Your CLAD Test Result</h2>
        	 <table align="center">
        	  <tr align="center">  <td> Number </td> 
        	                       <td> Your Answer </td>
        	                       <td> Correct Answer </td> 
        	                       <td> Result </td> 
        	                       <td> Explanation </td>
        	                       </tr>
        	      <% for(int i=0;i<TOTAL;i++) { %>
        	       <tr align="center">
        	        <td> <%=String.valueOf(i+1) %> </td>
        	        <td> <%=result.charAt(i) %>    </td>
        	        <td> <%=correctAns.charAt(i) %></td>
        	        <td>  <%=result.charAt(i)==correctAns.charAt(i)?
        	        		"<img src=\"src/right.png\" width=\"50px\" height=\"50px\">":
        	        		"<img src=\"src/wrong.png\" width=\"50px\" height=\"50px\">"%>                        
        	        </td>
        	        <td>   <form action="getQ" method="post">
        	               <input type="hidden" name="NUM" value=<%=String.valueOf(i+1)%>>
        	               <input type="submit" value="Explain">
        	               <input type="hidden" name="bnType" value="Explain">
        	               </form>
        	        </td>
        	        <% if(result.charAt(i)==correctAns.charAt(i)) point++;%>
        	        </tr>
        	      <%} %> 
               </table>
       </div>
       <h2 align="center"> Your Point is: <%=point %></h2>
</body>
</html>