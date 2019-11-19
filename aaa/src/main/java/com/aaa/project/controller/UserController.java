package com.aaa.project.controller;


import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aaa.project.domain.Board;
import com.aaa.project.domain.BoardPage;
import com.aaa.project.domain.Comfort;
import com.aaa.project.domain.Criteria;
import com.aaa.project.domain.Ground;
import com.aaa.project.domain.Member;
import com.aaa.project.domain.Owner;
import com.aaa.project.domain.Reply;
import com.aaa.project.domain.Reservation;
import com.aaa.project.domain.Review;
import com.aaa.project.domain.Time;
import com.aaa.project.service.BoardService;
import com.aaa.project.service.GroundService;
import com.aaa.project.service.ReplyService;
import com.aaa.project.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/")
@AllArgsConstructor
public class UserController {
	
	@Inject
    PasswordEncoder passwordEncoder;
	
	UserService uService;
	BoardService bService;
	GroundService gService;
	ReplyService rService;
	
	@GetMapping("/login")
	public String login1() {
		return "login";
	}
	@GetMapping("/")
	public String login() {
		return "login";
	}
	
	
	@GetMapping("/Main")
	public String Main(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("info").getClass().getName().contentEquals("com.aaa.project.domain.Member")) {
			Member member = (Member) session.getAttribute("info");
			List<Board> list = bService.getMainList();
			model.addAttribute("info", member);
			model.addAttribute("list", list);
			return "member/MMain";
		}
		else {
			Owner owner = (Owner) session.getAttribute("info");
			model.addAttribute("info", owner);
			return "owner/OMain";
		}
	}
	
	@PostMapping("/Main")
	public ModelAndView login(String id, String pw, HttpServletRequest request ,ModelAndView mav) {
		log.info("loginController...............");
		
		HttpSession session = request.getSession();

		
		Object o = uService.login_chk(id, pw);
		
		if(o != null) {
			log.info(o.getClass().getName());
			if (o.getClass().getName().contentEquals("com.aaa.project.domain.Member")) {
				Member m = (Member)o;
				List<Board> list = bService.getMainList();
				log.info("info : " +m);
				session.setAttribute("info", m);
				mav.setViewName("member/MMain");
				mav.addObject("list", list);
				mav.addObject("info", m);
				return mav;
			}
			else if(o.getClass().getName().contentEquals("com.aaa.project.domain.Owner")) {
				Owner ow = (Owner)o;
				log.info("info : " +o);

				session.setAttribute("info", ow);
				mav.setViewName("owner/OMain");
				return mav;
			}
			mav.setViewName("redirect:login");
			mav.addObject("chk", "false");
			return mav;
		}
		else {
			mav.setViewName("redirect:login");
			mav.addObject("chk", "false");
			return mav;
		}
	}
	
	@GetMapping("/join")
	public void join() {}
		
	@PostMapping("/join")
	public ModelAndView joinProc(String id, String pw, String nam, Integer jbradio, String tel, 
			String email, String nic, String zipNo, String roadAddrPart1, String addrDetail, ModelAndView mav) {
		
		if(jbradio == 1) {
			log.info("joinProc...................." + jbradio);
			Member member = new Member();
			member.setId(id);
			String rpw = passwordEncoder.encode(pw);
			member.setPw(rpw);
			member.setMname(nam);
			member.setMtel(tel);
			member.setMemail(email);
			member.setNic(nic);
			log.info("joinProc...................." + member);
			uService.register(member);
		} else if(jbradio == 2) {
			log.info("joinProc...................." + jbradio);
			Owner owner = new Owner();
			owner.setId(id);
			String rpw = passwordEncoder.encode(pw);
			owner.setPw(rpw);
			owner.setOname(nam);
			owner.setOtel(tel);
			owner.setOemail(email);
			String addr = zipNo + " " + roadAddrPart1 + " " + addrDetail;
			owner.setAddr(addr);
			log.info("joinProc...................." + owner);
			uService.register(owner);
		} else {
			log.info("joinProc....................Error");
		}
		mav.setViewName("redirect:login");
		mav.addObject("chk", "true");
		return mav;
	}
	
	@PostMapping(value = "/idchk")
	public ResponseEntity<String> idchk(String id) {
		
		return uService.chk_id(id) ? new ResponseEntity<>("OK", HttpStatus.OK)
												: new ResponseEntity<>("NO", HttpStatus.OK);
	}
	
	@PostMapping(value = "/nicchk")
	public ResponseEntity<String> nicchk(String nic) {
		log.info("............................" + nic);
		return uService.chk_nic(nic) ? new ResponseEntity<>("OK", HttpStatus.OK)
												: new ResponseEntity<>("NO", HttpStatus.OK);
	}
	
	@GetMapping("/popup/jusoPopup")
	public void jusoPopup() {}
	
	@PostMapping("/popup/jusoPopup")
	public void jusoPopup1() {}

	@GetMapping("/gsearch")
	public String gsearchlist(Ground ground, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		List<Time> tlist = gService.getTime();
		List<Comfort> clist = gService.getComf();
		List<Ground> glist = gService.getGround(ground);
		List<Reservation> rlist = gService.getRes();
		
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + tlist);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + clist);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + glist);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + rlist);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + member);
		
		model.addAttribute("timelist", tlist);
		model.addAttribute("comflist", clist);
		model.addAttribute("groundlist", glist);
		model.addAttribute("reslist", rlist);
		model.addAttribute("info", member);
		
		return "member/gsearch";
	}
	
	@PostMapping("/gsearch")
	public String gsearchresultlist(HttpServletRequest request,Ground ground, Model model) {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("info");
		
		String[] cno_arr = request.getParameterValues("cno_arr");
		
		List<Time> tlist = gService.getTime();
		List<Comfort> clist = gService.getComf();
		List<Ground> glist = gService.getGround(ground);
		List<Reservation> rlist = gService.getRes();
		
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + cno_arr);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + ground);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + tlist);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + clist);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + glist);
		log.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥" + rlist);
		
		model.addAttribute("timelist", tlist);
		model.addAttribute("comflist", clist);
		model.addAttribute("groundlist", glist);
		model.addAttribute("reslist", rlist);
		model.addAttribute("info", member);
		
		return "member/gsearch";
	}
	
	@GetMapping("/ginfo")
	   public String ginfo(int gno, HttpServletRequest request, Model model) {
	      
	         HttpSession session = request.getSession();
	         Member member = (Member) session.getAttribute("info");
	      
	         Ground ground = gService.getGinfo(gno);
	         String cno_arr = ground.getCno_arr();
	         List<Review> review = gService.getReview(gno);
	         List<Time> chkRstime = gService.chkRevTime(gno);
	         
	         StringTokenizer st = new StringTokenizer(cno_arr, ",");
	         String[] cname_arr = new String[st.countTokens()];
	         int i=0;
	         
	         while(st.hasMoreTokens()) {
	            int cno = Integer.parseInt(st.nextToken());
	            cname_arr[i] = gService.getComfortname(cno);
	            i++;
	         }
	         
	         log.info("ginfo............"+ground);
	         log.info("reivew..........."+review);
	         log.info("rstime..........."+chkRstime);
	         
	         model.addAttribute("ginfo", ground);
	         model.addAttribute("cnameList", cname_arr);
	         model.addAttribute("reviewList", review);
	         model.addAttribute("chkRstime", chkRstime);
	         model.addAttribute("info", member);
	         
	         return "member/ginfo";
	      }
	   
	   @RequestMapping(value="/revInsert", method= {RequestMethod.GET, RequestMethod.POST})
	   public String revInsert(RedirectAttributes redirect, HttpServletRequest request, Reservation rev, Model model) {
	      HttpSession session = request.getSession();
	      Member member = (Member) session.getAttribute("info");
	      rev.setMno(member.getMno());
	      rev.setMname(member.getMname());
	      String[] rstime_arr = request.getParameterValues("rstime_arr");
	      
	      for(int i=0;i<rstime_arr.length;i++) {
	         rev.setRstime(Integer.parseInt(rstime_arr[i]));
	         log.info(".........rev>>>>>>>>>"+rev);
	         gService.revInsert(rev);
	      }      

	      model.addAttribute("rev", rev);
	      model.addAttribute("mno", member.getMno());
	      return "redirect:myres";
	   }
	
	@GetMapping("/myinfo")
	public String myinfo(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("info");
		if(obj.getClass().getName().contentEquals("com.aaa.project.domain.Member")) {
			Member m = (Member)obj;
			model.addAttribute("member", m);
		} else if(obj.getClass().getName().contentEquals("com.aaa.project.domain.Owner")) {
			Owner o = (Owner)obj;
			model.addAttribute("owner", o);
		}
		
		return "info";
	}
	
	
	@GetMapping("/myboardlist")
	public String mbl(HttpServletRequest request,  Criteria cri, Model model) {
		return myboardlist(request, cri, model);
	}
	
	@GetMapping("*/myboardlist")
	public String myboardlist(HttpServletRequest request,  Criteria cri, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("info");
		
		cri.setMno(member.getMno());
		cri.setType(null);
		List<Board> blist = bService.getMyBoardList(cri);
		
		model.addAttribute("info", member);
		model.addAttribute("boardlist",blist);
		model.addAttribute("pageMaker", new BoardPage(cri, bService.getMyTotalCount(cri)));
		
		return "member/myboardlist";
	}
	@GetMapping("/myreplylist")
	public String mrl(HttpServletRequest request,  Criteria cri, Model model) {
		return myreplylist(request, cri, model);
	}
	@GetMapping("*/myreplylist")
	public String myreplylist(HttpServletRequest request,  Criteria cri, Model model) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("info");
		
		cri.setMno(member.getMno());
		cri.setType(null);
		log.info("cri" + cri);
		List<Reply> reply = rService.getMyReplyList(cri);
		log.info("◑◑◑◑◑◑◑◑◑◑◑◑◑◑◑◑◑◑" + reply);
		model.addAttribute("info", member);
		model.addAttribute("rlist", reply);
//		model.addAttribute("pageMaker", new BoardPage(cri, bService.getMyTotalCount(cri)));

		return "member/myreplylist";
		
	}
	
	
	   @GetMapping("/myres")
	   public String getMyReservation(HttpServletRequest request, Reservation res, Model model) {
	      HttpSession session = request.getSession();
	      Member member = (Member)session.getAttribute("info");
	      
	      res.setMno(member.getMno());
	      
	      List<Reservation> reslist = gService.getMyReservation(res);
	      for(int i = 0; i< reslist.size(); i++) {
	    	  String date = reslist.get(i).getRdate();
	    	  date = date.substring(0,10);
	    	  log.info("!!!!!!!!!!!!!!!!!!!!!!!!!" + date);
	    	  reslist.get(i).setRdate(date);
	      }
	      log.info("◑◑◑◑◑◑◑◑◑◑◑◑◑◑◑◑"+reslist);
	      
	      
	      model.addAttribute("reslist", reslist);
	      model.addAttribute("info", member);
	      
	      return "member/myreservation";
	   }
	   
	   @RequestMapping(value="/upResChk", method= {RequestMethod.GET})
	   public String upResChk(HttpServletRequest request, Reservation res) {
	      HttpSession session = request.getSession();
	      Member member = (Member)session.getAttribute("info");
	      
	      res.setMno(member.getMno());
	      
	      gService.upResChk(res);
	            
	      return "redirect:myres";
	   }
	      
	   
	   @RequestMapping(value="/logout", method = {RequestMethod.GET, RequestMethod.POST})
	   public ModelAndView logout(HttpSession session) {
	      uService.logout(session);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("login");
	      return mav;
	   }
	   
	   @GetMapping("/resCheck")
	   public String resCheck() {
		   return "owner/resCheck";
	   }
}
