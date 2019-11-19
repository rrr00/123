package com.aaa.project.service;

import java.util.List;

import com.aaa.project.domain.Board;
import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Tag;

public interface BoardService {
	public List<Board> getList(Criteria cri);
	public List<Board> getMainList();
	public int getTotalCount(Criteria cri);
	public void register(Board board);
	public List<Tag> getTagList();
	public Board getBoard(int bno);
	public List<Board> getMyBoardList(Criteria cri);
	public int getMyTotalCount(Criteria cri);	
	public void modify(Board board);
	public void delete(int bno);
	public void updateHit(int bno);
}
