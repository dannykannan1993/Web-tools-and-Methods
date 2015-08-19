package com.neu.bookbucket.POJO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="storelist")
public class StoreList {

	@Id
    @Column(name="storeId")
    @GeneratedValue
    private int storeId;
	
	@Column(name="storeName")
	private String storeName;
	
	@Column(name="longitude")
	private Double longitude;
	
	@Column(name="latitude")
	private Double latitude;
	
	/*@OneToOne
    @PrimaryKeyJoinColumn
    private Address address;*/
	
	public StoreList(){
		
	}

	
	/*public Address getAddress() {
		return address;
	}


	public void setAddress(Address address) {
		this.address = address;
	}*/

	
	
	public int getStoreId() {
		return storeId;
	}


	public Double getLongitude() {
		return longitude;
	}


	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}


	public Double getLatitude() {
		return latitude;
	}


	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}


	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}


	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	
}
