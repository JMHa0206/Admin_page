package com.kedu.dto;

public class WorkDisplayDTO {
	private Integer empCodeId;
    private String employeeName;
    private String standardCheckIn;     // '09:00' 같은 문자열
    private String standardCheckOut;
    private int gracePeriodIn;
    private int gracePeriodOut;
    private String isActive;
    
    public WorkDisplayDTO() {}
    
	public WorkDisplayDTO(Integer empCodeId, String employeeName, String standardCheckIn, String standardCheckOut,
			int gracePeriodIn, int gracePeriodOut, String isActive) {
		super();
		this.empCodeId = empCodeId;
		this.employeeName = employeeName;
		this.standardCheckIn = standardCheckIn;
		this.standardCheckOut = standardCheckOut;
		this.gracePeriodIn = gracePeriodIn;
		this.gracePeriodOut = gracePeriodOut;
		this.isActive = isActive;
	}
	
	public Integer getEmpCodeId() {
		return empCodeId;
	}
	public void setEmpCodeId(Integer empCodeId) {
		this.empCodeId = empCodeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getStandardCheckIn() {
		return standardCheckIn;
	}
	public void setStandardCheckIn(String standardCheckIn) {
		this.standardCheckIn = standardCheckIn;
	}
	public String getStandardCheckOut() {
		return standardCheckOut;
	}
	public void setStandardCheckOut(String standardCheckOut) {
		this.standardCheckOut = standardCheckOut;
	}
	public int getGracePeriodIn() {
		return gracePeriodIn;
	}
	public void setGracePeriodIn(int gracePeriodIn) {
		this.gracePeriodIn = gracePeriodIn;
	}
	public int getGracePeriodOut() {
		return gracePeriodOut;
	}
	public void setGracePeriodOut(int gracePeriodOut) {
		this.gracePeriodOut = gracePeriodOut;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
}
