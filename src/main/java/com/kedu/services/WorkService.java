package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.WorkDAO;
import com.kedu.dto.AnnualLeaveDTO;
import com.kedu.dto.WorkDTO;

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

}
