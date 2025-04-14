package com.kedu.dto;

public class SearchConditionDTO {
	private String target;
    private String keyword;

    public SearchConditionDTO() {}
    

    public SearchConditionDTO(String target, String keyword) {
		super();
		this.target = target;
		this.keyword = keyword;
	}


	public String getTarget() { return target; }
    public void setTarget(String target) { this.target = target; }

    public String getKeyword() { return keyword; }
    public void setKeyword(String keyword) { this.keyword = keyword; }

}
