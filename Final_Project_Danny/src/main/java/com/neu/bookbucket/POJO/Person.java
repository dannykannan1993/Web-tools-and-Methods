package com.neu.bookbucket.POJO;


import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="person")
public class Person implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;

	@Id
    @GeneratedValue
    @Column(name="personId")
	private int personId;
	
	@Column(name="personType")
	private String personType;
	
	@Column(name="personAge")
	private int personAge;
	
	@Column(name="personFName")
	private String personFName;
	
	@Column(name="personLName")
	private String personLName;
	
	@Column(name="personGender")
	private String personGender;
		
	@Column(name="department")
	private String department;
	
	@Column(name="creditpoints")
	private String creditpoints;
	
	@Column(name="userName")
	private String userName;
	
	@Column(name="userPassword")
	private String password;
	
	@Column(name="emailId")
	private String emailId;
	
	@OneToMany(mappedBy="person")
	private Set<Address> addressList;
	
	@OneToMany(mappedBy="person")
	private Set<Card> cardList;
	
	@OneToMany(mappedBy="person")
	private Set<DifferentOrder> orderList;

	public Person(){
		
	}

	
	public Set<Address> getAddressList() {
		return addressList;
	}


	public void setAddressList(Set<Address> addressList) {
		this.addressList = addressList;
	}


	public String getPersonType() {
		return personType;
	}


	public void setPersonType(String personType) {
		this.personType = personType;
	}


	public Set<Card> getCardList() {
		return cardList;
	}


	public void setCardList(Set<Card> cardList) {
		this.cardList = cardList;
	}

	
	public Set<DifferentOrder> getOrderList() {
		return orderList;
	}


	public void setOrderList(Set<DifferentOrder> orderList) {
		this.orderList = orderList;
	}

	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getCreditpoints() {
		return creditpoints;
	}


	public void setCreditpoints(String creditpoints) {
		this.creditpoints = creditpoints;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public int getPersonId() {
		return personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	public int getPersonAge() {
		return personAge;
	}

	public void setPersonAge(int personAge) {
		this.personAge = personAge;
	}

	public String getPersonFName() {
		return personFName;
	}

	public void setPersonFName(String personFName) {
		this.personFName = personFName;
	}

	public String getPersonLName() {
		return personLName;
	}

	public void setPersonLName(String personLName) {
		this.personLName = personLName;
	}

	public String getPersonGender() {
		return personGender;
	}

	public void setPersonGender(String personGender) {
		this.personGender = personGender;
	}
	
}
