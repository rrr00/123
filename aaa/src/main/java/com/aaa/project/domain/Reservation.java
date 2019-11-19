package com.aaa.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
	int rno;
	int mno;
	int ono;
	int rstime;
	int retime;
	int gno;
	String rdate;
	int rcheck;
	String gname;
	String gaddr;
	String mname;
	String rstime_arr;
	int money;
	int ttime;
}
