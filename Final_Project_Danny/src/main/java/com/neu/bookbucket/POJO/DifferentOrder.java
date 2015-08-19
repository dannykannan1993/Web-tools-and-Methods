package com.neu.bookbucket.POJO;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="differentorder")
public class DifferentOrder implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    @Column(name="orderId")
	private int orderId;
	
	@Column(name="orderType")
	private String orderType;
	
	@Column(name="orderDate")
	private Date orderDate;
	
	@Column(name="orderStatus")
	private String orderStatus;
	
	@Column(name="orderAmount")
	private Float orderAmount;
	
	@ManyToOne(fetch=FetchType.EAGER)  
    @JoinColumn(name="orderPersonId")
    private Person person;
	
	@OneToMany(mappedBy="orderNo")
	private Set<OrderItem> orderitemList;
	
	public DifferentOrder(){
		
	}

	public int getOrderId() {
		return orderId;
	}
	
	

	public Set<OrderItem> getOrderitemList() {
		return orderitemList;
	}

	public void setOrderitemList(Set<OrderItem> orderitemList) {
		this.orderitemList = orderitemList;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Float getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(Float orderAmount) {
		this.orderAmount = orderAmount;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
	
	
}
