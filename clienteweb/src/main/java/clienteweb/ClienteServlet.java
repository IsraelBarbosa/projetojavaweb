package clienteweb;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fabricadeprogramador.model.Cliente;
import br.com.fabricadeprogramador.service.ClienteService;

@WebServlet(urlPatterns = { "/cliente", "/clienteServlet", "/clienteController" })
public class ClienteServlet extends HttpServlet {

	ClienteService clienteService;

	public ClienteServlet() {
		System.out.println("Construindo Servlet...");
	}

	@Override
	public void init() throws ServletException {
		clienteService = new ClienteService();
		System.out.println("Inicializando Servlet");
		super.init();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Chamando o service...");
		super.service(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Cliente cli = new Cliente();
		cli.setEmail("");
		int indice = -1;
		String i = req.getParameter("i");
		if(i!=null && i!="") {
			indice = Integer.parseInt(i);
		}
		String acao = req.getParameter("acao");
		if (i!=null && i!="" && acao!=null && acao!="") {
			if (acao.contentEquals("exc")) {
				indice = Integer.parseInt(i);
				clienteService.excluir(indice);
				//
			}else if (acao.equals("edit")) {
				indice = Integer.parseInt(i);
				cli = clienteService.buscarPorIndice(indice);
			}
			
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("cliente.jsp");
		req.setAttribute("cli", cli);
		req.setAttribute("iCli", indice);
		req.setAttribute("lista", clienteService.getTodosClientes());

		dispatcher.forward(req, resp);
	}

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Recebdno email
		String email = req.getParameter("email");
		String i = req.getParameter("i");
		int indice =-1;
		if (i!=null && i!="") {
			indice = Integer.parseInt(i);
		}
		

		// Colocando email em um objeto cliente
		Cliente cli = new Cliente();
		cli.setEmail(email);

		// adicionando o objeto cliente na Lista de cliente

		clienteService.salvar(indice, cli);
		
		cli = new Cliente();
		cli.setEmail("");

		// System.out.println("Chamou pelo m�todo POST");
		RequestDispatcher dispatcher = req.getRequestDispatcher("cliente.jsp");
		req.setAttribute("msg", "Cadastrado com sucesso!");
		req.setAttribute("cli", cli);
		req.setAttribute("iCli", -1);
		req.setAttribute("lista", clienteService.getTodosClientes());
		dispatcher.forward(req, resp);

		// resp.sendRedirect("cliente");
		// resp.setCharacterEncoding("UTF-8");
		// resp.getWriter().print("Chamou pelo m�todo POST enviando e-mail:"+ email+
		// "!");
	}

	// @Override
	// protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
	// throws ServletException, IOException {

	// }

//@Override
//	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	// }

	@Override
	public void destroy() {
		System.out.println("Servlet est� sendo destruido");
		super.destroy();
	}
}
