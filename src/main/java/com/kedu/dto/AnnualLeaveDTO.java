package com.kedu.dto;

public class AnnualLeaveDTO {
	private int rule_id;
	private int years_of_service;
	private int leave_days;
	
	public AnnualLeaveDTO() {}
	
	public AnnualLeaveDTO(int rule_id, int years_of_service, int leave_days) {
		super();
		this.rule_id = rule_id;
		this.years_of_service = years_of_service;
		this.leave_days = leave_days;
	}
	
	public int getRule_id() {
		return rule_id;
	}
	public void setRule_id(int rule_id) {
		this.rule_id = rule_id;
	}
	public int getYears_of_service() {
		return years_of_service;
	}
	public void setYears_of_service(int years_of_service) {
		this.years_of_service = years_of_service;
	}
	public int getLeave_days() {
		return leave_days;
	}
	public void setLeave_days(int leave_days) {
		this.leave_days = leave_days;
	}

}
