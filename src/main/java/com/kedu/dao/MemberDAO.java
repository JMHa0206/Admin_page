package com.kedu.dao;

import java.util.List;
import com.kedu.dto.MemberDTO;

public interface MemberDAO {


    void insertMember(MemberDTO member);            // �뜝�룞�삕�뜝 �뜝�룞�삕�뜝
    List<MemberDTO> selectAllMembers();             // �뜝�룞�삕泥� �뜝�룞�삕�뜝 �뜝�룞�삕�쉶
    MemberDTO selectMemberById(String memberId);    // �뜝�룞�삕�뜝 �뜝�룞�삕 �뜝�룞�삕�쉶
    void updateMember(MemberDTO member);            // �뜝�룞�삕�뜝 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
    void deleteMember(String memberId);             // �뜝�룞�삕�뜝 �뜝�룞�삕�뜝�룞�삕
    List<MemberDTO> selectDeptManager(Integer id); //updated
}
