package com.kedu.dto;

import java.sql.Time;
// ���ֿ�
public class WorkingHoursDTO {
		private int WorkingHoursid;  // ���� ��/��� ���� ID
	    private Integer deptId;              // �μ� ID (nullable)
	    private Integer empCodeId;           // ��� ID (nullable)
	    private Time standardCheckIn;        // ���� ��� �ð�
	    private Time standardCheckOut;       // ���� ��� �ð�
	    private int gracePeriodIn = 0;       // ��� �� �׷��̽� �Ⱓ (�⺻�� 0)
	    private int gracePeriodOut = 0;      // ��� �� �׷��̽� �Ⱓ (�⺻�� 0)
	    private String isActive = "Y";       // �� ������ Ȱ��ȭ�� �������� (�⺻�� 'Y')

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
