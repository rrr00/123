package com.aaa.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
   int viewno;
   String view_text;
   Date view_date;
   int gno;
   int mno;
   String nic;
}