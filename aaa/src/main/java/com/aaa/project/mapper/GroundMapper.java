package com.aaa.project.mapper;

import java.util.List;

import com.aaa.project.domain.Comfort;
import com.aaa.project.domain.Ground;
import com.aaa.project.domain.Image;
import com.aaa.project.domain.Reservation;
import com.aaa.project.domain.Review;
import com.aaa.project.domain.Time;

public interface GroundMapper {
	public List<Comfort> getComf();

	public List<Time> getTime();

	public List<Ground> getGround(Ground ground);

	public List<Reservation> getRes();

	public List<Ground> getTimeResGno();

	public Ground getGinfo(int gno);

	public List<Review> getReview(int gno);

	public String getComfortname(int cno);

	public List<Time> chkRevTime(int gno);

	public void revInsert(Reservation rev);

	public Reservation revRead(int rno);

	public List<Reservation> getMyReservation(Reservation res);

	public void upResChk(Reservation res);
	
	public void comfortInsert(Comfort comfort);
	
	public void groundInsert(Ground ground);
	
	public void imageInsert(Image image);

}
