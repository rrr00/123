package com.aaa.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	int bno;
	String title;
	String content;
	Date	bdate;
	int hit;
	int tagno;
	int mno;
	String nic;
	String tagname;
	int replycnt;
}
