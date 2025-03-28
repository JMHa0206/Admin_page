package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.PermissionDTO;
import com.kedu.services.PermissionService;

@Controller
@RequestMapping("/Permission")
public class PermissionController {
	
	@Autowired
	private PermissionService pServ;
	
	@RequestMapping("/add")
	public String insertPer(PermissionDTO dto) {
		pServ.insertPer(dto);
		return "redirect:/admin/home?menu=permission";
	}
	@RequestMapping("/selectAll")
	@ResponseBody
	public List<PermissionDTO> selectAll(Model model){
		List<PermissionDTO> list = pServ.selectAll();
		 model.addAttribute("perlist",list);
		return list;
	}
	@RequestMapping("/update")
	public String update(PermissionDTO dto) {
		pServ.update(dto);
		return "redirect:/admin/home?menu=permission";
	}
	@RequestMapping("/delete")
	public String delete(int perid) {
		pServ.delete(perid);
		return "redirect:/admin/home?menu=permission";
	}
	@RequestMapping("/get")
	@ResponseBody
	public PermissionDTO getPermissionById(@RequestParam("id") int id) {
	    return pServ.selectById(id);
	}
}
