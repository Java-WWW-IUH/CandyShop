/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import sv.iuh.project.model.UserShop;

/**
 *
 * @author Thanh Hoai
 */
public interface LoginDao {
    public UserShop login(String uname, String passwd);
}
