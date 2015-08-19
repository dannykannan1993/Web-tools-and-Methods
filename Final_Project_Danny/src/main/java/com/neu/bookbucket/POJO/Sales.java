package com.neu.bookbucket.POJO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


	@Entity
	@Table(name="sales")
	public class Sales {

		@Id
	    @GeneratedValue
	    @Column(name="id")
		private int salesid;
		
		@Column(name="bookId")
		private int bookId;
		
		@Column(name="month")
		private int month;
		
		@Column(name="year")
		private int year;
		
		@Column(name="sales")
		private int sales;
		
		
		public Sales() {

		}


		public long getSalesid() {
			return salesid;
		}


		

		public int getMonth() {
			return month;
		}


		public int getBookId() {
			return bookId;
		}


		public void setBookId(int bookId) {
			this.bookId = bookId;
		}


		public void setSalesid(int salesid) {
			this.salesid = salesid;
		}


		public void setMonth(int month) {
			this.month = month;
		}


		public int getYear() {
			return year;
		}


		public void setYear(int year) {
			this.year = year;
		}


		public int getSales() {
			return sales;
		}


		public void setSales(int sales) {
			this.sales = sales;
		}
		
		
}
