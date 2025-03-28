package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.MemberDTO;
import com.kedu.services.MemberService;

@Controller
@RequestMapping("/Member")
public class MemberController {
	
	@Autowired
	private MemberService mServ;
	
	@RequestMapping("/add")
	public String add(MemberDTO dto) {
		mServ.insertMember(dto);
		return "/admin/home";
	}
	@ResponseBody
	@RequestMapping("/selectAll")
	public List<MemberDTO> selectAll() {
		return mServ.selectAll();
	}
	@RequestMapping("/updateMember")
	public String updateMember(MemberDTO dto) {
		mServ.updateMember(dto);
		return "/admin/home";
	}
	@RequestMapping("/delete")
	public String delete(String id) {
		mServ.delete(id);
		return "/admin/home";
	}
	
}
