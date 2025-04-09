package com.kedu.dto;

import java.time.LocalDate;
//조휘영
public class Employee_AnnualDTO {
	private int annualLeaveId; // 연차 기록 고유 ID
	private int employeeId; // 직원 고유 ID
	private int year; // 해당 연도
	private int totalLeaveDays; // 총 연차 일수
	private int usedLeaveDays; // 사용된 연차 일수
	private int remainingLeaveDays; // 남은 연차 일수
	private LocalDate leaveExpiryDate; // 연차 만료일 (LocalDate로 날짜만 저장)
	
	public Employee_AnnualDTO() {}
	
	public Employee_AnnualDTO(int annualLeaveId, int employeeId, int year, int totalLeaveDays, int usedLeaveDays,
			int remainingLeaveDays, LocalDate leaveExpiryDate) {
		super();
		this.annualLeaveId = annualLeaveId;
		this.employeeId = employeeId;
		this.year = year;
		this.totalLeaveDays = totalLeaveDays;
		this.usedLeaveDays = usedLeaveDays;
		this.remainingLeaveDays = remainingLeaveDays;
		this.leaveExpiryDate = leaveExpiryDate;
	}
	
	public int getAnnualLeaveId() {
		return annualLeaveId;
	}
	public void setAnnualLeaveId(int annualLeaveId) {
		this.annualLeaveId = annualLeaveId;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getTotalLeaveDays() {
		return totalLeaveDays;
	}
	public void setTotalLeaveDays(int totalLeaveDays) {
		this.totalLeaveDays = totalLeaveDays;
	}
	public int getUsedLeaveDays() {
		return usedLeaveDays;
	}
	public void setUsedLeaveDays(int usedLeaveDays) {
		this.usedLeaveDays = usedLeaveDays;
	}
	public int getRemainingLeaveDays() {
		return remainingLeaveDays;
	}
	public void setRemainingLeaveDays(int remainingLeaveDays) {
		this.remainingLeaveDays = remainingLeaveDays;
	}
	public LocalDate getLeaveExpiryDate() {
		return leaveExpiryDate;
	}
	public void setLeaveExpiryDate(LocalDate leaveExpiryDate) {
		this.leaveExpiryDate = leaveExpiryDate;
	}
}
