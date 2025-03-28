package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.DepartDTO;
import com.kedu.services.DepartService;

@Controller
@RequestMapping("/Depart")
public class DepartController {
		
	@Autowired
	private DepartService dServ;
	
	@RequestMapping("/insertDept")
	public String insertDept(DepartDTO dto) { //C
		System.out.println("1");
		dServ.insertDept(dto);
		System.out.println("2");
		return "redirect:/admin/home?menu=dept";
	}
	
	@ResponseBody
	@RequestMapping("/selectAllDept")
	public List<DepartDTO> selectAllDept() { //R
		return dServ.selectAllDepts();
	}
	
	public DepartDTO selectDeptById(int deptId) { //1°³¸¸ R
		return dServ.selectDeptById(deptId);
	}
	
	public void updateDept(DepartDTO dept) { //U
		dServ.updateDept(dept);
	}
	
	public void deleteDept(int deptId) { //D
		dServ.deleteDept(deptId);
	}
	
	
}
