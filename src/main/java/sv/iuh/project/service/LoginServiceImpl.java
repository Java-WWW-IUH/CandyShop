/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.LoginDao;
import sv.iuh.project.model.UserShop;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class LoginServiceImpl implements LoginService{
    @Autowired
    private LoginDao loginDao;
    @Override
    public UserShop login(String uname, String passwd) {
        return loginDao.login(uname, passwd);
    }
    
}
