package com.kedu.dao;

import java.util.List;
import com.kedu.dto.MemberDTO;

public interface MemberDAO {

    void insertMember(MemberDTO member);            // ��� ���
    List<MemberDTO> selectAllMembers();             // ��ü ��� ��ȸ
    MemberDTO selectMemberById(String memberId);    // ��� �� ��ȸ
    void updateMember(MemberDTO member);            // ��� ���� ����
    void deleteMember(String memberId);             // ��� ����
    List<MemberDTO> selectDeptManager(Integer id); //updated
   
}
