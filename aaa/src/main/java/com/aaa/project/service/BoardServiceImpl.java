package com.aaa.project.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.aaa.project.domain.Board;
import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Tag;
import com.aaa.project.mapper.BoardMapper;
import com.aaa.project.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Service
@AllArgsConstructor //모든 필드를 가진 생성자를 작성하여 객체 생성
public class BoardServiceImpl implements BoardService {
	
	BoardMapper bMapper;
	
	@Override
	public List<Board> getList(Criteria cri) {
		log.info("board getList...............");
		return bMapper.getList(cri);
	}

	@Override
	public void register(Board board) {
		// TODO Auto-generated method stub
		log.info("board register............." + board);
		bMapper.insert(board);
	}

	@Override
	public List<Tag> getTagList() {
		// TODO Auto-generated method stub
		log.info("board getTagList............");
		return bMapper.getTagList();
	}

	@Override
	public List<Board> getMainList() {
		// TODO Auto-generated method stub
		log.info("board getMainList............");

		return bMapper.getMainList();
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("cccccccccccccccc" + cri.getTypeArr());
		return bMapper.getTotalCount(cri);
	}

	@Override
	public Board getBoard(int bno) {
		// TODO Auto-generated method stub
		return bMapper.getBoard(bno);
	}
	
	@Override
	public List<Board> getMyBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("aaaaaaaaaaaaaaaaaa: "+cri);
		return bMapper.getMyBoardList(cri);
	}

	@Override
	public int getMyTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return bMapper.getMyTotalCount(cri);
	}

	@Override
	public void modify(Board board) {
		// TODO Auto-generated method stub
		log.info("@@@@@@@@@@@@@@@ board modify : " + board);
		bMapper.update(board);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		log.info("@@@@@@@@@@@@@@@ board delete : " + bno);
		bMapper.delete(bno);
	}
	
	@Override
	   public void updateHit(int bno) {
	      // TODO Auto-generated method stub
	      bMapper.updateHit(bno);
	   }

}
