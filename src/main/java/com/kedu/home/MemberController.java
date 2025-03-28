package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.MemberDTO;
import com.kedu.services.MemberService;

@Controller
@RequestMapping("/Employee")
public class MemberController {
	
	@Autowired
	private MemberService mServ;
	
	@RequestMapping("/insertEmp")
	public String add(MemberDTO dto) {
		
		System.out.println(dto.getEmp_name());
		mServ.insertEmp(dto);
		return "/admin/home";
	}
	
	
	@ResponseBody
	@RequestMapping("/selectAll")
	public List<MemberDTO> selectAll() {
		return mServ.selectAll();
	}
	
	
	@RequestMapping("/update")
	public String update(MemberDTO dto) {
		mServ.update(dto);
		return "/redirect:/admin/home?menu=permission";
	}
	
	
	@RequestMapping("/delete")
	public String delete(String id) {
		mServ.delete(id);
		return "/redirect:/admin/home?menu=permission";
	}
	
}
