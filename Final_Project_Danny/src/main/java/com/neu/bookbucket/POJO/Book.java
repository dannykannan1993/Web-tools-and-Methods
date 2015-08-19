package com.neu.bookbucket.POJO;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
/*@Cacheable
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE, region="MyUser")*/

@Table(name="book")
public class Book implements Serializable{

	@Id
    @GeneratedValue
    @Column(name="productId")
	private int productId;

	@Column(name="productName")
	private  String productName;

	@Column(name="productCategory")
	private String productCategory;
	
	@Column(name="productType")
	private String productType;
	
	@Column(name="producCost")
	private Float productCost;
	
	@Column(name="author")
	private String author;
	
	@Column(name="edition")
	private String edition;
	
	@Column(name="active")
	private int active;
	
	@OneToOne(mappedBy="book")
    private InventoryItem inventoryItem;
	/*
	@OneToOne(mappedBy="book")
    private OrderItem orderItem;*/
	
	@OneToMany(mappedBy="book")
	private Set<OrderItem> orderitemList;
	
	public Book(){
		
	}

	
	public InventoryItem getInventoryItem() {
		return inventoryItem;
	}



	public void setInventoryItem(InventoryItem inventoryItem) {
		this.inventoryItem = inventoryItem;
	}



	/*public OrderItem getOrderItem() {
		return orderItem;
	}



	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
*/

	

	public String getEdition() {
		return edition;
	}


	public Set<OrderItem> getOrderitemList() {
		return orderitemList;
	}

	public void setOrderitemList(Set<OrderItem> orderitemList) {
		this.orderitemList = orderitemList;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}


	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public Float getProductCost() {
		return productCost;
	}

	public void setProductCost(Float productCost) {
		this.productCost = productCost;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	
}
