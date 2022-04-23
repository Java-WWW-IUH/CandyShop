/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import sv.iuh.project.model.UserShop;

/**
 *
 * @author Hung
 */
public interface UserDao {
     public List<UserShop> getAll();
    
    //public List<UserShop> getNewProduct();
    
    // update
    public boolean update(UserShop object);

    // delete
    public boolean delete(UserShop object);

    // find by id
    public UserShop findById(int userId);
    
    //thêm user
    public boolean create(UserShop object);
    
    //phân trang
    public List<UserShop> getListNav(int start, int limit);
    
    //tìm theo tên
    public List<UserShop> getListByName( String name);
}
