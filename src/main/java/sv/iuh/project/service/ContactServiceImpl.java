/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.ContactDao;
import sv.iuh.project.model.Contact;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class ContactServiceImpl implements ContactService{

    @Autowired
    private ContactDao contactDao;
    
    @Override
    public boolean create(Contact contact) {
        return contactDao.create(contact);
    }

    @Override
    public List<Contact> getAll() {
        return contactDao.getAll();
    }
    
}
