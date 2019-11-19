package com.aaa.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	int reno;
	String recontent;
	Date redate;
	int bno;
	String title;
	String tagname;
	int mno;
	String nic;
}
