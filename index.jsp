<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Lista de Atividades</h1>
	<form action="<%=request.getContextPath()%>/add" method="post">
		<input type="text" name="atividade" placeholder="Atividade"/>
		<input type="submit" value="Adicionar">
	</form>
	
	<%
		Object o = request.getSession().getAttribute("lista");
	    int i = 0;
		if (o instanceof List<?>) {
			List<String> itens = (List<String>) o;
			for (String item : itens) {
		
	%>
	<div><%=item%>
		<a href="<%=request.getContextPath() %>/delete?index=<%=i %>">remover</a>
	</div>
	<%
				i++;
			}
		}
	
	%>
</body>
</html>
