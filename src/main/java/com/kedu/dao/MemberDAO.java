package com.kedu.dao;

import java.util.List;
import com.kedu.dto.MemberDTO;

public interface MemberDAO {

    void insertMember(MemberDTO member);            // 사원 등록
    List<MemberDTO> selectAllMembers();             // 전체 사원 조회
    MemberDTO selectMemberById(String memberId);    // 사원 상세 조회
    void updateMember(MemberDTO member);            // 사원 정보 수정
    void deleteMember(String memberId);             // 사원 삭제
}
