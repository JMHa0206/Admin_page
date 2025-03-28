package com.kedu.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.WorkDAO;
import com.kedu.dto.WorkDTO;

@Service
public class WorkService {

    @Autowired
    private WorkDAO workDAO;

    public void updateWorkTime(WorkDTO dto) {
        workDAO.updateWorkStandard(dto);
    }

    public void generateAnnualLeave(int empId) {
        workDAO.createAnnualLeave(empId);
    }
}
