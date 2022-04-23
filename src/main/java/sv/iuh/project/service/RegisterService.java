/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.UserShop;

/**
 *
 * @author Hung
 */
public interface RegisterService {
      // create
    public boolean create(UserShop object);

    // update
    public boolean update(UserShop object);

    // delete
    public boolean delete(UserShop object);

    // find by id
    public UserShop findById(int categoryId);

    // load list category
    public List<UserShop> getAll();
}
