/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import sv.iuh.project.model.Contact;

/**
 *
 * @author Thanh Hoai
 */
public interface ContactDao {
    public boolean create(Contact contact);
    
    public List<Contact> getAll();
}
