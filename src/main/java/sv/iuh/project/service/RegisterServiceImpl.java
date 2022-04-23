/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.RegisterDao;
import sv.iuh.project.model.UserShop;

/**
 *
 * @author Hung
 */
@Service
public class RegisterServiceImpl implements RegisterService{
     @Autowired
    private RegisterDao registerDao;

    @Override
    public boolean create(UserShop object) {
        return  registerDao.create(object);
    }

    @Override
    public boolean update(UserShop object) {
        return registerDao.update(object);
    }

    @Override
    public boolean delete(UserShop object) {
        return registerDao.delete(object);
    }

    @Override
    public UserShop findById(int categoryId) {
        return registerDao.findById(categoryId);
    }

    @Override
    public List<UserShop> getAll() {
        return registerDao.getAll();
    }
}
