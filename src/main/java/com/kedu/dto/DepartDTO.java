package com.kedu.dto;

public class DepartDTO {
	private Integer dept_id;
	private String dept_name;
	private Integer dept_manager; //updated
	private String emp_name;
	
	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public DepartDTO(Integer dept_id, String dept_name, Integer dept_manager, String emp_name) {
		super();
		this.dept_id = dept_id;
		this.dept_name = dept_name;
		this.dept_manager = dept_manager;
		this.emp_name = emp_name;
	}

	public DepartDTO()  {
	
	}
	
	public Integer getDept_manager() {
		return dept_manager;
	}
	public void setDept_manager(Integer dept_manager) {
		this.dept_manager = dept_manager;
	}
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public DepartDTO(String dept_name) {
		super();
		this.dept_name = dept_name;
	}
	public DepartDTO(Integer dept_id, String dept_name, Integer dept_manager) {
		super();
		this.dept_id = dept_id;
		this.dept_name = dept_name;
		this.dept_manager = dept_manager;
	}
	public DepartDTO(Integer dept_id, String dept_name) {
		super();
		this.dept_id = dept_id;
		this.dept_name = dept_name;
	}

	
}
