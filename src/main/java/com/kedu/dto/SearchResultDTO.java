package com.kedu.dto;

public class SearchResultDTO {
	private int emp_code_id;      // ��� ID
    private String emp_name;      // ��� �̸�
    private String dept_name;     // �μ���
    private String job_name;      // ���޸�
    private String emp_email;     // �̸���

    public SearchResultDTO() {}

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

    public String getJob_name() {
        return job_name;
    }

    public void setJob_name(String job_name) {
        this.job_name = job_name;
    }

    public String getEmp_email() {
        return emp_email;
    }

    public void setEmp_email(String emp_email) {
        this.emp_email = emp_email;
    }

}
