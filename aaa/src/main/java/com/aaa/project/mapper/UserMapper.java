package com.aaa.project.mapper;

import org.apache.ibatis.annotations.Param;

import com.aaa.project.domain.Member;
import com.aaa.project.domain.Owner;

public interface UserMapper {
	public Member login_chk_member(@Param("id") String id);
	public Owner login_chk_owner(@Param("id") String id);
	
	public String chk_id(@Param("id") String id);
	public String chk_nic(@Param("nic") String nic);
	
	public void insert_member(Member member);
	public void insert_owner(Owner owner);
}
