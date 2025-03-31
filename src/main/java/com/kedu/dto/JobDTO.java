package com.kedu.dto;

public class JobDTO {
	private int job_id;
	private String job_name;
	
	public JobDTO() {};
	
	public JobDTO(int job_id, String job_name) {
		super();
		this.job_id = job_id;
		this.job_name = job_name;
	}
	public int getJob_id() {
		return job_id;
	}
	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	
}
