package com.kedu.dao;

import java.util.List;

import com.kedu.dto.JobDTO;


public interface JobDAO {

	List<JobDTO> selectAllJob();  
}
