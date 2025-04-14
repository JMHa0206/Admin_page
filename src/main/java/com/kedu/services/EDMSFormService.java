package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.EDMSFormDAO;
import com.kedu.dto.EDMSFormDTO;

@Service
public class EDMSFormService {

    private final EDMSFormDAO edmsFormDAO;

    @Autowired
    public EDMSFormService(EDMSFormDAO edmsFormDAO) {
        this.edmsFormDAO = edmsFormDAO;
    }

    public List<EDMSFormDTO> getAllForms() {
        return edmsFormDAO.findAllForms();
    }

    public EDMSFormDTO getFormById(int formId) {
        return edmsFormDAO.findFormById(formId);
    }

    public void createForm(EDMSFormDTO form) {
        edmsFormDAO.insertForm(form);
    }

    public void updateForm(EDMSFormDTO form) {
        edmsFormDAO.updateForm(form);
    }

    public void deleteForm(int formId) {
        edmsFormDAO.deleteForm(formId);
    }
}
