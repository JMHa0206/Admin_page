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
		return "redirect:/admin/home?menu=emp";
	}
	
	
	@ResponseBody
	@RequestMapping("/selectAll")
	public List<MemberDTO> selectAll() {
		return mServ.selectAll();
	}
	
	
	@RequestMapping("/update")
	public String update(MemberDTO dto) {
		mServ.update(dto);
		return "redirect:/admin/home?menu=emp";
	}
	
	
	@RequestMapping("/delete")
	public String delete(String emp_code_id) {
		
		mServ.delete(emp_code_id);
		return "redirect:/admin/home?menu=emp";
	}
	
}
