package com.aaa.project.domain;

import java.util.List;

import com.aaa.project.domain.Reply;
import com.aaa.project.domain.ReplyPageDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private int replyCnt;
	private List<Reply> list;
}
