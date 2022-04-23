/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.UserShop;

/**
 *
 * @author Hung
 */
public interface RegisterDao {
    public boolean create(UserShop object);

    // update
    public boolean update(UserShop object);

    // delete
    public boolean delete(UserShop object);

    // find by id
    public UserShop findById(int id);
    // load list brand
    public List<UserShop> getAll();
}
