package com.kedu.dto;

public class EDMSFormDTO {
    private Integer formId;
    private String formName;
    private String formContent;
    private String formType;
    private String createdAt;
    private String createdBy;
    
    
	public EDMSFormDTO() {
		super();
	}


	public int getFormId() {
		return formId;
	}


	public void setFormId(Integer formId) {
		this.formId = formId;
	}


	public String getFormName() {
		return formName;
	}


	public void setFormName(String formName) {
		this.formName = formName;
	}


	public String getFormContent() {
		return formContent;
	}


	public void setFormContent(String formContent) {
		this.formContent = formContent;
	}


	public String getFormType() {
		return formType;
	}


	public void setFormType(String formType) {
		this.formType = formType;
	}


	public String getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}


	public String getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}


	public EDMSFormDTO(Integer formId, String formName, String formContent, String formType, String createdAt,
			String createdBy) {
		super();
		this.formId = formId;
		this.formName = formName;
		this.formContent = formContent;
		this.formType = formType;
		this.createdAt = createdAt;
		this.createdBy = createdBy;
	}
    
    
}