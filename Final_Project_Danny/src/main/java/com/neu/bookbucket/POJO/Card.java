package com.neu.bookbucket.POJO;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="card")
public class Card {

	@Id
    @GeneratedValue
    @Column(name="cardNumber")
	private long cardNumber;
	
	@Column(name="holderName")
	private String holderName;
	
	@Column(name="expiryMonth")
	private int expiryMonth;
	
	@Column(name="expiryYear")
	private int expiryYear;
	
	@Column(name="cvc")
	private int cvc;
	
	@Column(name="cardType")
	private String cardType;

	@ManyToOne
    @JoinColumn(name="customerId")
    private Person person;
	
	public Card() {

	}
	
	public int getExpiryMonth() {
		return expiryMonth;
	}

	public void setExpiryMonth(int expiryMonth) {
		this.expiryMonth = expiryMonth;
	}

	public int getExpiryYear() {
		return expiryYear;
	}



	public void setExpiryYear(int expiryYear) {
		this.expiryYear = expiryYear;
	}



	public int getCvc() {
		return cvc;
	}



	public void setCvc(int cvc) {
		this.cvc = cvc;
	}



	public Person getPerson() {
		return person;
	}


	public void setPerson(Person person) {
		this.person = person;
	}

	public long getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(long cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getHolderName() {
		return holderName;
	}

	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

}
