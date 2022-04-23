/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import sv.iuh.project.dao.UserDao;
import sv.iuh.project.model.UserShop;

/**
 *
 * @author Hung
 */
public class UserServiceImpl implements UserService{
    
    @Autowired
    private UserDao userDao;
    
    @Override
    public boolean create(UserShop object) {
        return userDao.create(object);
    }

    @Override
    public List<UserShop> getAll() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return userDao.getAll();
    }

    @Override
    public boolean update(UserShop object) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return userDao.update(object);
    }

    @Override
    public boolean delete(UserShop object) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return userDao.delete(object);
    }

    @Override
    public UserShop findById(int userId) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return userDao.findById(userId);
    }

    @Override
    public List<UserShop> getListNav(int start, int limit) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return userDao.getListNav(start, limit);
    }

    @Override
    public List<UserShop> getListByName( String name) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    
        return userDao.getListByName( name);
    }
}
