package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.WorkDAO;
import com.kedu.dto.AnnualLeaveDTO;
import com.kedu.dto.DepartDTO;
import com.kedu.dto.MemberDTO;
import com.kedu.dto.WorkDisplayDTO;
import com.kedu.dto.WorkingHoursDTO;

@Service
public class WorkService {

    @Autowired
    private WorkDAO workDAO;


    public void createAnnualLeaveRule(AnnualLeaveDTO dto) {
        workDAO.createAnnualLeave(dto);
    }
    
    public List<AnnualLeaveDTO> selectAll(){
    	return workDAO.selectAll();
    }
    // �μ� ���
    public List<DepartDTO> selectAllDept(){
    	return workDAO.selectAllDept();
    }
    public List<MemberDTO> selectAllEmpl(){
    	return workDAO.selectAllEmpl();
    }
    

    public int setWorkHours(WorkingHoursDTO whdto) {
    	return workDAO.setWorkHours(whdto);
    }
    // �μ��� ����� �ð� ��ȸ
    public List<WorkDisplayDTO> getWorkHoursByDept(int deptId) {
        return workDAO.getWorkHoursByDept(deptId);
    }
    // �μ� �̸��� ���
    public List<DepartDTO> getDeptListForDropdown() {
        return workDAO.selectAllDeptForDropdown();
    }


}
