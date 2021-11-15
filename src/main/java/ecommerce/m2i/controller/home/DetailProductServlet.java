package ecommerce.m2i.controller.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.m2i.dao.ProductDao;
import ecommerce.m2i.model.Product;

/**
 * Servlet implementation class EditVilleServlet
 */
@WebServlet("/detailProduct")
public class DetailProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailProductServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));

		ProductDao productDao = new ProductDao();
		System.out.println("ok dans detail product");
		Product p = productDao.getProduct(id);

		request.setAttribute("productparam", p);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/home/detailProduct.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("Je suis bien dans la méthode post");
//		String pays = request.getParameter("pays");
//		String nom = request.getParameter("nom");
//		String code_postal = request.getParameter("code_postal");
//
//		int id = Integer.parseInt(request.getParameter("id"));
//
//		// Mettre à jour le Ville en question
//		ProductDao productDao = new ProductDao();
//		System.out.println("ok dans edit ville : " + id);
//		productDao.editVille(id, pays, nom, code_postal);
//
//		response.sendRedirect(request.getContextPath() + "/ListVilleServlet");

	}

}
