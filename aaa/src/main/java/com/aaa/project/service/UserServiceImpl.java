package com.aaa.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.aaa.project.domain.Member;
import com.aaa.project.domain.Owner;
import com.aaa.project.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Service
@AllArgsConstructor //모든 필드를 가진 생성자를 작성하여 객체 생성
public class UserServiceImpl implements UserService {
	
	PasswordEncoder passwordEncoder;
	
	UserMapper uMapper;
	
	@Override
	public Object login_chk(String id, String pw) {
		// TODO Auto-generated method stub
		log.info("login_chk........" + id + pw);
		
		Member m = new Member();
		Owner o = new Owner();
		
		if( (m = uMapper.login_chk_member(id)) == null) {
			
			if( ( o = uMapper.login_chk_owner(id)) == null) {
				log.info("로그인 실패");
				return null;
			} else {
				
				if(passwordEncoder.matches(pw, o.getPw())) {
					
					log.info("관계자님 어서오세요 : " + o);
					return o;
				} else {
					log.info("비밀번호 다름");
					return null;
				}
			}
		}	else {
			
			if(passwordEncoder.matches(pw, m.getPw())) {
				log.info("사용자님 어서오세요 : " + m);
				return m;
			} else {
				log.info("비밀번호 다름");
				return null;
			}
		}	
	}

	@Override
	public boolean chk_id(String id) {
		// TODO Auto-generated method stub
		
		String chk = "";
		
		chk = uMapper.chk_id(id);
		
		if(id.equals(chk)) {
			log.info("불가");
			return false;
		}
		else {
			log.info("가능");
			return true;
		}
		
	}
	
	@Override
	public boolean chk_nic(String nic) {
		// TODO Auto-generated method stub
		
		String chk = "";
		
		chk = uMapper.chk_nic(nic);
		
		if(nic.equals(chk)) {
			log.info("불가");
			return false;
		}
		else {
			log.info("가능");
			return true;
		}
		
	}

	@Override
	public void register(Object obj) {
		// TODO Auto-generated method stub
		if(obj.getClass().getName() == "com.aaa.project.domain.Member") {
			uMapper.insert_member((Member)obj);
		} else if(obj.getClass().getName() == "com.aaa.project.domain.Owner") {
			uMapper.insert_owner((Owner)obj);
		}
	}
	
	  @Override
	   public void logout(HttpSession session) {
	      // TODO Auto-generated method stub
	      session.invalidate();
	   }

}
