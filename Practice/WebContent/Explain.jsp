<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2> Question <%=request.getAttribute("id").toString()%> </h2>
      <h4><%=request.getAttribute("question") %> </h4>
       <form action="getQ" method="post">
            <input type="hidden" name="NUM" value=<%=request.getAttribute("id") %>>
            <input id="A" type="radio" name="Usrans" value="A"> A. <%=request.getAttribute("A") %> <br>
            <input id="B" type="radio" name="Usrans" value="B"> B. <%=request.getAttribute("B") %> <br>
            <input id="C" type="radio" name="Usrans" value="C"> C. <%=request.getAttribute("C") %> <br>
            <input id="D" type="radio" name="Usrans" value="D"> D. <%=request.getAttribute("D") %> <br>
            <input type="submit"  value="Return">
            <input id="bnType" type="hidden"  name="bnType" value="Submit">
       </form>
        <%  Integer x = Integer.valueOf((String)request.getAttribute("id"))-1;
                String checked = session.getAttribute("ans").toString();
                if(checked.charAt(x) != ' ') {
            %>
                  <script  type="text/javascript">
                        var name = '<%=checked.charAt(x) %>';
                        document.getElementById(name).checked="checked";
                  </script>
            <%} %>
       <div>
            <h4> Explain:</h4>
            <p> <%=request.getAttribute("explain") %></p>
       </div>
</body>
</html>