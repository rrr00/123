package com.aaa.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aaa.project.domain.Comfort;
import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Ground;
import com.aaa.project.domain.Image;
import com.aaa.project.domain.Reservation;
import com.aaa.project.domain.Review;
import com.aaa.project.domain.Time;
import com.aaa.project.mapper.GroundMapper;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Service
@AllArgsConstructor // 모든 필드
public class GroundServiceImpl implements GroundService {

	GroundMapper gMapper;

	@Override
	public List<Time> getTime() {
		// TODO Auto-generated method stub
		return gMapper.getTime();
	}

	@Override
	public List<Comfort> getComf() {
		// TODO Auto-generated method stub
		return gMapper.getComf();
	}

	@Override
	public List<Ground> getGround(Ground ground) {
		// TODO Auto-generated method stub
		return gMapper.getGround(ground);
	}

	@Override
	public List<Reservation> getRes() {
		// TODO Auto-generated method stub
		return gMapper.getRes();
	}

	@Override
	public List<Ground> getTimeResGno() {
		// TODO Auto-generated method stub
		return gMapper.getTimeResGno();
	}

	@Override
	public Ground getGinfo(int gno) {
		// TODO Auto-generated method stub
		return gMapper.getGinfo(gno);
	}

	@Override
	public List<Review> getReview(int gno) {
		// TODO Auto-generated method stub
		return gMapper.getReview(gno);
	}

	@Override
	public String getComfortname(int cno) {
		// TODO Auto-generated method stub
		return gMapper.getComfortname(cno);
	}

	@Override
	public List<Time> chkRevTime(int gno) {
		// TODO Auto-generated method stub
		return gMapper.chkRevTime(gno);
	}

	@Override
	public void revInsert(Reservation rev) {
		// TODO Auto-generated method stub
		gMapper.revInsert(rev);
	}

	@Override
	public Reservation revRead(int rno) {
		// TODO Auto-generated method stub
		return gMapper.revRead(rno);
	}
	
	  
   @Override
   public List<Reservation> getMyReservation(Reservation res) {
      // TODO Auto-generated method stub
      return gMapper.getMyReservation(res);
   }

   @Override
   public void upResChk(Reservation res) {
      // TODO Auto-generated method stub
      gMapper.upResChk(res);
   }

	@Override
	public void comfortInsert(Comfort comfort) {
		// TODO Auto-generated method stub
		gMapper.comfortInsert(comfort);
	}

	@Override
	public void groundInsert(Ground ground) {
		// TODO Auto-generated method stub
		gMapper.groundInsert(ground);
	}

	@Override
	public void imageInsert(Image image) {
		// TODO Auto-generated method stub
		gMapper.imageInsert(image);
	}
}
