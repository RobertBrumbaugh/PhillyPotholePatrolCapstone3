package com.techelevator.model;

import java.util.Date;

public class Report {
	
	// data members

	private int report_id;
	private int user_id;
	private int location_id;
	private Date reported;
	private Date inspected;
	private Date repaired;
	private int status;
	private int severity;
	private String img;
	
	
	// Getters and Setters
	
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public Date getReported() {
		return reported;
	}
	public void setReported(Date reported) {
		this.reported = reported;
	}
	public Date getInspected() {
		return inspected;
	}
	public void setInspected(Date inspected) {
		this.inspected = inspected;
	}
	public Date getRepaired() {
		return repaired;
	}
	public void setRepaired(Date repaired) {
		this.repaired = repaired;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getSeverity() {
		return severity;
	}
	public void setSeverity(int severity) {
		this.severity = severity;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
