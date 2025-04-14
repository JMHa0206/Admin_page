package com.kedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.JobDTO;
import com.kedu.services.JobService;

@Controller
@RequestMapping("/Job")
public class JobController {
	
	@Autowired
	private JobService jServ;
	
	@ResponseBody
	@RequestMapping("/selectAllJob")
	public List<JobDTO> selectAllJob() {
		return jServ.selectAllJob();
	}

}
