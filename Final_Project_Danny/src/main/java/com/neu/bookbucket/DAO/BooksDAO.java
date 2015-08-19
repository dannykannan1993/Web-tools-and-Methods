package com.neu.bookbucket.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.bookbucket.POJO.Book;
import com.neu.bookbucket.POJO.InventoryItem;
import com.neu.bookbucket.POJO.Person;
import com.neu.bookbucket.POJO.Sales;

public class BooksDAO extends DAO{

	//search books by a string name
	public List<Book> searchBooks(String name){
		List<Book> bookList= new ArrayList<Book>();
		try{
			Query q1= getSession().createQuery("from Book where (productName like '%"+name+"%' or author like '%"+name+"%') and active =1");
			//q1.setString("active", "1");
			bookList= q1.list();
			return bookList;
		}catch(Exception e){
			System.out.println(e);
		}
		
		return bookList;
	}
	
	//add new books to the books database
	public int addNewBook(Book book){
		int id=0;
		String name= book.getProductName();
		String author= book.getAuthor();
		String edition = book.getEdition();
		
		try{
			
			InventoryItem in= new InventoryItem();
			in.setBook(book);
			Session session= HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(book);
			session.save(in);
			tx.commit();
			session.close();
			Query q1 = getSession().createQuery(
					"from Book where productName =:name and edition =:edition and author =:author and productType =:type");
			q1.setString("name", book.getProductName());
			q1.setString("edition",book.getEdition());
			q1.setString("author", book.getAuthor());
			q1.setString("type", book.getProductType());
			Book book1= (Book)q1.uniqueResult();
			if(book1!=null){
				id=book1.getProductId();
			}
			close();
			
		}catch(Exception e){
			rollback();
			System.out.print(e);
			e.printStackTrace();
		}
		return id;
		}
	
	public int addNewBookActive(Book book){
		int id=0;
		String name= book.getProductName();
		String author= book.getAuthor();
		String edition = book.getEdition();
		
		try{
			Query q = getSession().createQuery(
					"from Book where (productName =:name and edition =:edition and author =:author and productType =:type)");
			q.setString("name", name);
			q.setString("edition", edition);
			q.setString("author", author);
			q.setString("type", "New");
			Book book1= (Book)q.uniqueResult();
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			Book book2 = (Book) session.get(
					Book.class, book1.getProductId());
			book2.setActive(1);
			session.update(book2);
			tx.commit();
			session.close();
			id=book1.getProductId();
		}catch(Exception e){
			rollback();
			System.out.print(e);
			e.printStackTrace();
		}
		return id;
		}
	
	//add books being soldby customer to the book inventory
	public int addNewSellBook(Book book){
		int id=0;
		String name= book.getProductName();
		String author= book.getAuthor();
		String edition = book.getEdition();
		
		try{
			Query q = getSession().createQuery(
					"from Book where (productName =:name and edition =:edition and author =:author and productType =:type) and active =1");
			q.setString("name", name);
			q.setString("edition", edition);
			q.setString("author", author);
			q.setString("type", "New");
			List<Book> list= q.list();
			close();
			if(list.size()==0){
			InventoryItem in= new InventoryItem();
			in.setBook(book);
			Session session= HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(book);
			session.save(in);
			tx.commit();
			session.close();
			}
		}catch(Exception e){
			rollback();
			System.out.print(e);
			e.printStackTrace();
		}
		return id;
		}
	
	//check if a book is already existing in the book inventory
	public int checkExistingBook(Book book){
		int id=0;
		try {
			// begin();
			String productName= book.getProductName();
			String author= book.getAuthor();
			String edition= book.getEdition();
			Query q = getSession().createQuery("from Book as b where productName = :productName and author = :author and edition =:edition and active =:active");
			q.setString("productName", productName);
			q.setString("author", author);
			q.setString("edition", edition);
			q.setString("active", "1");
			if(q.list().size()==1){
			Book book1 = (Book) q.uniqueResult();
			if(book1!=null){
				id= book1.getProductId();
			}
			}
			// commit();
		} catch (HibernateException e) {
			// rollback();
			e.printStackTrace();
		}
		return id;
	}
	
	//check if the new book to be delivered is already avaialable in the book inventory
	public int checkNewExistingBook(Book book){
		int id=0;
		try {
			// begin();
			String productName= book.getProductName();
			String author= book.getAuthor();
			String edition= book.getEdition();
			Query q = getSession().createQuery("from Book as b where productName = :productName and author = :author and edition =:edition");
			q.setString("productName", productName);
			q.setString("author", author);
			q.setString("edition", edition);
			if(q.list().size()==1){
			Book book1 = (Book) q.uniqueResult();
			if(book1!=null){
				id= book1.getProductId();
			}
			
			}
			// commit();
		} catch (HibernateException e) {
			// rollback();
			e.printStackTrace();
		}
		return id;
	}
	
	//returns the sale of books each year
	public List<Sales> getListOfSales(int bookId, int year){
		List<Sales> salesList= new ArrayList<Sales>();
		try{
		Query q = getSession().createQuery("from Sales where bookId = :bookId and year =:year");
		q.setParameter("bookId", bookId);
		q.setParameter("year", year);
		salesList= q.list();
		close();}catch(Exception e){
			e.printStackTrace();
		}
		return salesList;
		
	}
}
