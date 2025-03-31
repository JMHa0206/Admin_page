package com.kedu.dao;

import java.util.List;
import com.kedu.dto.MemberDTO;

public interface MemberDAO {


    void insertMember(MemberDTO member);            // 占쏙옙占 占쏙옙占
    List<MemberDTO> selectAllMembers();             // 占쏙옙체 占쏙옙占 占쏙옙회
    MemberDTO selectMemberById(String memberId);    // 占쏙옙占 占쏙옙 占쏙옙회
    void updateMember(MemberDTO member);            // 占쏙옙占 占쏙옙占쏙옙 占쏙옙占쏙옙
    void deleteMember(String memberId);             // 占쏙옙占 占쏙옙占쏙옙
    List<MemberDTO> selectDeptManager(Integer id); //updated

}
