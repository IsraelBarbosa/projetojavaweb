<html>
    <head>
        <title>Login</title>
    </head>
 
    <body>
        <%
        String email=(String)session.getAttribute("email");
        
        
        if(email!=null){
            response.sendRedirect("home.jsp");
        }
 
        String status=request.getParameter("status");
        
        if(status!=null){
        	if(status.equals("false")){
        		   out.print("Dados incorretos!");	           		
        	}
        	else{
        		out.print("Error!");
        	}
        }
        %>
    
        <form action="loginRequestHandler.jsp">
            <table cellpadding="5">
                <tr>
                    <td><b>Email:</b></td>
                    <td><input type="text" name="email" required/></td>
                </tr>
 
                <tr>
                    <td><b>Senha:</b></td>
                    <td><input type="password" name="password" required/></td>
                </tr>
 
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Login"/></td>
                </tr>
 
            </table>
        </form>
    
    </body>
</html>