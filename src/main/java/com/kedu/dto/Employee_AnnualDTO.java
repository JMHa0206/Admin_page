package com.kedu.dto;

import java.time.LocalDate;
//���ֿ�
public class Employee_AnnualDTO {
	private int annualLeaveId; // ���� ��� ���� ID
	private int employeeId; // ���� ���� ID
	private int year; // �ش� ����
	private int totalLeaveDays; // �� ���� �ϼ�
	private int usedLeaveDays; // ���� ���� �ϼ�
	private int remainingLeaveDays; // ���� ���� �ϼ�
	private LocalDate leaveExpiryDate; // ���� ������ (LocalDate�� ��¥�� ����)
	
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
