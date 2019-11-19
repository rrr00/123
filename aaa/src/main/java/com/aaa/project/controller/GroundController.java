package com.aaa.project.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.project.domain.Comfort;
import com.aaa.project.domain.Ground;
import com.aaa.project.domain.Image;
import com.aaa.project.domain.Owner;
import com.aaa.project.domain.Time;
import com.aaa.project.service.GroundService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/")
@AllArgsConstructor
public class GroundController {
	@Inject
    PasswordEncoder passwordEncoder;
	GroundService gService;
	
	@GetMapping("/gregister")
	public String gregister(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Owner Owner = (Owner) session.getAttribute("info");
		
		List<Time> tlist = gService.getTime();
		List<Comfort> clist = gService.getComf();
		
		model.addAttribute("timelist", tlist);
		model.addAttribute("comflist", clist);
		model.addAttribute("info", Owner);
		return "/owner/gregister";
	}
	
	@PostMapping("/gregister")
	public String gregisterProc(HttpServletRequest request, MultipartFile[] image, Ground ground, String cname, 
			String zipNo, String roadAddrPart1, String addrDetail, Model model) {
		HttpSession session = request.getSession();
		Owner Owner = (Owner) session.getAttribute("info");
		String uploadFolder = "c:\\upload";
		
		ground.setOno(Owner.getOno());
		
		
		Comfort comfort = new Comfort();		
		 if(cname.length() != 0) {			 
			 comfort.setCname(cname);
			 gService.comfortInsert(comfort);
		 }else if(ground.getCno_arr() != null && cname.length() == 0){
			 String cno_arr = ground.getCno_arr();
			 cno_arr.substring(0, cno_arr.length()-2);
			 ground.setCno_arr(cno_arr);
		 }
		 
		 String addr = zipNo + " " + roadAddrPart1 + " " + addrDetail;
		 ground.setGaddr(addr);
		 ground.setCno_arr(ground.getCno_arr()+","+comfort.getCno());
		 if(ground.getText().length() == 0)	
			 ground.setText("주의사항 없음");
		 gService.groundInsert(ground);
		 log.info("ground>>>" + ground);
		
		if(image.length != 0) {
			for(MultipartFile uploadFile : image) {
				Image uploadImage = new Image();
				uploadImage.setIname(uploadFile.getOriginalFilename());
				uploadImage.setGno(ground.getGno());
				gService.imageInsert(uploadImage);
				File saveFile = new File(uploadFolder, uploadFile.getOriginalFilename());
				
				try {
					uploadFile.transferTo(saveFile);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "/owner/OMain";
	}
}
