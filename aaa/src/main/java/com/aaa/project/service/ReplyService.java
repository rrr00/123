package com.aaa.project.service;

import java.util.List;

import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Reply;
import com.aaa.project.domain.ReplyPageDTO;

public interface ReplyService {
	public int register(Reply vo);
	public Reply get(long rno);
	public int modify(Reply vo);
	public int remove(long rno);
	public List<Reply> getList(Criteria cri, Long bno);
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	public List<Reply> getMyReplyList(Criteria cri);

}
