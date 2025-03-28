package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		dServ.insertDept(dto);
		return "redirect:/admin/home?menu=dept";
	}
	
	@ResponseBody
	@RequestMapping("/selectAllDept")
	public List<DepartDTO> selectAllDept() { //R
		return dServ.selectAllDepts();
	}
	
	public DepartDTO selectDeptById(int deptId) { //1���� R
		return dServ.selectDeptById(deptId);
	}
	
	@PostMapping("/updateDept")
	public String updateDept(@RequestParam("dept_id") Integer dept_id,
			@RequestParam("dept_name") String dept_name) { //U
		
		dServ.updateDept(new DepartDTO(dept_id, dept_name));
		return "부서 정보가 수정되었습니다"; 
	}
	
	@PostMapping("/deleteDept")
	public String deleteDept(@RequestParam("dept_id") Integer deptid) { //D
		dServ.deleteDept(deptid);
		
		return "부서 정보가 삭제되었습니다";
	}
	
	
}
