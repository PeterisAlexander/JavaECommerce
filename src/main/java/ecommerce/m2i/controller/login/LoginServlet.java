package ecommerce.m2i.controller.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.m2i.dao.UserDao;
import ecommerce.m2i.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String username = request.getParameter("inputName");
		String password = request.getParameter("inputPassword");
		System.out.println("username reçu = " + username);

		UserDao udao = new UserDao();

		try {
			List<User> luser = udao.getUsersByUsernameAndPassword(username, password);
			if (luser.size() > 0) {
				// authentification ok, redirection vers la liste des patients
				// confirmation d'authentification
				request.getSession().setAttribute("user", luser.get(0));
				// response.getWriter().println("ok");
				response.sendRedirect(request.getContextPath() + "/HomeServlet");

			} else {
				// Auth ko,on affiche de nouveau le form d'authentification
				// annulation de l'authentification
				response.getWriter().println("ko");
			}
		} catch (ClassNotFoundException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
