package com.neu.bookbucket.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.neu.bookbucket.POJO.Address;
import com.neu.bookbucket.POJO.Book;
import com.neu.bookbucket.POJO.Card;
import com.neu.bookbucket.POJO.DifferentOrder;
import com.neu.bookbucket.POJO.InventoryItem;
import com.neu.bookbucket.POJO.OrderItem;
import com.neu.bookbucket.POJO.Person;

public class OrderDAO extends DAO {

	//add new order item
	public List<OrderItem> addOrderItem(int bookId, int quantity,
			List<OrderItem> list) {
		try {
			begin();
			boolean flag = false;
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			Book book = (Book) session.get(Book.class, bookId);
			for (int i = list.size() - 1; i >= 0; i--) {
				OrderItem oi = list.get(i);
				if (oi.getBook().getProductId() == bookId) {
					flag = true;
					list.remove(i);
					OrderItem item = new OrderItem();
					item.setQuantity(oi.getQuantity() + quantity);
					item.setBook(book);
					list.add(item);
				}
			}
			if (!flag) {
				OrderItem item = new OrderItem();
				item.setQuantity(quantity);
				item.setBook(book);
				list.add(item);
			}
			commit();
		} catch (Exception e) {
			rollback();
		}

		return list;
	}

	//confirm and place the order in the database
	public Boolean confirmOrder(List<OrderItem> list, List<OrderItem> newlist,
			Address address, Card card, Person person) {

		Boolean flag = false;
		float total = 0;
		try {

			if (list.size() > 0) {
				DifferentOrder order1 = new DifferentOrder();
				order1.setOrderDate(new Date());
				order1.setOrderStatus("Order to be reviewed");
				order1.setOrderType("Buyer Old");
				order1.setPerson(person);

				for (int i = 0; i < list.size(); i++) {
					OrderItem oi = new OrderItem();
					oi = list.get(i);
					// oi.setOrder(order);
					total = oi.getQuantity() * oi.getBook().getProductCost();
				}

				order1.setOrderAmount(total);
				Session session = HibernateUtil.getSessionFactory()
						.openSession();
				Transaction tx = session.beginTransaction();
				session.save(order1);
				tx.commit();
				session.close();

				for (int i = 0; i < list.size(); i++) {
					OrderItem oi = new OrderItem();
					oi = list.get(i);
					oi.setOrderNo(order1);
					Session session1 = HibernateUtil.getSessionFactory()
							.openSession();
					Transaction tx1 = session1.beginTransaction();
					session1.save(oi);
					tx1.commit();
					session1.close();
				}
				flag = true;
			}

			if (newlist.size() > 0) {
				DifferentOrder order1 = new DifferentOrder();
				order1.setOrderDate(new Date());
				order1.setOrderStatus("Order to be reviewed");
				order1.setOrderType("Buyer New");
				order1.setPerson(person);

				for (int i = 0; i < newlist.size(); i++) {
					OrderItem oi = new OrderItem();
					oi = newlist.get(i);
					// total= oi.getQuantity() * oi.getBook().getProductCost();
				}

				// order.setOrderAmount(total);
				Session session = HibernateUtil.getSessionFactory()
						.openSession();
				Transaction tx = session.beginTransaction();
				session.save(order1);
				tx.commit();
				session.close();

				for (int i = 0; i < newlist.size(); i++) {
					OrderItem oi = new OrderItem();
					oi = newlist.get(i);
					oi.setOrderNo(order1);
					Session session1 = HibernateUtil.getSessionFactory()
							.openSession();
					Transaction tx1 = session1.beginTransaction();
					session1.save(oi);
					tx1.commit();
					session1.close();
				}
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	//delete a particular sell order item placed by the customer
	public List<OrderItem> deleteSellOrderitem(Book book, List<OrderItem> selllist) {
		boolean flag = false;
		for (int i = selllist.size()-1; i >= 0; i--) {
			OrderItem oi = selllist.get(i);
			Book book1 = oi.getBook();
			if (book == book1) {
				selllist.remove(i);
				flag = true;
				break;
			}

		}

		return selllist;
	}

	//confirm a selling order by the customer
	public boolean confirmSellingOrder(List<OrderItem> list, Person person) {
		boolean flag = false;

		try {

			if (list.size() > 0) {
				DifferentOrder order1 = new DifferentOrder();
				order1.setOrderDate(new Date());
				order1.setOrderStatus("Order to be reviewed");
				order1.setOrderType("Seller Old");
				order1.setPerson(person);

				for (int i = 0; i < list.size(); i++) {
					OrderItem oi = new OrderItem();
					oi = list.get(i);
					// oi.setOrder(order);
				}

				Session session = HibernateUtil.getSessionFactory()
						.openSession();
				Transaction tx = session.beginTransaction();
				session.save(order1);
				tx.commit();
				session.close();

				for (int i = 0; i < list.size(); i++) {
					OrderItem oi = new OrderItem();
					oi = list.get(i);
					oi.setOrderNo(order1);
					Session session1 = HibernateUtil.getSessionFactory()
							.openSession();
					Transaction tx1 = session1.beginTransaction();
					session1.save(oi);
					tx1.commit();
					session1.close();
				}
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	//gets a list or order items for old books available in the inventory
	public List<DifferentOrder> buyerOldOrders() {
		List<DifferentOrder> list = new ArrayList<DifferentOrder>();

		try {
			Criteria cr = getSession().createCriteria(DifferentOrder.class);
			cr.add(Restrictions.eq("orderType", "Buyer Old"));
			list = cr.list();
			close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//gets a list of new book orders placed by the customer
	public List<DifferentOrder> buyerNewOrders() {
		List<DifferentOrder> list = new ArrayList<DifferentOrder>();

		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			Criteria cr = session.createCriteria(DifferentOrder.class);
			cr.add(Restrictions.eq("orderType", "Buyer New"));
			list = cr.list();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//gets a list of orders for books to be sold by the customer
	public List<DifferentOrder> sellerOldOrders() {
		List<DifferentOrder> list = new ArrayList<DifferentOrder>();

		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			Criteria cr = session.createCriteria(DifferentOrder.class);
			cr.add(Restrictions.eq("orderType", "Seller Old"));
			list = cr.list();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//get the list of order items by a particular order id
	public Set<OrderItem> getOrderitemList(int orderId) {
		Set<OrderItem> orderitemList = new HashSet<OrderItem>();
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			Criteria cr = session.createCriteria(DifferentOrder.class);
			cr.add(Restrictions.eq("orderId", orderId));
			Object result = cr.uniqueResult();
			if (result != null) {
				DifferentOrder order = (DifferentOrder) result;
				orderitemList = (Set<OrderItem>) order.getOrderitemList();
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderitemList;
	}

	//get a particular order item details on an order item id
	public OrderItem getBook(int orderitemId) {
		OrderItem oi = new OrderItem();
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			Criteria cr = session.createCriteria(OrderItem.class);
			cr.add(Restrictions.eq("productId", orderitemId));
			Object result = cr.uniqueResult();
			if (result != null) {
				oi = (OrderItem) result;

			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return oi;
	}

	//removes the new books order item request placed by the customer on delivering it
	public List<OrderItem> removeNewBookOrderItem(Book book,
			List<OrderItem> list) {
		try{
		Book book1= new Book();
		for (int i = list.size()-1; i >= 0; i--) {
			OrderItem oi = list.get(i);
			
			if (oi.getBook().getProductName().trim().equals(book.getProductName()) && oi.getBook().getAuthor().trim().equals(book.getAuthor())
					&&oi.getBook().getEdition().trim().equals(book.getEdition())&& oi.getBook().getActive()==book.getActive()) {
				list.remove(i);
				book1 = oi.getBook();
				if (book1.getActive()==0) {
					Session session1 = HibernateUtil.getSessionFactory().openSession();
					Transaction tx1 = session1.beginTransaction();
					Book book2 = (Book) session1.get(Book.class, book1.getProductId());
					if(book.getOrderitemList()!=null){
					session1.delete(book2.getInventoryItem());
					}
					session1.delete(book2);
					tx1.commit();
					close();
				}
				break;
			}
		}}catch(Exception e){
			System.out.print("Can not delete");
		}
		
		return list;
	}

	//sets the order item to a particular book present in the book database
	public boolean setOrderItem(int id, int productId) {
		Boolean flag = false;
		try {

			Session session = HibernateUtil.getSessionFactory().openSession();
			Criteria cr1 = session.createCriteria(Book.class);
			cr1.add(Restrictions.eq("productId", id));
			Object result1 = cr1.uniqueResult();
			if (result1 != null) {
				Book book = (Book) result1;
				Session session1 = HibernateUtil.getSessionFactory()
						.openSession();
				Transaction tx1 = session1.beginTransaction();
				OrderItem oi1 = (OrderItem) session1.get(OrderItem.class,
						productId);
				oi1.setBook(book);
				session1.update(oi1);
				tx1.commit();
				close();
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	//updates the details of an order item
	public void updateItem(String status, Float cost, int oid) {
		try {
			Session session1 = HibernateUtil.getSessionFactory().openSession();
			Transaction tx1 = session1.beginTransaction();
			OrderItem oi1 = (OrderItem) session1.get(OrderItem.class, oid);
			oi1.setItemStatus(status);
			Book book = oi1.getBook();
			int bookId = book.getProductId();
			Book book1 = (Book) session1.get(Book.class, bookId);
			session1.update(oi1);
			session1.update(book1);
			tx1.commit();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//gets a list of existing orders
	public List<DifferentOrder> getExistingOrder(Person user)
	{
		List<DifferentOrder> existingOrders= new ArrayList<DifferentOrder>();
		List<DifferentOrder> orderList= new ArrayList<DifferentOrder>();
		
		Query q=getSession().createQuery("from DifferentOrder where orderPersonId =:userID");
		q.setParameter("userID", user.getPersonId());
		orderList= q.list();
		for(int i=0; i<orderList.size();i++){
			DifferentOrder ord= orderList.get(i);
			if(ord.getOrderType().equalsIgnoreCase("Buyer Old")){
				existingOrders.add(ord);
			}
		}
		
		return existingOrders;
	}
	
	//updates the order status
	public Boolean updateOrderStatus(int orderId, String status){
		Boolean flag= false;
		try{
		Session session1 = HibernateUtil.getSessionFactory().openSession();
		Transaction tx1 = session1.beginTransaction();
		DifferentOrder order = (DifferentOrder) session1.get(DifferentOrder.class, orderId);
		order.setOrderStatus(status);
		session1.update(order);
		flag=true;
		tx1.commit();
		session1.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	
	//updates the order item cost for the books to be sold by the customer
	public Boolean updateOrderitemCost(int orderitemId, Float cost){
		Boolean flag= false;
		try{
		Session session1 = HibernateUtil.getSessionFactory().openSession();
		Transaction tx1 = session1.beginTransaction();
		OrderItem orderitem = (OrderItem) session1.get(OrderItem.class, orderitemId);
		Book book= orderitem.getBook();
		book.setProductCost(cost);
		orderitem.setBook(book);
		DifferentOrder order=orderitem.getOrderNo();
		order.setOrderAmount(orderitem.getQuantity()*orderitem.getBook().getProductCost());
		orderitem.setOrderNo(order);
		session1.update(order);
		session1.update(orderitem);
		flag=true;
		tx1.commit();
		session1.close();
		
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	
	//updates the order item status on how many delivered or not
	public Boolean updateOrderItemStatus(int orderitemId, String status){
		Boolean flag= false;
		try{
		Session session1 = HibernateUtil.getSessionFactory().openSession();
		Transaction tx1 = session1.beginTransaction();
		OrderItem orderitem = (OrderItem) session1.get(OrderItem.class, orderitemId);
		orderitem.setItemStatus(status);
		session1.update(orderitem);
		flag=true;
		tx1.commit();
		session1.close();
		
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	
	//creates a new order and as well as a list for the order items for that order
	public List<DifferentOrder> getNewOrder(Person user)
	{
		List<DifferentOrder> newOrders= new ArrayList<DifferentOrder>();
		List<DifferentOrder> orderList= new ArrayList<DifferentOrder>();
		
		Query q=getSession().createQuery("from DifferentOrder where orderPersonId =:userID");
		q.setParameter("userID", user.getPersonId());
		orderList= q.list();
		for(int i=0; i<orderList.size();i++){
			DifferentOrder ord= orderList.get(i);
			if(ord.getOrderType().equalsIgnoreCase("Buyer New")){
				newOrders.add(ord);
			}
		}
		
		return newOrders;
	}
	
	public List<DifferentOrder> getSellingOrder(Person user)
	{
		List<DifferentOrder> sellingOrders= new ArrayList<DifferentOrder>();
		List<DifferentOrder> orderList= new ArrayList<DifferentOrder>();
		
		Query q=getSession().createQuery("from DifferentOrder where orderPersonId =:userID");
		q.setParameter("userID", user.getPersonId());
		orderList= q.list();
		for(int i=0; i<orderList.size();i++){
			DifferentOrder ord= orderList.get(i);
			if(ord.getOrderType().equalsIgnoreCase("Seller Old")){
				sellingOrders.add(ord);
			}
		}
		
		return sellingOrders;
	}
	
	
	
}
