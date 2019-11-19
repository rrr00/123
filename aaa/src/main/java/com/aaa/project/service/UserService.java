package com.aaa.project.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

public interface UserService {
	public Object login_chk(@Param("id") String id,@Param("pw") String pw);
	
	public boolean chk_id(@Param("id") String id);
	public boolean chk_nic(@Param("nic") String nic);
	
	public void register(Object obj);
	public void logout(HttpSession session);
}
