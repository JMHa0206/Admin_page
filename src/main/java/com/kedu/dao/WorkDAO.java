package com.kedu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kedu.dto.AnnualLeaveDTO;
import com.kedu.dto.DepartDTO;
import com.kedu.dto.MemberDTO;
import com.kedu.dto.WorkDTO;
import com.kedu.dto.WorkingHoursDTO;

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
    
    public List<DepartDTO> selectAllDept(){
    	return sqlSession.selectList(NAMESPACE +".selectAllDept");
    }
    public List<MemberDTO> selectAllEmpl(){
    	return sqlSession.selectList(NAMESPACE+".selectAllEmpl");
    }
    public int setWorkHours(WorkingHoursDTO whdto) {
    	int count = sqlSession.selectOne(NAMESPACE+".checkIfExists", whdto);

    	if (count > 0) {
    	    return sqlSession.update(NAMESPACE+".updateWorkHours", whdto); // update
    	} else {
    	    return sqlSession.insert(NAMESPACE+".insertWorkHours", whdto); // insert
    	}
    }
}
