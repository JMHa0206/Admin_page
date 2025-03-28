package com.kedu.dto;

import java.sql.Timestamp;

public class WorkDTO {
    private int id;
    private Timestamp standard_check_in;
    private Timestamp standard_check_out;
    private int updated_by;
    private Timestamp updated_at;
    
	public WorkDTO() {
		super();
	}
	public WorkDTO(int id, Timestamp standard_check_in, Timestamp standard_check_out, int updated_by,
			Timestamp updated_at) {
		super();
		this.id = id;
		this.standard_check_in = standard_check_in;
		this.standard_check_out = standard_check_out;
		this.updated_by = updated_by;
		this.updated_at = updated_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getStandard_check_in() {
		return standard_check_in;
	}
	public void setStandard_check_in(Timestamp standard_check_in) {
		this.standard_check_in = standard_check_in;
	}
	public Timestamp getStandard_check_out() {
		return standard_check_out;
	}
	public void setStandard_check_out(Timestamp standard_check_out) {
		this.standard_check_out = standard_check_out;
	}
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}

    // getter/setter 생략 (네가 만든 그대로 유지)
}
