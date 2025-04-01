package com.kedu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kedu.dto.JobDTO;

@Repository
public class JobDAOImp implements JobDAO {

	 @Autowired
	    private SqlSessionTemplate sqlSession;
	 
	 	private static final String NAMESPACE = "Job";
	 
	 @Override
	 	public List<JobDTO> selectAllJob() {
	        return sqlSession.selectList(NAMESPACE + ".selectAllJob"); 
	    }
}
