package com.neu.bookbucket.DAO;

import javax.swing.JOptionPane;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.neu.bookbucket.POJO.Book;
import com.neu.bookbucket.POJO.DifferentOrder;
import com.neu.bookbucket.POJO.InventoryItem;
import com.neu.bookbucket.POJO.OrderItem;

public class InventoryDAO extends DAO {

	//check the inventory for particular item
	public InventoryItem checkInventoryItem(int productId) {

		InventoryItem in = new InventoryItem();
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			Criteria cr1 = session.createCriteria(Book.class);
			cr1.add(Restrictions.eq("productId", productId));
			Object result1 = cr1.uniqueResult();
			if (result1 != null) {
				Book book = (Book) result1;
				int id = book.getProductId();
				Query q = getSession().createQuery(
						"from InventoryItem where productinventoryId =:id");
				q.setParameter("id", id);
				in = (InventoryItem) q.uniqueResult();
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return in;
	}

	//check the inventory for a particular order item
	public String checkInventory(OrderItem oi, InventoryItem in) {
		String message = "";

		if (oi.getQuantity() <= in.getQuantity()) {
			message = "All items delivered";
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			InventoryItem in1 = (InventoryItem) session.get(
					InventoryItem.class, in.getProductId());
			if (in1 != null) {
				in1.setQuantity(in.getQuantity() - oi.getQuantity());
				session.update(in1);
			}
			tx.commit();
			close();
		}
		Session session1 = HibernateUtil.getSessionFactory().openSession();
		Transaction tx1 = session1.beginTransaction();
		OrderItem oi1 = (OrderItem) session1.get(OrderItem.class,
				oi.getProductId());
		oi1.setItemStatus("All items delivered");
		session1.update(oi1);
		tx1.commit();
		close();

		if (oi.getQuantity() > in.getQuantity()) {
			message = "Not in stock";
		}

		return message;
	}

	//add items to the inventory
	public Boolean addToInventory(int productId, int quantity) {
		Boolean flag = false;

		InventoryItem in = new InventoryItem();

		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria cr1 = session.createCriteria(Book.class);
		cr1.add(Restrictions.eq("productId", productId));
		Object result1 = cr1.uniqueResult();
		if (result1 != null) {
			Book book = (Book) result1;
			in.setBook(book);
			in.setQuantity(quantity);
			Query q = getSession().createQuery(
						"from InventoryItem where productinventoryId =:id");		
			q.setParameter("id", book.getProductId());
			InventoryItem inv= (InventoryItem)q.uniqueResult();
			
			if(inv!=null){
				inv.setQuantity(inv.getQuantity()+quantity);
				Session session1 = HibernateUtil.getSessionFactory().openSession();
				Transaction tx = session1.beginTransaction();
				InventoryItem inv2 = (InventoryItem) session1.get(InventoryItem.class,
						inv.getProductId());
				inv2.setQuantity(inv.getQuantity());
				session1.update(inv2);
				tx.commit();
				session1.close();
			}
			else{
				Session session2 = HibernateUtil.getSessionFactory().openSession();
				Transaction tx = session2.beginTransaction();
				session2.save(in);
				tx.commit();
				session2.close();
			}
			
			close();
			flag = true;
		}

		return flag;
	}

	// add old items to the inventory by checking if they already exists or not
	public Boolean oldAdditionInventory(int orderId, int id) {
		Boolean flag = false;
		try {
			System.out.print(id);
			Query q = getSession().createQuery(
					"from InventoryItem where productinventoryId =:id");
			q.setParameter("id", id);
			InventoryItem in = (InventoryItem) q.uniqueResult();
			System.out.print(in);
			if(in!=null){
			Session session1 = HibernateUtil.getSessionFactory().openSession();
			Transaction tx1 = session1.beginTransaction();
			OrderItem oi1 = (OrderItem) session1.get(OrderItem.class, orderId);
			int quantity = oi1.getQuantity();
			InventoryItem in1 = (InventoryItem) session1.get(
					InventoryItem.class, in.getProductId());
			in1.setQuantity(in.getQuantity() + quantity);
			session1.update(in1);
			tx1.commit();
			close();
			}else{
				InventoryItem in1= new InventoryItem();
				Session session2 = HibernateUtil.getSessionFactory().openSession();
				Transaction tx1 = session2.beginTransaction();
				Book book1 = (Book) session2.get(Book.class, id);
				in1.setBook(book1);
				in1.setQuantity(0);
				session2.save(in1);
				tx1.commit();
				close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
