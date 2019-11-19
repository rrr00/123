package com.aaa.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Reply;

public interface ReplyMapper {

	public int insert(Reply vo);
	public Reply read(Long rno);
	public int delete(Long rno);
	public int update(Reply reply);
	public List<Reply> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public int getCountByBno(Long bno);
	public List<Reply> getMyReplyList(Criteria cri);
}
