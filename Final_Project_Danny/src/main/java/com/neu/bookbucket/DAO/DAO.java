package com.neu.bookbucket.DAO;

import org.hibernate.HibernateException;
import org.hibernate.Session;


public class DAO {

	//creates a session
	public Session getSession(){
		   return HibernateUtil.getSessionFactory().openSession();
	   }
		 
	   protected DAO() {
	   }

	   //for beginning a transaction
	   protected void begin() {
	       getSession().beginTransaction();
	   }

	   //for committing a transaction
	   protected void commit() {
	       getSession().getTransaction().commit();
	   }

	   //for performing rollback on a transaction
	   protected void rollback() {
	       try {
	           getSession().getTransaction().rollback();
	       } catch (HibernateException e) {
	          
	       }
	       try {
	           getSession().close();
	       } catch (HibernateException e) {
	          
	       }
	      
	   }

	   ///closing a session
	   public  void close() {
	       getSession().close();
	   }
		
}
