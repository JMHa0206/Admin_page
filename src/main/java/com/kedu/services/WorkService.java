package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.WorkDAO;
import com.kedu.dto.AnnualLeaveDTO;
import com.kedu.dto.DepartDTO;
import com.kedu.dto.MemberDTO;
import com.kedu.dto.WorkDTO;
import com.kedu.dto.WorkingHoursDTO;

@Service
public class WorkService {

    @Autowired
    private WorkDAO workDAO;

    public void updateWorkTime(WorkDTO dto) {
        workDAO.updateWorkStandard(dto);
    }

    public void createAnnualLeaveRule(AnnualLeaveDTO dto) {
        workDAO.createAnnualLeave(dto);
    }
    
    public List<AnnualLeaveDTO> selectAll(){
    	return workDAO.selectAll();
    }
    
    public List<DepartDTO> selectAllDept(){
    	return workDAO.selectAllDept();
    }
    public List<MemberDTO> selectAllEmpl(){
    	return workDAO.selectAllEmpl();
    }
    
    public int setWorkHours(WorkingHoursDTO whdto) {
    	return workDAO.setWorkHours(whdto);
    }

}
