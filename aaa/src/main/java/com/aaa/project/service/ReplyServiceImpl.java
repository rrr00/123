package com.aaa.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Reply;
import com.aaa.project.domain.ReplyPageDTO;
import com.aaa.project.mapper.BoardMapper;
import com.aaa.project.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Service
@AllArgsConstructor //모든 필드
public class ReplyServiceImpl  implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper rmapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper bmapper;
	
	@Transactional
	@Override
	public int register(Reply vo) {
		// TODO Auto-generated method stub
		log.info("register......" + vo);
//		bmapper.updateReplyCnt(vo.getBno(), 1);
		return rmapper.insert(vo);
	}

	@Override
	public Reply get(long rno) {
		// TODO Auto-generated method stub
		log.info("get......" + rno);
		return rmapper.read(rno);
	}

	@Override
	public int modify(Reply vo) {
		// TODO Auto-generated method stub
		log.info("modify......" + vo);
		return rmapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(long rno) {
		// TODO Auto-generated method stub
		log.info("delete......" + rno);
		
		Reply vo = rmapper.read(rno);
//		bmapper.updateReplyCnt(vo.getBno(), -1);
		
		return rmapper.delete(rno);
	}

	@Override
	public List<Reply> getList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		log.info("getList......" + bno);
		return rmapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(rmapper.getCountByBno(bno), rmapper.getListWithPaging(cri, bno));
	}

	@Override
	public List<Reply> getMyReplyList(Criteria cri) {
		// TODO Auto-generated method stub
		return rmapper.getMyReplyList(cri);
	}

}
