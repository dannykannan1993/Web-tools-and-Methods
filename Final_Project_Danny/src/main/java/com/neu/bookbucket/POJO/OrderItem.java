package com.neu.bookbucket.POJO;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orderitem")
public class OrderItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "orderitemId")
	@GeneratedValue
	private int productId;

	@Column(name= "itemStatus")
	private String itemStatus;
	
	@Column(name = "quantity")
	private int quantity;

	@Column(name="tempCost")
	private float tempCost;
	
	/*@Column(name = "productId")
	private int productitemId;*/

	/*@Column(name= "orderId")
	private int orderId;
	
	@OneToOne
	@JoinColumn(name = "productId")
	private Book book;*/

	@ManyToOne
	@JoinColumn(name= "productId") 
	private Book book;
	
	@ManyToOne
	@JoinColumn(name= "orderId") 
	private DifferentOrder orderNo;
	 

	public OrderItem() {

	}

	
	/*public DifferentOrder getOrder() {
		return orderNo;
	}


	public void setOrder(DifferentOrder orderId) {
		this.orderNo = orderId;
	}
*/
	
	
	

	public Book getBook() {
		return book;
	}


	public float getTempCost() {
		return tempCost;
	}


	public void setTempCost(float tempCost) {
		this.tempCost = tempCost;
	}


	public void setBook(Book book) {
		this.book = book;
	}

	
	
	public String getItemStatus() {
		return itemStatus;
	}


	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}


	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	/*public int getProductitemId() {
		return productitemId;
	}

	public void setProductitemId(int productitemId) {
		this.productitemId = productitemId;
	}

	public int getOrderitemId() {
		return orderitemId;
	}

	public void setOrderitemId(int orderitemId) {
		this.orderitemId = orderitemId;
	}*/

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public DifferentOrder getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(DifferentOrder orderNo) {
		this.orderNo = orderNo;
	}

	

	/*public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}*/

	
}
