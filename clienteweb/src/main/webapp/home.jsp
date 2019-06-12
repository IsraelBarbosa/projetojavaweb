<html>
    <head>
        <title>home</title>
    </head>
 
    <body>
        <%
        String email=(String)session.getAttribute("email");
        
        
        if(email==null){
        	response.sendRedirect("index.jsp");
        }
        %>
    
        <p>Bem-vindo <%=email%></p>
        <a href="cliente">Acessar o cadastro de E-mails</a>  
        <a href="logout.jsp">Sair</a>
    </body>
</html>