package com.aaa.project.domain;

import java.util.List;
import lombok.Data;

@Data
public class Ground {
	int gno;
	int type;
	String gname;
	String gaddr;
	String cno_arr;
	int money;
	int gstime;
	int getime;
	int rstime;
	int retime;
	String text;
	int ono;
	List<Image> fileList;
}
