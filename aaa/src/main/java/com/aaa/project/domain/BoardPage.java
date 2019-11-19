package com.aaa.project.domain;

import com.aaa.project.domain.Criteria;

import lombok.Data;

@Data
public class BoardPage {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public BoardPage(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;		
		
		// block
		this.endPage = (int) (Math.ceil((cri.getPageNum()*1.0) / cri.getAmount())) * cri.getAmount();//현재블록에서 몇번이 마지막 게시글 번호인지
		this.startPage = this.endPage - (cri.getAmount() -1);
		
		// page
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		// page
		if(realEnd < this.endPage)	this.endPage = realEnd;		
		
		// block
		this.prev = this.startPage > 1; //부등식에 따라 true | false가 들어감(next도 마찬가지)
		this.next = this.endPage < realEnd;

	}

}
