package com.kedu.dto;

public class PermissionDTO {

	private int per_id;
	private String per_name;
	private String per_secure;
	private String per_function;
	
	public int getPer_id() {
		return per_id;
	}

	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}

	public String getPer_name() {
		return per_name;
	}

	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}

	public String getPer_secure() {
		return per_secure;
	}

	public void setPer_secure(String per_secure) {
		this.per_secure = per_secure;
	}

	public String getPer_function() {
		return per_function;
	}

	public void setPer_function(String per_function) {
		this.per_function = per_function;
	}

	public PermissionDTO() {
		super();
	}

	public PermissionDTO(int per_id, String per_name, String per_secure, String per_function) {
		super();
		this.per_id = per_id;
		this.per_name = per_name;
		this.per_secure = per_secure;
		this.per_function = per_function;
	}
}
