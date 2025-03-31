package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.MemberDAOImp;
import com.kedu.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAOImp daom;
	
	public void insertEmp(MemberDTO dto) {
		daom.insertEmp(dto);
	}

	public List<MemberDTO> selectAll() {
		return daom.selectAllMembers();
		
	}

	public void update(MemberDTO dto) {
		daom.updateMember(dto);
		
	}

	public void delete(String emp_code_id) {
		daom.deleteMember(emp_code_id);
	}
	
	public List<MemberDTO> selectDeptManager(Integer id) { //updated
		return daom.selectDeptManager(id);
	}
	


}
