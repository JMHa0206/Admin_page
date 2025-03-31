package com.kedu.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MemberDTO;

@Repository
public class MemberDAOImp implements MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String NAMESPACE = "Employee";

    @Override
    public void insertEmp(MemberDTO dto) {
        sqlSession.insert(NAMESPACE + ".insertEmp", dto);
    }

    @Override
    public List<MemberDTO> selectAllMembers() {
    	
        return sqlSession.selectList(NAMESPACE + ".selectAllMembers");
    }

    @Override
    public MemberDTO selectMemberById(String emp_code_id) {
        return sqlSession.selectOne(NAMESPACE + ".selectMemberById", emp_code_id);
    }

    @Override
    public void updateMember(MemberDTO member) {
        int result = sqlSession.update(NAMESPACE + ".updateMember", member);
        System.out.println("Update result: " + result);
    }
    
    @Override
    public void deleteMember(String emp_code_id) {
       int result =  sqlSession.delete(NAMESPACE + ".deleteMember", emp_code_id);
        System.out.println("Delete result: " + result); 
    }
    
    @Override //updated
    public List<MemberDTO> selectDeptManager(Integer id){
    	return sqlSession.selectList(NAMESPACE + ".selectDeptManager",id);
    }
}
