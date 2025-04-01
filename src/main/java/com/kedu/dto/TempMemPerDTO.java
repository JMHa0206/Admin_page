package com.kedu.dto;

public class TempMemPerDTO {

	private int emp_code_id; // 사원 코드 ID
	private String emp_name; // 사원 이름
	private String dept_name; // 부서 이름
	private String per_name; // 권한 이름
	public int getEmp_code_id() {
		return emp_code_id;
	}
	public void setEmp_code_id(int emp_code_id) {
		this.emp_code_id = emp_code_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getPer_name() {
		return per_name;
	}
	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}
	public TempMemPerDTO(int emp_code_id, String emp_name, String dept_name, String per_name) {
		super();
		this.emp_code_id = emp_code_id;
		this.emp_name = emp_name;
		this.dept_name = dept_name;
		this.per_name = per_name;
	}
	public TempMemPerDTO() {
		super();
	}
}
