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
		this.endPage = (int) (Math.ceil((cri.getPageNum()*1.0) / cri.getAmount())) * cri.getAmount();//�����Ͽ��� ����� ������ �Խñ� ��ȣ����
		this.startPage = this.endPage - (cri.getAmount() -1);
		
		// page
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		// page
		if(realEnd < this.endPage)	this.endPage = realEnd;		
		
		// block
		this.prev = this.startPage > 1; //�ε�Ŀ� ���� true | false�� ��(next�� ��������)
		this.next = this.endPage < realEnd;

	}

}
