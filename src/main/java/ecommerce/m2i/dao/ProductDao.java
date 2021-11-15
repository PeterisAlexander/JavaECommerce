package ecommerce.m2i.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import ecommerce.m2i.model.Product;

public class ProductDao {

	EntityManager em;

	public ProductDao() {
		super();
		em = DbConnection.getInstance();
	}

	public List<Product> getProducts() throws ClassNotFoundException {
		return em.createQuery("from Product").getResultList();
	}

	public Product getProduct(int id) {
		return em.find(Product.class, id);
	}

	public int addProduct(Product product) throws ClassNotFoundException {
		int id = 0;

		// Récupération d’une transaction
		EntityTransaction tx = em.getTransaction();
		// Début des modifications
		try {
			tx.begin();
			em.persist(product);
			tx.commit();
		} catch (Exception e) {

			tx.rollback();
		} finally {
			// em.close();
			// emf.close();
		}
		return id;
	}

	public void deleteProduct(int id) {
		// TODO Auto-generated method stub
		Product p = em.find(Product.class, id);
		// Récupération d’une transaction
		EntityTransaction tx = em.getTransaction();
		// Début des modifications
		try {
			tx.begin();
			em.remove(p);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			// em.close();
			// emf.close();
		}
	}

}
