package ecommerce.m2i.controller.home;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.m2i.dao.ProductDao;
import ecommerce.m2i.model.Product;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	private ProductDao productDao;

	public void init() {
		productDao = new ProductDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Je suis bien dans la méthode post");
		String title = request.getParameter("title");
		Integer price = request.getParameter("price").hashCode();
		String image = request.getParameter("image");

		Product product = new Product();
		product.setTitle(title);
		product.setPrice(price);
		product.setImage(image);

		System.out.println(product.toString());

		try {
			productDao.addProduct(product);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/HomeServlet");
	}

}
