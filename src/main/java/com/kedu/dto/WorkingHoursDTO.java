package com.kedu.dto;

import java.sql.Time;
// 조휘영
public class WorkingHoursDTO {
		private int WorkingHoursid;  // 정시 출/퇴근 기준 ID
	    private Integer deptId;              // 부서 ID (nullable)
	    private Integer empCodeId;           // 사원 ID (nullable)
	    private Time standardCheckIn;        // 정시 출근 시간
	    private Time standardCheckOut;       // 정시 퇴근 시간
	    private int gracePeriodIn = 0;       // 출근 시 그레이스 기간 (기본값 0)
	    private int gracePeriodOut = 0;      // 퇴근 시 그레이스 기간 (기본값 0)
	    private String isActive = "Y";       // 이 기준이 활성화된 상태인지 (기본값 'Y')

	    public WorkingHoursDTO() {}

		public WorkingHoursDTO(int workingHoursid, Integer deptId, Integer empCodeId, Time standardCheckIn,
				Time standardCheckOut, int gracePeriodIn, int gracePeriodOut, String isActive) {
			super();
			WorkingHoursid = workingHoursid;
			this.deptId = deptId;
			this.empCodeId = empCodeId;
			this.standardCheckIn = standardCheckIn;
			this.standardCheckOut = standardCheckOut;
			this.gracePeriodIn = gracePeriodIn;
			this.gracePeriodOut = gracePeriodOut;
			this.isActive = isActive;
		}

		public int getWorkingHoursid() {
			return WorkingHoursid;
		}

		public void setWorkingHoursid(int workingHoursid) {
			WorkingHoursid = workingHoursid;
		}

		public Integer getDeptId() {
			return deptId;
		}

		public void setDeptId(Integer deptId) {
			this.deptId = deptId;
		}

		public Integer getEmpCodeId() {
			return empCodeId;
		}

		public void setEmpCodeId(Integer empCodeId) {
			this.empCodeId = empCodeId;
		}

		public Time getStandardCheckIn() {
			return standardCheckIn;
		}

		public void setStandardCheckIn(Time standardCheckIn) {
			this.standardCheckIn = standardCheckIn;
		}

		public Time getStandardCheckOut() {
			return standardCheckOut;
		}

		public void setStandardCheckOut(Time standardCheckOut) {
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
