package com.aaa.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aaa.project.domain.Board;
import com.aaa.project.domain.BoardPage;
import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Member;
import com.aaa.project.domain.Reply;
import com.aaa.project.domain.Tag;
import com.aaa.project.service.BoardService;
import com.aaa.project.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/")
@AllArgsConstructor
public class BoardController {
	BoardService bService;
	ReplyService rService;
	
	@GetMapping("/write")
	public String registerForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		List<Tag> tags = bService.getTagList();
		model.addAttribute("tags", tags);
		model.addAttribute("info", member);
		
		return "board/write";

	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request, int tagno, String title, String content, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		log.info("controller write................" + tagno + title + content);
		Board board = new Board();
		board.setTagno(tagno);
		board.setTitle(title);
		board.setContent(content);
		board.setMno(member.getMno());
		bService.register(board);
		model.addAttribute("info", member);
		
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public String list(HttpServletRequest request, Criteria cri, Model model) {		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		log.info("~~~~~~~~~~~~~~~~~list : "+cri);
		log.info("~~~~~~~~~~~~~~~~~listCount : " + bService.getTotalCount(cri));
		List<Tag> tags = bService.getTagList();
		List<Board> list = bService.getList(cri);
		model.addAttribute("tags", tags);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new BoardPage(cri, bService.getTotalCount(cri)));
		model.addAttribute("info", member);
		
		return "board/list";
	}
	
	@GetMapping("/get")
	public String get(HttpServletRequest request, Criteria cri, Model model, int bno) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		bService.updateHit(bno);
		Board board = bService.getBoard(bno);
		model.addAttribute("bno", bno);		
		model.addAttribute("board", board);	
		model.addAttribute("info", member);
		model.addAttribute("pageMaker",  new BoardPage(cri, bService.getTotalCount(cri)));
		
		return "board/get";
		
	}
	
	@GetMapping("/update")
	public String updateForm(HttpServletRequest request, Criteria cri, Model model, int bno) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		log.info("controller write................" + bno);
		
		Board board = bService.getBoard(bno);
		List<Tag> tags = bService.getTagList(); 
		model.addAttribute("board", board);
		model.addAttribute("tags", tags);
		model.addAttribute("info", member);
		
		return "board/update";
	}
	
	@PostMapping("/update")
	public String update(HttpServletRequest request, Board board, Criteria cri, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		board.setMno(member.getMno());
		bService.modify(board);
		model.addAttribute("info", member);
		
		return "redirect:get?bno="+board.getBno();
	}
	
	@GetMapping("/delete")
	public String delete(HttpServletRequest request, int bno, Model model) {
		bService.delete(bno);
		return "redirect:list";
	}
	
}
