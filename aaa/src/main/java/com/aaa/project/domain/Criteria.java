package com.aaa.project.domain;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;
	
	private String tagno;
	private String type;
	private String keyword;
	
	private int mno;
	private int bno;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
	public String[] getTagArr() {
		return tagno == null? new String[] {} : tagno.split("");
	}
}
