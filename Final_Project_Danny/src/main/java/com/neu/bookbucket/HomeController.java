package com.neu.bookbucket;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.Set;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.hibernate.engine.transaction.jta.platform.internal.JOTMJtaPlatform;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;
import com.neu.bookbucket.DAO.BooksDAO;
import com.neu.bookbucket.DAO.InventoryDAO;
import com.neu.bookbucket.DAO.OrderDAO;
import com.neu.bookbucket.DAO.UseraccountDAO;
import com.neu.bookbucket.POJO.Address;
import com.neu.bookbucket.POJO.Book;
import com.neu.bookbucket.POJO.Card;
import com.neu.bookbucket.POJO.DifferentOrder;
import com.neu.bookbucket.POJO.InventoryItem;
import com.neu.bookbucket.POJO.OrderItem;
import com.neu.bookbucket.POJO.Person;
import com.neu.bookbucket.POJO.Sales;
import com.neu.bookbucket.POJO.StoreList;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	//autowiring the dao objects to use it in the controller
	@Autowired
	private UseraccountDAO userDAO;

	@Autowired
	private BooksDAO bookDAO;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private InventoryDAO inventoryDAO;

	// Creates logs
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	//request mapping for get request, checks existing cookies and creates new ones if no cookies exists
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String initUserLoginForm(HttpServletRequest request, Model model) {
		Person user = new Person();
		Cookie[] cookies = request.getCookies();
		String username = null, password = null;
		
		//if no cookies available, create cookie storing username and password info
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("username")) {
					username = cookies[i].getValue();
				} else if (cookies[i].getName().equals("password")) {
					password = cookies[i].getValue();
				}
			}

			try {
				Person u = userDAO.queryUserByNameAndPassword(username,
						password);
				user=u;
				if (u != null) {
					model.addAttribute("user", u);
					HttpSession session = request.getSession();
					session.setAttribute("user", u);
					
					//check user type and create data structures for them respectively
					if (user.getPersonType().equalsIgnoreCase("customer")) {
						List<OrderItem> orderitemList = new ArrayList<OrderItem>();
						List<OrderItem> newOrderItemList = new ArrayList<OrderItem>();
						List<OrderItem> sellOrderList = new ArrayList<OrderItem>();

						session.setAttribute("orderitemList", orderitemList);
						session.setAttribute("newOrderItemList", newOrderItemList);
						session.setAttribute("sellOrderItemList", sellOrderList);

						return "CustomerHomepage";
					} else if (user.getPersonType().equalsIgnoreCase("admin")) {
						return "AdminHomepage";
					} else if (user.getPersonType().equalsIgnoreCase("operator")) {
						List<DifferentOrder> buyerOldOrderList = new ArrayList<DifferentOrder>();
						List<DifferentOrder> buyerNewOrderList = new ArrayList<DifferentOrder>();
						List<DifferentOrder> sellerOrderList = new ArrayList<DifferentOrder>();
						List<DifferentOrder> distributorOrderList = new ArrayList<DifferentOrder>();
						buyerNewOrderList = orderDAO.buyerNewOrders();
						buyerOldOrderList = orderDAO.buyerOldOrders();
						session.setAttribute("buyerOldOrderList", buyerOldOrderList);
						session.setAttribute("buyerNewOrderList", buyerNewOrderList);
						int newsize = buyerNewOrderList.size();
						int oldsize = buyerOldOrderList.size();

						model.addAttribute("buyerNewOrderList", buyerNewOrderList);
						model.addAttribute("buyerOldOrderList", buyerOldOrderList);
						model.addAttribute("newsize", newsize);
						model.addAttribute("oldsize", oldsize);

						session.setAttribute("sellerOrderList", sellerOrderList);

						return "OperatorHomepage";
					}
				} else {
					model.addAttribute("user", user);
					return "home";
				}
			} catch (Exception e) {
				System.out.print(e);
				return "home";
			}
		}
		model.addAttribute("user", user);
		return "home";
	}
	
	//request mapping for login page
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) {

		String returnType;
		try {
			Person user = new Person();
			String remember = request.getParameter("remember");
			String name = request.getParameter("userName");
			String password = request.getParameter("password");
			user = userDAO.queryUserByNameAndPassword(name, password);

			
			HttpSession session = request.getSession();
			if (user != null) {
				session.setAttribute("user", user);
					model.addAttribute("user", user);
					//check if remember me option is checked
					if (remember != null
							&& remember.equalsIgnoreCase("remember")) {
						Cookie userName = new Cookie("username",
								user.getUserName());
						userName.setMaxAge(604800);
						response.addCookie(userName);
						Cookie userPassword = new Cookie("password",
								user.getPassword());
						userPassword.setMaxAge(604800);
						response.addCookie(userPassword);
					}
				if (user.getPersonType().equalsIgnoreCase("customer")) {
					List<OrderItem> orderitemList = new ArrayList<OrderItem>();
					List<OrderItem> newOrderItemList = new ArrayList<OrderItem>();
					List<OrderItem> sellOrderList = new ArrayList<OrderItem>();

					session.setAttribute("orderitemList", orderitemList);
					session.setAttribute("newOrderItemList", newOrderItemList);
					session.setAttribute("sellOrderItemList", sellOrderList);

					return "CustomerHomepage";
				} else if (user.getPersonType().equalsIgnoreCase("admin")) {
					return "AdminHomepage";
				} else if (user.getPersonType().equalsIgnoreCase("operator")) {
					List<DifferentOrder> buyerOldOrderList = new ArrayList<DifferentOrder>();
					List<DifferentOrder> buyerNewOrderList = new ArrayList<DifferentOrder>();
					List<DifferentOrder> sellerOrderList = new ArrayList<DifferentOrder>();
					List<DifferentOrder> distributorOrderList = new ArrayList<DifferentOrder>();
					buyerNewOrderList = orderDAO.buyerNewOrders();
					buyerOldOrderList = orderDAO.buyerOldOrders();
					session.setAttribute("buyerOldOrderList", buyerOldOrderList);
					session.setAttribute("buyerNewOrderList", buyerNewOrderList);
					int newsize = buyerNewOrderList.size();
					int oldsize = buyerOldOrderList.size();

					model.addAttribute("buyerNewOrderList", buyerNewOrderList);
					model.addAttribute("buyerOldOrderList", buyerOldOrderList);
					model.addAttribute("newsize", newsize);
					model.addAttribute("oldsize", oldsize);

					session.setAttribute("sellerOrderList", sellerOrderList);

					return "OperatorHomepage";
				}

			} else {

				String error = "User not found";
				JOptionPane.showMessageDialog(null, "User not found");
				model.addAttribute("error", error);
				return "home";
			}

		} catch (Exception e) {
			System.out.print(e);
			return "home";
		}
		return "home";
	}
	
	//forwarding to forgot password page
	@RequestMapping(value = "ForgotPassword")
	public String hrefForgotPassword() {

		return "ForgotPassword";
	}
	//on logout clearing the cookies and redirecting to home page
	@RequestMapping(value = "Logout")
	public String hrefTagLogout(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			Person user = new Person();
			model.addAttribute("user", user);
			request.getSession().invalidate();
			Cookie[] cookies = request.getCookies();
			String username = null, password = null;
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("username")) {
						username = cookies[i].getValue();
						cookies[i].setMaxAge(0);
			            response.addCookie(cookies[i]);
					} else if (cookies[i].getName().equals("password")) {
						password = cookies[i].getValue();
						cookies[i].setMaxAge(0);
			            response.addCookie(cookies[i]);
					}
				}
			}
			 response.sendRedirect(request.getContextPath() + "/");
			return "home";

		} catch (Exception e) {
			System.out.print(e);
			return "home";
		}
		//return "home";
	}

	//redirecting to details page along with location coordinates of the book stores
	@RequestMapping(value = "Details")
	public String hrefDetails(Model model) {
		ArrayList<StoreList> list = new ArrayList<StoreList>();
		try {
			list = userDAO.getStores();
			model.addAttribute("addresslist", list);
			Double lat[] = new Double[list.size()];
			Double lon[] = new Double[list.size()];
			String name[] = new String[list.size()];
			for (int i = 0; i < list.size(); i++) {
				StoreList st = list.get(i);
				lat[i] = st.getLatitude();
				lon[i] = st.getLongitude();
				name[i] = st.getStoreName();
			}

			model.addAttribute("lat", lat);
			model.addAttribute("lon", lon);
			model.addAttribute("name", name);
		} catch (Exception e) {
			System.out.print(e);
			return "home";
		}
		return "Details";

	}

	//directing to the about us page
	@RequestMapping(value = "AboutUs")
	public String hrefAboutUs() {
		return "AboutUs";
	}

	//sending mail for forgot password option with the account details 
	@RequestMapping(value = "ForgotPasswordMail")
	public String forgotPasswordMail(HttpServletRequest request) {
		String returnPage="";
		String email = request.getParameter("emailID");
		String username = request.getParameter("name");
		String pass= userDAO.queryForgotPassword(username, email);
		if(pass.equals("")){
			JOptionPane.showMessageDialog(null, "Enter Correct credentials");
			returnPage="ForgotPassword";
		}
		else{
			final String gmailu = "dannykannan1993@gmail.com";
			final String gmailp = "lordvoldemort";

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			javax.mail.Session session = javax.mail.Session.getDefaultInstance(
					props, new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(gmailu, gmailp);
						}
					});

			try {
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(email));
				message.setSubject("Forgot Password- BookBucket");
				message.setText("Hi, Your password is: " +pass);

				Transport.send(message);
				returnPage="home";
				JOptionPane.showMessageDialog(null, "Mail sent to you");
				} catch (MessagingException e) {
				// throw new RuntimeException(e);
					System.out.print(e);
					return "home";
			}
		}
		return returnPage;
	}
	
	// directing to change password page along with the user info
	@RequestMapping(value="ChangePassword")
	public String updateProfile(HttpServletRequest request, Model model){
		try{
			HttpSession session= request.getSession();
			Person user= (Person)session.getAttribute("user");
			model.addAttribute("user", user);
		}catch(Exception e){
			System.out.print(e);
			return "home";
		}
		return "ChangePassword";
	}
	
	//updates password in the db through userDAO
	@RequestMapping(value="UpdatePassword")
	public String updatePassword(HttpServletRequest request, Model model){
		try{
			HttpSession session= request.getSession();
			Person user= (Person)session.getAttribute("user");
			String newPassword= request.getParameter("newpassword");
			userDAO.updatePassword(newPassword, user);
			
		}catch(Exception e){
			System.out.print(e);
			return "home";
		}
		return "ChangePassword";
	}
	
	//send mail to the admin along with the feedback details
	@RequestMapping(value = "Feedback")
	public String sendFeedback(HttpServletRequest request) {
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		String msg = request.getParameter("message");
		final String gmailu = "dannykannan1993@gmail.com";
		final String gmailp = "lordvoldemort";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		javax.mail.Session session = javax.mail.Session.getDefaultInstance(
				props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(gmailu, gmailp);
					}
				});

		try {
			Random randomGenerator = new Random();
			int code = randomGenerator.nextInt(1000);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("dannykannan1993@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(gmailu));
			message.setSubject("Feedback by Customer- BookBucket");
			message.setText("Hi, Message " + msg + " email id id:" + email);

			Transport.send(message);

		} catch (MessagingException e) {
			// throw new RuntimeException(e)
			System.out.print(e);
		}
		
		return "home";
	}

	//Registration for new users account, check mail id by sending confirmation mail and unique security id
	@RequestMapping(value = "Register")
	public String register(Model model, HttpServletRequest request) {
		String returnPage = "";
		String name = request.getParameter("username").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password");
		String password2 = request.getParameter("confirm");
		Boolean flag = userDAO.queryUserName(name);
		if (flag) {
			model.addAttribute("username", name);
			model.addAttribute("password", password);
			model.addAttribute("email", email);

			final String gmailu = "dannykannan1993@gmail.com";
			final String gmailp = "lordvoldemort";

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			javax.mail.Session session = javax.mail.Session.getDefaultInstance(
					props, new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(gmailu, gmailp);
						}
					});
			//generating the security key code for confirmation of email id
			try {
				Random randomGenerator = new Random();
				int code = randomGenerator.nextInt(1000);
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("dannykannan1993@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(email));
				message.setSubject("Registration Code- BookBucket");
				message.setText("Hi, Your Code is: " + code);

				Transport.send(message);
				model.addAttribute("code", code);
				returnPage= "RegisterCode";
			} catch (MessagingException e) {
				// throw new RuntimeException(e);
				System.out.print(e);
				return "home";
			}
		} else {
			JOptionPane.showMessageDialog(null, "Unique username not found");
			returnPage="Registration";
		}
		return returnPage;
	}

	//redirecting to the registration page
	@RequestMapping(value = "Registration")
	public String hrefRegister() {
		return "Registration";
	}

	//redirecting to the register code page to verify the security code
	@RequestMapping(value = "RegisterCode")
	public String hrefRegisterCode() {
		return "RegisterCode";
	}

	//checking the validity of the security code entered and the confirmation of email id
	@RequestMapping(value = "CheckRegistration")
	public String hrefCheckRegistration(HttpServletRequest request) {
		try{
		String code = request.getParameter("code");
		String codeEnter = request.getParameter("code2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Person user = new Person();
		user.setUserName(name);
		user.setEmailId(email);
		user.setPassword(password);

		if (code.equals(codeEnter)) {
			Boolean flag = userDAO.addUser(user);
			JOptionPane.showMessageDialog(null, "You are registered");

		} else {
			JOptionPane.showMessageDialog(null,
					"Wrong code entered. You are not registered");
		}}catch(Exception e){
			System.out.print(e);
			return "home";
		}
		return "Registration";
	}

	//redirecting to the search store page
	@RequestMapping(value = "SearchStore")
	public String hrefSearchStore() {
		return "SearchStore";
	}

	//redirecting to the customer homepage
	@RequestMapping(value = "CustomerHomepage")
	public String hrefCustomerHomepage() {
		return "CustomerHomepage";
	}

	//redirecting to the shopping cart  page, listing the items in the cart
	@RequestMapping(value = "ShoppingCart")
	public String hrefShoppingCart(Model model, HttpServletRequest request) {
		try{
		HttpSession session = request.getSession();
		List<OrderItem> list = (List<OrderItem>) session.getAttribute("orderitemList");
		List<OrderItem> newlist = (List<OrderItem>) session.getAttribute("newOrderItemList");
		model.addAttribute("list", list);
		model.addAttribute("newlist", newlist);

		if (list != null) {
			int listsize = list.size();
			model.addAttribute("listsize", listsize);
		}
		if (newlist != null) {
			int newlistsize = newlist.size();
			model.addAttribute("newlistsize", newlistsize);

		}}catch(Exception e){
			System.out.print(e);
			return "home";
		}

		return "ShoppingCart";
	}

	
	@RequestMapping(value = "NewBook")
	public String hrefNewBook() {
		return "NewBook";
	}

	@RequestMapping(value = "AdvanceSearch")
	public String hrefAdvanceSearch() {
		return "AdvanceSearch";
	}

	//removing items from the cart by the customer
	@RequestMapping(value = "RemoveFromCart")
	public String hrefRemoveFromCart(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			String name = request.getParameter("name");
			String author = request.getParameter("author");
			String edition = request.getParameter("edition");
			String qnty = (request.getParameter("quantity"));
			qnty = qnty.trim();
			int quantity = Integer.parseInt(qnty);

			String activeStr = (request.getParameter("active"));
			activeStr = activeStr.trim();
			int active = Integer.parseInt(activeStr);

			String type = request.getParameter("type");
			Book book = new Book();
			book.setProductName(name.trim());
			book.setAuthor(author.trim());
			book.setEdition(edition.trim());
			book.setProductType(type.trim());
			book.setActive(active);
			System.out.print(type);
			List<OrderItem> newlist = (List<OrderItem>) session
					.getAttribute("newOrderItemList");
			List<OrderItem> list = (List<OrderItem>) session
					.getAttribute("orderitemList");

			if (activeStr.trim().equalsIgnoreCase("0")) {
				newlist = orderDAO.removeNewBookOrderItem(book, newlist);

				JOptionPane.showMessageDialog(null, "Item Deleted");
			}
			if (activeStr.trim().equalsIgnoreCase("1")) {
				list = orderDAO.removeNewBookOrderItem(book, list);

				JOptionPane.showMessageDialog(null, "Item Deleted");
			}
			session.setAttribute("newOrderItemList", newlist);
			session.setAttribute("orderitemList", list);
			model.addAttribute("list", list);
			model.addAttribute("newlist", newlist);
			model.addAttribute("listsize", list.size());
			model.addAttribute("newlistsize", newlist.size());
		} catch (Exception e) {
			System.out.print(e);
			return "CustomerHomepage";
		}
		return "ShoppingCart";
	}

	//adding items to the cart by the customer
	@RequestMapping(value = "AddToCart")
	public String hrefAddToCart(Model model, HttpServletRequest request,
			@RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			Person user = (Person) session.getAttribute("user");
			int bookId = (Integer.parseInt(action));

			String quant = request.getParameter("quantity");
			quant = quant.trim();
			if (quant.isEmpty()) {
				JOptionPane.showMessageDialog(null, "Enter proper quantity");
				return "CustomerHomepage";
			}
			int quantity = Integer.parseInt(quant);
			DifferentOrder order = (DifferentOrder) session
					.getAttribute("order");
			
			List<OrderItem> list = (List) session.getAttribute("orderitemList");
			List<OrderItem> newList = new ArrayList<OrderItem>();
			newList = orderDAO.addOrderItem(bookId, quantity, list);
			session.setAttribute("orderitemList", newList);
			JOptionPane.showMessageDialog(null, "Book added to cart");
		} catch (Exception e) {
			System.out.print(e);
			return "CustomerHomepage";
		}
		return "CustomerHomepage";
	}

	//Adding new books option
	@RequestMapping(value = "AddNewBooktoCart")
	public String addNewBook(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			Person user = (Person) session.getAttribute("user");

			String bookName = request.getParameter("name");
			String edition = request.getParameter("edition");
			String author = request.getParameter("author");
			String quant = request.getParameter("quantity");
			int quantity = Integer.parseInt(quant);
			Book book = new Book();
			book.setActive(0);
			book.setAuthor(author.trim());
			book.setEdition(edition.trim());
			book.setProductName(bookName.trim());
			book.setProductType("New");
			int bookId = bookDAO.checkExistingBook(book);
			int newBookID= bookDAO.checkNewExistingBook(book);
			if (bookId == 0 && newBookID==0) {
				bookId = bookDAO.addNewBook(book);
			}
				List<OrderItem> list = (List) session
						.getAttribute("newOrderItemList");
				List<OrderItem> newList = new ArrayList<OrderItem>();
				if(bookId!=0){
					newList = orderDAO.addOrderItem(bookId, quantity, list);}
				if(newBookID!=0){
						newList = orderDAO.addOrderItem(newBookID, quantity, list);
					}
				session.setAttribute("newOrderItemList", newList);
				
				JOptionPane.showMessageDialog(null, "Book added to cart");
			if(bookId==0 && newBookID==0){
				JOptionPane.showMessageDialog(null, "This book already exists");
			}
		} catch (Exception e) {
			System.out.print(e);
			return "CustomerHomepage";
		}
		return "CustomerHomepage";
	}
	@RequestMapping(value="AddEmployee")
	public String hrefNewEmployee(HttpServletRequest request, Model model){
		
		return "AddEmployee";
	}
	
	//Adding new employees and their details and user type to the database
	@RequestMapping(value="AddNewEmployee")
	public String addNewEmployee(HttpServletRequest request, Model model){
		try{
			Person user= new Person();
			String name= request.getParameter("name").trim();
			String username= request.getParameter("username").trim();
			String password= request.getParameter("password").trim();
			String type= request.getParameter("type");
			String email= request.getParameter("email");
			user.setPersonFName(name);
			user.setPassword(password);
			user.setEmailId(email);
			user.setPersonType(type);
			user.setDepartment(type);
			user.setUserName(username);
			Boolean flag= userDAO.queryUserName(username);
			if(flag){
				Boolean flag1= userDAO.addEmployee(user);
				if(flag1){
					JOptionPane.showMessageDialog(null, "Employee Added");
				}
				
			}
			
			
		}catch(Exception e){
			System.out.print(e);
			return "AdminHomepage";
		}
		return "AddEmployee";
	}
	
	//Adding new book to the inventory
	@RequestMapping(value="AddNewBook")
	public String addNewBack(HttpServletRequest request, Model model){
		try {
			HttpSession session = request.getSession();
			Person user = (Person) session.getAttribute("user");

			String bookName = request.getParameter("name");
			String edition = request.getParameter("edition");
			String author = request.getParameter("author");
			String quant = request.getParameter("quantity");
			int quantity = Integer.parseInt(quant);
			Book book = new Book();
			book.setActive(0);
			book.setAuthor(author.trim());
			book.setEdition(edition.trim());
			book.setProductName(bookName.trim());
			book.setProductType("New");
			int bookId = bookDAO.addNewBook(book);
			if (bookId > 0) {
				JOptionPane.showMessageDialog(null, "Book added to cart");
			} else {
				JOptionPane.showMessageDialog(null, "This book already exists");
			}
		} catch (Exception e) {
			System.out.print(e);
			return "AdminHomepage";
		}
		return "AdminHomepage";
	}

	//Searching books if they exists in the inventory
	@RequestMapping(value = "SearchBooks")
	public String hrefSearchBooks(@RequestParam("search") String name,
			Model model) {
		
		List<Book> bookList = new ArrayList<Book>();
		bookList = bookDAO.searchBooks(name);
		model.addAttribute("booklist", bookList);
		int size = bookList.size();
		model.addAttribute("size", size);

		return "CustomerHomepage";
	}

	//mentioning the order status 
	@RequestMapping(value = "OrderStatus")
	public String checkOrderStatus(HttpServletRequest request, Model model) {
		try {

			HttpSession session = request.getSession();
			Person user = (Person) session.getAttribute("user");
			List<DifferentOrder> existingOrderList = new ArrayList<DifferentOrder>();
			List<DifferentOrder> newOrderList = new ArrayList<DifferentOrder>();
			List<DifferentOrder> sellingOrderList = new ArrayList<DifferentOrder>();
			existingOrderList = orderDAO.getExistingOrder(user);
			newOrderList = orderDAO.getNewOrder(user);
			sellingOrderList = orderDAO.getSellingOrder(user);
			session.setAttribute("existingOrderList", existingOrderList);
			session.setAttribute("newOrderList", newOrderList);
			session.setAttribute("sellingOrderList", sellingOrderList);

			if (existingOrderList != null) {
				model.addAttribute("existingOrderList", existingOrderList);
				model.addAttribute("existingsize", existingOrderList.size());
			}

			if (newOrderList != null) {
				model.addAttribute("newOrderList", newOrderList);
				model.addAttribute("newsize", newOrderList.size());
			}

			if (sellingOrderList != null) {
				model.addAttribute("sellingOrderList", sellingOrderList);
				model.addAttribute("sellingSize", sellingOrderList.size());
			}

		} catch (Exception e) {
			System.out.print(e);
			return "CustomerHomepage";
		}
		return "OrderStatus";
	}
	
	//managing the orders placed for selling books by customers
	@RequestMapping(value = "ManageSellOrders")
	public String checkSellOrder(HttpServletRequest request, Model model) {
		try {

			HttpSession session = request.getSession();
			Person user = (Person) session.getAttribute("user");
			List<DifferentOrder> sellingOrderList = new ArrayList<DifferentOrder>();
			sellingOrderList = orderDAO.getSellingOrder(user);
			session.setAttribute("sellingOrderList", sellingOrderList);

			
			if (sellingOrderList != null) {
				model.addAttribute("sellingOrderList", sellingOrderList);
				model.addAttribute("sellingsize", sellingOrderList.size());
			}

		} catch (Exception e) {
			System.out.print(e);
			return "CustomerHomepage";
		}
		return "ManageSellOrders";
	}
	
	
	//shipping the existing books in the inventory and updating database accordingly
	@RequestMapping(value = "GetExistingOrderItems")
	public String getExistingOrderItems(HttpServletRequest request,
			Model model, @RequestParam String action) {
		try {

			HttpSession session = request.getSession();
			int orderId = (Integer.parseInt(action));
			Set<OrderItem> itemlist = (Set) orderDAO.getOrderitemList(orderId);
			session.setAttribute("existingitemlist", itemlist);
			if (itemlist.size() > 0) {
				List<DifferentOrder> existingOrderList = (List<DifferentOrder>) session
						.getAttribute("existingOrderList");
				List<DifferentOrder> newOrderList = (List<DifferentOrder>) session
						.getAttribute("newOrderList");
				List<DifferentOrder> sellingOrderList = (List<DifferentOrder>) session
						.getAttribute("sellingOrderList");
				model.addAttribute("existingOrderList", existingOrderList);
				model.addAttribute("newOrderList", newOrderList);
				model.addAttribute("sellingOrderList", sellingOrderList);

				model.addAttribute("existingsize", existingOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

			}
			return "OrderStatus";
		} catch (Exception e) {
			System.out.print(e);
			//return "CustomerHomepage";
		}
		return "OrderStatus";

	}

	//managing the order for new books placed by the customer
	@RequestMapping(value = "GetCustomerNewOrderItems")
	public String getCustomerNewOrderItems(HttpServletRequest request,
			Model model, @RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int orderId = (Integer.parseInt(action));
			Set<OrderItem> itemlist = (Set) orderDAO.getOrderitemList(orderId);
			session.setAttribute("newitemlist", itemlist);
			if (itemlist.size() > 0) {
				List<DifferentOrder> existingOrderList = (List<DifferentOrder>) session
						.getAttribute("existingOrderList");
				List<DifferentOrder> newOrderList = (List<DifferentOrder>) session
						.getAttribute("newOrderList");
				List<DifferentOrder> sellingOrderList = (List<DifferentOrder>) session
						.getAttribute("sellingOrderList");
				model.addAttribute("existingOrderList", existingOrderList);
				model.addAttribute("newOrderList", newOrderList);
				model.addAttribute("sellingOrderList", sellingOrderList);
				model.addAttribute("newsize", newOrderList.size());
				model.addAttribute("newitemlist", itemlist);
				model.addAttribute("newitemlistsize", itemlist.size());

			}
			return "OrderStatus";
		} catch (Exception e) {
			System.out.print(e);
			//return "CustomerHomepage";
		}
		return "OrderStatus";

	}

	@RequestMapping(value = "GetCustomerSellingOrderItems")
	public String getCustomerSellingOrderItems(HttpServletRequest request,
			Model model, @RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int orderId = (Integer.parseInt(action));
			Set<OrderItem> itemlist = (Set) orderDAO.getOrderitemList(orderId);
			session.setAttribute("sellingitemlist", itemlist);
			if (itemlist.size() > 0) {
				List<DifferentOrder> existingOrderList = (List<DifferentOrder>) session
						.getAttribute("existingOrderList");
				List<DifferentOrder> newOrderList = (List<DifferentOrder>) session
						.getAttribute("newOrderList");
				List<DifferentOrder> sellingOrderList = (List<DifferentOrder>) session
						.getAttribute("sellingOrderList");
				model.addAttribute("existingOrderList", existingOrderList);
				model.addAttribute("newOrderList", newOrderList);
				model.addAttribute("sellingOrderList", sellingOrderList);
				model.addAttribute("sellingsize", sellingOrderList.size());
				model.addAttribute("sellingitemlist", itemlist);
				model.addAttribute("sellingitemlistsize", itemlist.size());

			}
			return "ManageSellOrders";
		} catch (Exception e) {
			System.out.print(e);
			//return "CustomerHomepage";
		}
		return "ManageSellOrders";

	}

	//checking out after done shopping by the customer
	@RequestMapping(value = "CheckOut")
	public String hrefCheckout(Model model, HttpServletRequest request) {
		try{
		Address address = new Address();
		model.addAttribute("address", address);
		Card card = new Card();
		model.addAttribute("card", card);}
		catch(Exception e){
			System.out.print(e);
			return "AddressDetails";
		}
		return "CheckoutDetails";
	}

	//update the address details of the customer as well as the oayment details too
	@RequestMapping(value = "AddressDetails")
	public String hrefAddressDetails(Model model, HttpServletRequest request,
			Address address) {
		try {
			HttpSession session = request.getSession();
			session.setAttribute("address", address);
			String fName = request.getParameter("firstname");
			String lName = request.getParameter("lastname");
			Person user = (Person) session.getAttribute("user");
			user.setPersonFName(fName);
			user.setPersonLName(lName);
			address.setPerson(user);
			session.setAttribute("user", user);
			session.setAttribute("address", address);
			String holderName = request.getParameter("holderName");
			String cardNumberStr = request.getParameter("cardNumber");
			long cardNumber = Long.parseLong(cardNumberStr);
			String cvcStr = request.getParameter("cvc");
			int cvc = Integer.parseInt(cvcStr);
			String expiryMonthStr = request.getParameter("expiryMonth");
			int expiryMonth = Integer.parseInt(expiryMonthStr);
			String expiryYearStr = request.getParameter("expiryYear");
			int expiryYear = Integer.parseInt(expiryYearStr);

			Card card = new Card();
			card.setCardNumber(cardNumber);
			card.setCvc(cvc);
			card.setExpiryMonth(expiryMonth);
			card.setExpiryYear(expiryYear);
			card.setHolderName(holderName);
			session.setAttribute("card", card);
			model.addAttribute("card", card);

		} catch (Exception e) {
			System.out.print(e);
			return "SummaryDetails";
		}
		return "SummaryDetails";
	}

	//mentions the order details and a summary of the order placed
	@RequestMapping(value = "SummaryDetails")
	public String hrefSummaryDetails(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Card card = (Card) session.getAttribute("card");
		Address address = (Address) session.getAttribute("address");
		Person user = (Person) session.getAttribute("user");

		List<OrderItem> list = (List<OrderItem>) session
				.getAttribute("orderitemList");
		List<OrderItem> newlist = (List<OrderItem>) session
				.getAttribute("newOrderItemList");
		int listsize = list.size();
		int newlistsize = newlist.size();
		model.addAttribute("list", list);
		model.addAttribute("newlist", newlist);
		model.addAttribute("listsize", listsize);

		model.addAttribute("newlistsize", newlistsize);
		model.addAttribute("user", user);
		model.addAttribute("card", card);
		return "SummaryDetails";
	}

	//printing receipt of the order placed by the customer
	@RequestMapping(value = "PrintForm")
	public void printReceipt(HttpServletResponse response,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		response.setContentType("application/pdf");
		Person user = (Person) session.getAttribute("user");
		Card card = (Card) session.getAttribute("card");
		Address address = (Address) session.getAttribute("address");
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, response.getOutputStream());
			document.open();
			List<OrderItem> list = (List<OrderItem>) session
					.getAttribute("orderitemList");
			List<OrderItem> newList = (List<OrderItem>) session
					.getAttribute("newOrderItemList");
			if (list.size() > 0) {
				Table table1 = new Table(6);
				table1.addCell("Name");
				table1.addCell("Author");
				table1.addCell("Edition");
				table1.addCell("Type");
				table1.addCell("Price");
				table1.addCell("Quantity");
				for (int i = 0; i < list.size(); i++) {
					OrderItem oi = list.get(i);
					table1.addCell(oi.getBook().getProductName());
					table1.addCell(oi.getBook().getAuthor());
					table1.addCell(oi.getBook().getEdition());
					table1.addCell(oi.getBook().getProductType());
					table1.addCell(String
							.valueOf(oi.getBook().getProductCost()));
					table1.addCell(String.valueOf(oi.getQuantity()));
				}
				document.add(table1);
			}
			if (newList.size() > 0) {
				Table table2 = new Table(6);
				table2.addCell("Name");
				table2.addCell("Author");
				table2.addCell("Edition");
				table2.addCell("Type");
				table2.addCell("Price");
				table2.addCell("Quantity");

				for (int i = 0; i < newList.size(); i++) {
					OrderItem oi = newList.get(i);
					table2.addCell(oi.getBook().getProductName());
					table2.addCell(oi.getBook().getAuthor());
					table2.addCell(oi.getBook().getEdition());
					table2.addCell(oi.getBook().getProductType());
					table2.addCell("Not decided yet");
					table2.addCell(String.valueOf(oi.getQuantity()));
				}
				document.add(table2);
			}

			document.addSubject("First Name: " + user.getPersonFName());
			document.addSubject("Last Name:" + user.getPersonLName());
			document.addSubject("SHIPPING ADDRESS");
			document.addSubject("Address Line 1:" + address.getStreetName());
			document.addSubject("Address Line 2:" + address.getAddressLine2());
			document.addSubject("City:" + address.getCity());
			document.addSubject("State:" + address.getState());
			document.addSubject("Pincode:" + address.getZipcode());
			document.addSubject("PAYMENT DETAILS");
			document.addSubject("Name on Card:" + card.getHolderName());
			document.addSubject("Card Number: " + card.getCardNumber());
			document.addSubject("Expiration :" + card.getExpiryMonth() + "/"
					+ card.getExpiryYear());
			document.close();
			response.flushBuffer();
			// return "CustomerHomepage";
		} catch (Exception e) {
			System.out.print(e);
			
		}

		// return "CustomerHomepage";
	}

	//confirm the order placed, final steo, clears the shopping cart an dthe other data structures involved in that cart session
	@RequestMapping(value = "ConfirmOrder")
	public String confirmOrder(HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			Person user = (Person) session.getAttribute("user");
			Card card = (Card) session.getAttribute("card");
			List<OrderItem> list = (List<OrderItem>) session
					.getAttribute("orderitemList");
			List<OrderItem> newList = (List<OrderItem>) session
					.getAttribute("newOrderItemList");
			Address address = (Address) session.getAttribute("address");

			Boolean flag = orderDAO.confirmOrder(list, newList, address, card,
					user);
			if (flag) {
				JOptionPane.showMessageDialog(null, "Order Confirmed");
				session.setAttribute("orderitemList", null);
				session.setAttribute("newOrderItemList", null);
				session.setAttribute("address", null);
				session.setAttribute("card", null);
			}

			return "CustomerHomepage";
		} catch (Exception e) {
			System.out.print(e);
		}
		return "CustomerHomepage";

	}

	//redirects to sell books page for customers
	@RequestMapping(value = "SellBooks")
	public String hrefSellBooks(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		return "SellBooks";
	}

	//removes the book items added for selling
	@RequestMapping(value = "DeleteSellProduct")
	public String deleteSellProduct(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String edition = request.getParameter("edition");
		/*
		 * String qnty=(request.getParameter("quantity")); qnty=qnty.trim(); int
		 * quantity= Integer.parseInt(qnty);
		 */
		Book book = new Book();
		book.setAuthor(author.trim());
		book.setEdition(edition.trim());
		book.setProductName(name.trim());
		book.setActive(0);

		List<OrderItem> selllist = (List<OrderItem>) session
				.getAttribute("sellOrderItemList");
		selllist = orderDAO.removeNewBookOrderItem(book, selllist);
		JOptionPane.showMessageDialog(null, "Product Deleted");
		session.setAttribute("sellOrderItemList", selllist);
		model.addAttribute("selllist", selllist);
		model.addAttribute("sellsize", selllist.size());
		JOptionPane.showMessageDialog(null, selllist.size());
		return "SellBooks";
	}

	//adds the list of books the customer wants to sell
	@RequestMapping(value = "AddSellingBooks")
	public String addSellingBooks(Model model, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();

			String bookName = request.getParameter("name").trim();
			String edition = request.getParameter("edition").trim();
			String author = request.getParameter("author").trim();
			String quant = request.getParameter("quantity");
			int quantity = Integer.parseInt(quant);
			Book book = new Book();
			book.setActive(0);
			book.setAuthor(author);
			book.setEdition(edition);
			book.setProductName(bookName);
			book.setProductType("New");
			int bookId = bookDAO.checkExistingBook(book);
			int newBookID= bookDAO.checkNewExistingBook(book);
			if (bookId == 0 && newBookID==0) {
				bookId = bookDAO.addNewBook(book);
			}

			List<OrderItem> list = (List) session
					.getAttribute("sellOrderItemList");
			List<OrderItem> newList = new ArrayList<OrderItem>();
			if(bookId!=0){
			newList = orderDAO.addOrderItem(bookId, quantity, list);}
			if(newBookID!=0){
				newList = orderDAO.addOrderItem(newBookID, quantity, list);
			}
			session.setAttribute("sellOrderItemList", newList);
			JOptionPane.showMessageDialog(null, "Book to be sold added");
			List<OrderItem> selllist = (List<OrderItem>) session
					.getAttribute("sellOrderItemList");
			int size = selllist.size();
			model.addAttribute("selllist", selllist);
			model.addAttribute("sellsize", size);

		} catch (Exception e) {
			System.out.print(e);
			
		}
		return "SellBooks";
	}

	//placing the order for books ot sell by the customer
	@RequestMapping(value = "SellOrderSend")
	public String sellOrderSend(HttpServletRequest request) {

		try {
			HttpSession session = request.getSession();
			Person user = (Person) session.getAttribute("user");
			List<OrderItem> list = (List<OrderItem>) session
					.getAttribute("sellOrderItemList");

			Boolean flag = orderDAO.confirmSellingOrder(list, user);
			if (flag) {
				JOptionPane.showMessageDialog(null, "Order Confirmed");
			}
			return "SellBooks";
		} catch (Exception e) {
			System.out.print(e);
		}

		return "SellBooks";
	}

	//User type :Operator
	//Operator functions

	//Redirect to the operator home-page along with the data structures of selling buying order list to be managed
	@RequestMapping(value = "OperatorHomepage")
	public String viewOldBuyerOrders(HttpServletRequest request, Model model) {
		try {
			HttpSession session = request.getSession();
			List<DifferentOrder> buyerOldOrderList = (List<DifferentOrder>) session
					.getAttribute("buyerOldOrderList");
			buyerOldOrderList = orderDAO.buyerOldOrders();
			if(buyerOldOrderList!=null){
			int oldsize = buyerOldOrderList.size();
			session.setAttribute("buyerOldOrderList", buyerOldOrderList);
			model.addAttribute("buyerOldOrderList", buyerOldOrderList);
			model.addAttribute("oldsize", oldsize);
			Set<OrderItem> itemlist = (Set) session.getAttribute("itemlist");

			if (itemlist != null) {
				int itemlistsize = itemlist.size();

				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlistsize);
			}}

		} catch (Exception e) {
			System.out.print(e);
		}
		return "OperatorHomepage";
	}

	//mentions the list of new books to be delivered
	@RequestMapping(value = "NewBookOrders")
	public String viewNewBuyerOrders(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		List<DifferentOrder> buyerNewOrderList = (List<DifferentOrder>) session
				.getAttribute("buyerNewOrderList");
		buyerNewOrderList = orderDAO.buyerNewOrders();
		int newsize = buyerNewOrderList.size();
		session.setAttribute("buyerNewOrderList", buyerNewOrderList);

		model.addAttribute("buyerNewOrderList", buyerNewOrderList);
		model.addAttribute("newsize", newsize);
		return "NewBookOrders";
	}

	//mentions the list of old books to be sold by the customer
	@RequestMapping(value = "SellerOrdersOperator")
	public String viewSellerOrders(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		List<DifferentOrder> sellOrderList = (List<DifferentOrder>) session
				.getAttribute("sellOrderList");
		sellOrderList = orderDAO.sellerOldOrders();
		int sellsize = sellOrderList.size();
		session.setAttribute("sellOrderList", sellOrderList);

		model.addAttribute("sellOrderList", sellOrderList);
		model.addAttribute("sellsize", sellsize);
		return "SellerOrdersOperator";
	}

	//mentions the list of order items in a particular order
	@RequestMapping(value = "GetOrderItems")
	public String getOrderItems(HttpServletRequest request, Model model,
			@RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int orderId = (Integer.parseInt(action));
			Set<OrderItem> itemlist = (Set) orderDAO.getOrderitemList(orderId);
			session.setAttribute("itemlist", itemlist);
			if (itemlist.size() > 0) {
				List<DifferentOrder> buyerOldOrderList = (List<DifferentOrder>) session
						.getAttribute("buyerOldOrderList");
				buyerOldOrderList = orderDAO.buyerOldOrders();
				model.addAttribute("buyerOldOrderList", buyerOldOrderList);
				model.addAttribute("oldsize", buyerOldOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

			}
			return "OperatorHomepage";
		} catch (Exception e) {
			System.out.print(e);
		}
		return "OperatorHomepage";

	}

	//mentions the order items present in an order for new books 
	@RequestMapping(value = "GetNewOrderItems")
	public String getNewOrderItems(HttpServletRequest request, Model model,
			@RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int orderId = (Integer.parseInt(action));
			Set<OrderItem> itemlist = (Set) orderDAO.getOrderitemList(orderId);
			session.setAttribute("newitemlist", itemlist);
			if (itemlist.size() > 0) {
				List<DifferentOrder> buyerNewOrderList = (List<DifferentOrder>) session
						.getAttribute("buyerNewOrderList");
				buyerNewOrderList = orderDAO.buyerNewOrders();
				model.addAttribute("buyerNewOrderList", buyerNewOrderList);
				model.addAttribute("newsize", buyerNewOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "NewBookOrders";

	}

	//operator updates the order status based on the items delivered or other
	@RequestMapping(value = "updateOrderStatus")
	public @ResponseBody String UpdateOrderStatus(HttpServletRequest request,
			Model model) {
		try {

			HttpSession session = request.getSession();
			String oid = request.getParameter("orderId");
			String status = request.getParameter("status");
			// oid= oid.trim();
			int orderId = Integer.parseInt(oid);
			Boolean flag = orderDAO.updateOrderStatus(orderId, status);
			if (flag) {
				JOptionPane.showMessageDialog(null, "Status Updated");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	//place the cost of the books to be sold by the customer
	@RequestMapping(value = "UpdateCost")
	public @ResponseBody String UpdateCost(HttpServletRequest request,
			Model model) {
		try {

			HttpSession session = request.getSession();
			String oid = request.getParameter("orderItemId");
			String cost = request.getParameter("cost");
			// oid= oid.trim();
			int orderitemId = Integer.parseInt(oid);
			Float cost1 = Float.parseFloat(cost);

			Boolean flag = orderDAO.updateOrderitemCost(orderitemId, cost1);
			if (flag) {
				JOptionPane.showMessageDialog(null, "Cost Updated");
			}

		} catch (Exception e) {
			System.out.print(e);
		}
		return "success";
	}
	
	//update the cost of the order
	@RequestMapping(value = "UpdateCostStatus")
	public @ResponseBody String UpdateCostStatus(HttpServletRequest request,
			Model model) {
		try {

			HttpSession session = request.getSession();
			String oid = request.getParameter("orderItemId");
			String cost = request.getParameter("cost");
			int orderitemId = Integer.parseInt(oid);

			Boolean flag = orderDAO.updateOrderItemStatus(orderitemId, cost);
			if (flag) {
				JOptionPane.showMessageDialog(null, "Cost Updated");
			}

		} catch (Exception e) {
			System.out.print(e);
		}
		return "success";
	}

	//mentions the list of orders of selling books items by the customer
	@RequestMapping(value = "GetSellOrderItems")
	public String getSellOrderItems(HttpServletRequest request, Model model,
			@RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int orderId = (Integer.parseInt(action));
			Set<OrderItem> itemlist = (Set) orderDAO.getOrderitemList(orderId);
			session.setAttribute("sellitemlist", itemlist);
			if (itemlist.size() > 0) {
				List<DifferentOrder> sellOrderList = (List<DifferentOrder>) session
						.getAttribute("sellOrderList");
				sellOrderList = orderDAO.buyerNewOrders();
				model.addAttribute("sellOrderList", sellOrderList);
				model.addAttribute("sellsize", sellOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

			}
		} catch (Exception e) {
			System.out.print(e);
		}
		return "SellerOrdersOperator";

	}

	//checking the inventory for the respective books items
	@RequestMapping(value = "CheckInventory")
	public String checkInventory(Model model, HttpServletRequest request,
			@RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int oiId = (Integer.parseInt(action));
			OrderItem oi = orderDAO.getBook(oiId);
			if (oi.getItemStatus() == null) {

				int productId = oi.getBook().getProductId();
				InventoryItem in = inventoryDAO.checkInventoryItem(productId);
				String message = inventoryDAO.checkInventory(oi, in);
				JOptionPane.showMessageDialog(null, message);
				model.addAttribute("message", message);
			} else {
				JOptionPane.showMessageDialog(null, "Items already delivered");
			}

			Set<OrderItem> itemlist = (Set<OrderItem>) session
					.getAttribute("itemlist");
			if (itemlist.size() > 0) {
				List<DifferentOrder> buyerOldOrderList = (List<DifferentOrder>) session
						.getAttribute("buyerOldOrderList");
				buyerOldOrderList = orderDAO.buyerOldOrders();
				model.addAttribute("buyerOldOrderList", buyerOldOrderList);
				model.addAttribute("oldsize", buyerOldOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());
				return "OperatorHomepage";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "OperatorHomepage";
	}

	//check the inventory for the new books if available or not
	@RequestMapping(value = "CheckInventoryNew")
	public String checkInventoryNew(HttpServletRequest request, Model model,
			@RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int oiId = (Integer.parseInt(action));
			OrderItem oi = orderDAO.getBook(oiId);
			int productId = oi.getBook().getProductId();
			InventoryItem in = inventoryDAO.checkInventoryItem(productId);
			if (in != null) {
				String message = inventoryDAO.checkInventory(oi, in);
				JOptionPane.showMessageDialog(null, message);
				model.addAttribute("message", message);
			} else {
				JOptionPane.showMessageDialog(null,
						"Book not added to inventory yet");
			}
			Set<OrderItem> itemlist = (Set<OrderItem>) session
					.getAttribute("newitemlist");
			if (itemlist.size() > 0) {
				List<DifferentOrder> buyerNewOrderList = (List<DifferentOrder>) session
						.getAttribute("buyerNewOrderList");
				buyerNewOrderList = orderDAO.buyerNewOrders();
				model.addAttribute("buyerNewOrderList", buyerNewOrderList);
				model.addAttribute("newsize", buyerNewOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

			}
		} catch (Exception e) {
			System.out.print(e);
		}
		return "NewBookOrders";
	}

	//update the items available from inventory and the ones that need to be ordered from manufacturer
	@RequestMapping(value = "UpdateItem")
	public String updateItem(HttpServletRequest request, Model model,
			@RequestParam String action) {
		try {
			HttpSession session = request.getSession();
			int oiId = (Integer.parseInt(action));
			Float cost = Float.parseFloat(request.getParameter("cost"));
			String status = request.getParameter("status");
			orderDAO.updateItem(status, cost, oiId);
			JOptionPane.showMessageDialog(null, "item updated");
			Set<OrderItem> itemlist = (Set<OrderItem>) session
					.getAttribute("newitemlist");
			if (itemlist.size() > 0) {
				List<DifferentOrder> buyerNewOrderList = (List<DifferentOrder>) session
						.getAttribute("buyerNewOrderList");
				buyerNewOrderList = orderDAO.buyerNewOrders();
				model.addAttribute("buyerNewOrderList", buyerNewOrderList);
				model.addAttribute("newsize", buyerNewOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

			}
		} catch (Exception e) {
			System.out.print(e);
		}
		return "NewBookOrders";
	}

	@RequestMapping(value = "SellerNewBook")
	public String sellerNewBook(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		try {
			String name = request.getParameter("name");
			String author = request.getParameter("author");
			String edition = request.getParameter("edition");
			String quantity = (request.getParameter("quantity"));
			int qty = Integer.parseInt(quantity.trim());
			String item = request.getParameter("item");
			String status = request.getParameter("status").trim();
			int oi = Integer.parseInt(item.trim());
			if (status == "Approved") {
				Book book = new Book();
				book.setAuthor(author.trim());
				book.setEdition(edition.trim());
				book.setProductName(name.trim());
				int id = bookDAO.checkExistingBook(book);
				System.out.print(id);
				if (id == 0) {
					int bookId = bookDAO.addNewBook(book);
					Boolean oiFlag = orderDAO.setOrderItem(bookId, oi);
					Boolean flag = inventoryDAO.addToInventory(bookId, qty);
					if (oiFlag && flag) {
						JOptionPane.showMessageDialog(null,
								"Book not found. Added to inventory");
					}
				}
				if (id > 0) {
					Boolean oiFlag = orderDAO.setOrderItem(id, oi);
					Boolean flag = inventoryDAO.oldAdditionInventory(oi, id);
					if (oiFlag && flag) {
						JOptionPane.showMessageDialog(null,
								"Book found in inventory. Update inventory");
					}

				}
			}
			Set<OrderItem> itemlist = (Set<OrderItem>) session
					.getAttribute("newitemlist");
			if (itemlist.size() > 0) {
				List<DifferentOrder> buyerNewOrderList = (List<DifferentOrder>) session
						.getAttribute("buyerNewOrderList");
				buyerNewOrderList = orderDAO.buyerNewOrders();
				model.addAttribute("buyerNewOrderList", buyerNewOrderList);
				model.addAttribute("newsize", buyerNewOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "SellerOrdersOperator";
	}

	//place order for books needed in the inventory by the operator
	@RequestMapping(value = "PlaceInventoryOrder")
	public String placeInventoryOrder(HttpServletRequest request, Model model) {
		int productId = Integer.parseInt(request.getParameter("bookid"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Boolean flag = inventoryDAO.addToInventory(productId, quantity);
		if (flag) {
			JOptionPane.showMessageDialog(null, "Added to inventory");
		}
		return "OperatorHomepage";
	}

	//place orders for new books needed in the inventory by the operator
	@RequestMapping(value = "PlaceNewInventoryOrder")
	public String placeNewInventoryOrder(HttpServletRequest request, Model model) {
		try {
			HttpSession session = request.getSession();
			String bookName = request.getParameter("name");
			String edition = request.getParameter("edition");
			String author = request.getParameter("author");
			String quant = request.getParameter("quantity");
			int quantity = Integer.parseInt(quant.trim());
			String cost = request.getParameter("price");
			Float price = Float.parseFloat(cost.trim());
			int productId = Integer.parseInt(request.getParameter("item"));
			Book book = new Book();
			book.setActive(1);
			book.setAuthor(author.trim());
			book.setEdition(edition.trim());
			book.setProductName(bookName.trim());
			book.setProductType("New");
			book.setProductCost(price);
			int id = bookDAO.addNewBookActive(book);
			Boolean oiFlag = false;
			Boolean flag = false;
			if (id > 0) {
				oiFlag = orderDAO.setOrderItem(id, productId);
				flag = inventoryDAO.addToInventory(id, quantity);
			}
			if (flag && oiFlag) {
				JOptionPane.showMessageDialog(null, "Added to inventory");
			}
			Set<OrderItem> itemlist = (Set<OrderItem>) session
					.getAttribute("newitemlist");
			if (itemlist != null) {
				List<DifferentOrder> buyerNewOrderList = (List<DifferentOrder>) session
						.getAttribute("buyerNewOrderList");
				buyerNewOrderList = orderDAO.buyerNewOrders();
				model.addAttribute("buyerNewOrderList", buyerNewOrderList);
				model.addAttribute("newsize", buyerNewOrderList.size());
				model.addAttribute("itemlist", itemlist);
				model.addAttribute("itemlistsize", itemlist.size());

				return "NewBookOperator";
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return "NewBookOperator";
	}

	@RequestMapping(value = "NewBookOperator")
	public String placeNewBookOperator(HttpServletRequest request, Model model) {
		String returnPage = "NewBookOperator";
		HttpSession session = request.getSession();

		try {
			String name = request.getParameter("name");
			String author = request.getParameter("author");
			String edition = request.getParameter("edition");
			String quantity = (request.getParameter("quantity"));
			String cost = (request.getParameter("cost")).trim();
			Float cost1= Float.parseFloat(cost);
			quantity.trim();
			String item = request.getParameter("item");
			int oi = Integer.parseInt(item.trim());
			if (cost1>0) {
				model.addAttribute("item", oi);
				model.addAttribute("author", author);
				model.addAttribute("name", name);
				model.addAttribute("edition", edition);
				model.addAttribute("quantity", quantity);
				model.addAttribute("cost", cost);
			} else {
				JOptionPane.showMessageDialog(null, "Update cost first");
				Set<OrderItem> itemlist = (Set<OrderItem>) session
						.getAttribute("newitemlist");
				if (itemlist != null) {
					List<DifferentOrder> buyerNewOrderList = (List<DifferentOrder>) session
							.getAttribute("buyerNewOrderList");
					buyerNewOrderList = orderDAO.buyerNewOrders();
					model.addAttribute("buyerNewOrderList", buyerNewOrderList);
					model.addAttribute("newsize", buyerNewOrderList.size());
					model.addAttribute("itemlist", itemlist);
					model.addAttribute("itemlistsize", itemlist.size());
				}
				returnPage = "NewBookOrders";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnPage;
	}

	//redirects to the review sales page
	@RequestMapping(value="ReviewSalesYear")
	public String reviewSales(HttpServletRequest request, Model model){
	return "ReviewSalesYear";
	}
	
	//redirects to the year sale of the books page
	@RequestMapping(value="YearSale")
	public String yearSale(HttpServletRequest request, Model model){
	return "YearSale";
	}
	
	// gets the data needed for the review reports
	@RequestMapping(value="ReviewYearSale")
	public String reviewYearSale(HttpServletRequest request, Model model){
		String bookIdStr= request.getParameter("name");
		String yearStr= request.getParameter("year");
		int bookId= Integer.parseInt(bookIdStr);
		int year= Integer.parseInt(yearStr);
		List<Sales> salesList= bookDAO.getListOfSales(bookId, year);
		int sales[]= new int[salesList.size()];
		int month[]= new int[salesList.size()];
		String monthS[]= new String[salesList.size()];
		
		for(int i=0; i<salesList.size();i++){
			Sales sale=salesList.get(i);
			sales[i]=sale.getSales();
			month[i]=sale.getMonth();
		}
		
		for(int i=0; i<salesList.size();i++){
			 int monthNo = month[i];
			    String monthString;
			    switch (monthNo) {
			        case 1:  monthString = "January";
			                 break;
			        case 2:  monthString = "February";
			                 break;
			        case 3:  monthString = "March";
			                 break;
			        case 4:  monthString = "April";
			                 break;
			        case 5:  monthString = "May";
			                 break;
			        case 6:  monthString = "June";
			                 break;
			        case 7:  monthString = "July";
			                 break;
			        case 8:  monthString = "August";
			                 break;
			        case 9:  monthString = "September";
			                 break;
			        case 10: monthString = "October";
			                 break;
			        case 11: monthString = "November";
			                 break;
			        case 12: monthString = "December";
			                 break;
			        default: monthString = "Invalid month";
			                 break;
			    }
			    
			    monthS[i]=monthString;
		}
		
		model.addAttribute("month",monthS);
		model.addAttribute("sales", sales);
		return "YearSale";
	}
	
	

}
