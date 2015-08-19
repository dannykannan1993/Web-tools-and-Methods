package com.neu.bookbucket.POJO;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="address")
public class Address {

	@Id
    @GeneratedValue
    @Column(name="addressId")
	private int addressId;
	
	@Column(name="streetName")
	private String streetName;
	 
	@Column(name="city")
	private String city;
	 
	@Column(name="state")
	private String state;
	 
	@Column(name="zipcode")
	private int zipcode;
	
	@Column(name="addressLine2")
	private String addressLine2;
	
	@ManyToOne
    @JoinColumn(name="personId")
    private Person person;
	
	
	/*
	@OneToOne(mappedBy="address")
    private StoreList storeList;
	
	@OneToOne(mappedBy="address")
    private Distributor distributor;*/
	
	public Address(){
		
	}

/*	public StoreList getStoreList() {
		return storeList;
	}


	public void setStoreList(StoreList storeList) {
		this.storeList = storeList;
	}*/



	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	


	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public int getZipcode() {
		return zipcode;
	}


	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}


	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
