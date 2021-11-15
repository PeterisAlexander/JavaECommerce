package ecommerce.m2i.controller.home;

import java.io.IOException;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	private ProductDao productDao;

	public void init() {
		productDao = new ProductDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		ProductDao productDao = new ProductDao();
		System.out.println("ok dans doGet Product");
		try {
			List<Product> productList = productDao.getProducts();
			System.out.println("product size : " + productList.size());
			request.setAttribute("productl", productList);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/home/home.jsp");
		dispatcher.forward(request, response);
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
		product.setSize("S");
		product.setDescription(
				"Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus, totam magnam officiis, accusamus quae impedit dicta quam inventore, repudiandae perspiciatis autem minima possimus. Omnis Ullam ea maxime aliquid vero nam. Quasi voluptates nobis, fuga blanditiis rerum animi ea commodi nulla velit aperiam totam porro quas vel, soluta quos dignissimos dicta, illum rem. In, qui! Aspernatur non sit unde reprehenderit voluptas assumenda quasi temporibus asperiores, quae alias modi quo itaque suscipit. Nam debitis quo possimus in alias beatae placeat cum, explicabo vitae non accusamus est!");
		product.setImage(image);
		product.setQuantity(12);
		product.setStock(46);
		product.setDate_creation(LocalDate.now());

		try {
			productDao.addProduct(product);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/HomeServlet");
	}

}
