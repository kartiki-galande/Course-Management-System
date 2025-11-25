package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PaymentInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String orderId; // Razorpay order ID
	private String paymentId; // Razorpay payment ID
	private String status; // Created / Paid / Failed
	private double amount; // payment amount
	private String email; // customer email
	public PaymentInfo() {
		super();
	}
	public PaymentInfo(int id, String orderId, String paymentId, String status, double amount, String email) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.paymentId = paymentId;
		this.status = status;
		this.amount = amount;
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "PaymentInfo [id=" + id + ", orderId=" + orderId + ", paymentId=" + paymentId + ", status=" + status
				+ ", amount=" + amount + ", email=" + email + "]";
	}
	
}
