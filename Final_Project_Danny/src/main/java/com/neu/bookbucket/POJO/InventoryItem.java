package com.neu.bookbucket.POJO;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="inventoryitem")
public class InventoryItem implements Serializable{

	@Id
    @Column(name="inventoryId")
    @GeneratedValue
    private int productId;
	
	@Column(name="quantity")
	private int quantity;
	
	/*@Column(name="productinventoryId")
	private int productInventoryId;*/
	
	@OneToOne
    @JoinColumn(name = "productinventoryId")
    private Book book;
	    
	public InventoryItem(){
		
	}

	
	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	
	/*public int getProductInventoryId() {
		return productInventoryId;
	}


	public void setProductInventoryId(int productInventoryId) {
		this.productInventoryId = productInventoryId;
	}
*/

	public Book getBook() {
		return book;
	}


	public void setBook(Book book) {
		this.book = book;
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
