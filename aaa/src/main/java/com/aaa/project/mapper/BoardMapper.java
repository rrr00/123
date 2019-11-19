package com.aaa.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aaa.project.domain.Board;
import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Tag;

public interface BoardMapper {
	public List<Board> getList(Criteria cri); //page
	public List<Board> getMainList(); //main
	public int getTotalCount(Criteria cri);
	public void insert(Board board);
	public List<Tag> getTagList();
	public Board getBoard(int bno);
	public List<Board> getMyBoardList(Criteria cri);
	public int getMyTotalCount(Criteria cri);
	public int update(Board board);
	public int delete(int bno);
	public void updateHit(int bno);
}
