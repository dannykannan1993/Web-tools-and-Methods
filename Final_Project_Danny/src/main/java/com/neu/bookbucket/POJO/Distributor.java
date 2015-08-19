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
@Table(name="distributor")
public class Distributor {

	@Id
    @GeneratedValue
    @Column(name="distributorId")
    private int distributorId;
	
	@Column(name="distributorName")
	private String distributorName;
	
	/*@OneToOne
    @PrimaryKeyJoinColumn
    private Address address;*/

	public Distributor(){
		
	}

	
	public int getDistributorId() {
		return distributorId;
	}


	public void setDistributorId(int distributorId) {
		this.distributorId = distributorId;
	}


	/*public Address getAddress() {
		return address;
	}


	public void setAddress(Address address) {
		this.address = address;
	}
*/
	public String getDistributorName() {
		return distributorName;
	}

	public void setDistributorName(String distributorName) {
		this.distributorName = distributorName;
	}
	
	
}