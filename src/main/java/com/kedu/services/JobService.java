package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.JobDAOImp;
import com.kedu.dto.JobDTO;

@Service
public class JobService {

	@Autowired
	private JobDAOImp jDao;
	
	public List<JobDTO> selectAllJob() {
		return jDao.selectAllJob();
	}
}
