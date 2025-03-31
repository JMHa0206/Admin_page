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

    private static final String NAMESPACE = "Member";

    @Override
    public void insertMember(MemberDTO member) {
        sqlSession.insert(NAMESPACE + ".insertMember", member);
    }

    @Override
    public List<MemberDTO> selectAllMembers() {
        return sqlSession.selectList(NAMESPACE + ".selectAllMembers");
    }

    @Override
    public MemberDTO selectMemberById(String memberId) {
        return sqlSession.selectOne(NAMESPACE + ".selectMemberById", memberId);
    }

    @Override
    public void updateMember(MemberDTO member) {
        sqlSession.update(NAMESPACE + ".updateMember", member);
    }
    
    @Override
    public void deleteMember(String memberId) {
        sqlSession.delete(NAMESPACE + ".deleteMember", memberId);
    }
    
    @Override //updated
    public List<MemberDTO> selectDeptManager(Integer id){
    	return sqlSession.selectList(NAMESPACE + ".selectDeptManager",id);
    }
}
