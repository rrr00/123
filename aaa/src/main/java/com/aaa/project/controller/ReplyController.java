package com.aaa.project.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Reply;
import com.aaa.project.domain.ReplyPageDTO;
import com.aaa.project.service.ReplyService;


import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@RequestMapping("/replies")
@RestController
@Log
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody Reply vo){
		
		log.info("Reply : " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply INSERT COUNT : " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
											: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value="/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") long bno){
		log.info("getList..................................");
		Criteria cri = new Criteria(page, 10);
		log.info("get Reply List bno : " + bno);
		log.info("cri : " + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Reply> get(@PathVariable("rno") Long rno){
		log.info("get: " + rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") long rno){
		log.info("remove : " + rno);
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody Reply vo, @PathVariable("rno") int rno){
		vo.setReno(rno);
		log.info("rno : " + rno);
		log.info("modify : " + vo);
		return service.modify(vo) == 1 
				? new ResponseEntity<>("Success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}