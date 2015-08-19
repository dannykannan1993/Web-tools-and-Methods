package com.neu.bookbucket.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.bookbucket.Interceptors.Interceptor;
import com.neu.bookbucket.POJO.OrderItem;
import com.neu.bookbucket.POJO.Person;
import com.neu.bookbucket.POJO.StoreList;


public class UseraccountDAO extends DAO{

	//check the user exists in the database with username and password
	public Person queryUserByNameAndPassword(String name, String password)
			throws Exception {
		try {
			// begin();
			Query q = getSession().createQuery("from Person where userName = :username and userPassword = :password");
			q.setString("username", name);
			q.setString("password", password);
			Person user = (Person) q.uniqueResult();
			// commit();
			return user;
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Could not get user " + name, e);
		}
	}
	
	//check if the particular username already exists or not
	public Boolean queryUserName(String name){
		Boolean flag= false;
		try {
			// begin();
			Query q = getSession().createQuery("from Person where userName = :username");
			q.setString("username", name);
			List<Person> list= q.list();
			// commit();
			if(list.size()==0){
				flag=true;
			}
			
		} catch (HibernateException e) {
			// rollback();
			e.printStackTrace();
		}
		return flag;
	}
	
	//get the user details for forgot password request
	public String queryForgotPassword(String name, String email){
		String password="";
		try{
			Query q = getSession().createQuery("from Person where userName = :name and emailId = :email");
			q.setString("name", name);
			q.setString("email", email);
			Person user= (Person)q.uniqueResult();
			if(user!=null){
			password= user.getPassword();}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return password;
	}
	
	//add new user to the user database
	public Boolean addUser(Person person){
		Boolean flag= false;
		try{
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			person.setDepartment("customer");
			person.setPersonType("customer");
			session.save(person);
			tx.commit();
			close();
			flag=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	
	//add a new employee to the database
	public Boolean addEmployee(Person person){
		Boolean flag= false;
		try{
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(person);
			tx.commit();
			close();
			flag=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	
	//get the list of book stores available in the US
	public ArrayList<StoreList> getStores(){
		ArrayList<StoreList> list= new ArrayList<StoreList>();
		try{
		Query q= getSession().createQuery("from StoreList");
		list= (ArrayList<StoreList>) q.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//update password of the user on change password request
	public Boolean updatePassword(String pass, Person person){
		Boolean flag=false;
		try{
			
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			Person user = (Person) session.get(Person.class,
					person.getPersonId());
			user.setPassword(pass);
			session.update(user);
			tx.commit();
			close();
			flag=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
}
