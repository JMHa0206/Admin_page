package com.kedu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kedu.dto.AnnualLeaveDTO;
import com.kedu.dto.WorkDTO;

@Repository
public class WorkDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String NAMESPACE = "Work";

    public void updateWorkStandard(WorkDTO dto) {
        sqlSession.update(NAMESPACE + ".update", dto);
    }

    public void createAnnualLeave(AnnualLeaveDTO dto) {
        sqlSession.insert(NAMESPACE + ".createAnnualLeave", dto);
    }
    
    public List<AnnualLeaveDTO> selectAll() {
    	return sqlSession.selectList(NAMESPACE + ".selectAll");
    }
}
