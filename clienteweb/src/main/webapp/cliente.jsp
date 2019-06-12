<!DOCTYPE html>
<%@page import="br.com.fabricadeprogramador.model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de e-mails</title>
<script>

function confirma(pi){
	
	if (window.confirm("Tem certeza que deseja excluir?")){
	
	location.href="cliente?acao=exc&i="+ pi ;
	}
}

</script>
</head>
<body>
<a href="logout.jsp">Sair</a>
<div>

	<%
		Object msg=	request.getAttribute("msg");
		if (msg!=null){
			String msgStr = (String)msg;
			out.print(msg);
		}
		
		Cliente cli = (Cliente) request.getAttribute("cli");
		
		Object iCli = request.getAttribute("iCli");
	%>

</div>

<form method="post" action="cliente">

	<input type="hidden" name="i" value="<%=iCli%>"/>
	E-mail:
	<input type="text" value="<%=cli.getEmail() %>" name="email" />
	<input type="submit" value="Save">

</form>

<% 
List<Cliente> lista = (List<Cliente>)request.getAttribute("lista");
try { 
	int i=0; 
	for (Cliente c: lista) {
%>
	<b><%=c.getEmail() %>  </b>
	<a href="javascript:confirma(<%=i%>)"> excluir </a>|
	<a href="cliente?i=<%=i%>&acao=edit"> editar </a><br/>

<% 
	i++;
	}
} 
catch (NullPointerException e) { } 
%>

</body>
</html>