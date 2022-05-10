/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;

import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductCategory;

/**
 *
 * @author VanToan
 */
public interface ProductCategoryDao {
    public boolean create(ProductCategory object);

    // update
    public boolean update(ProductCategory object);

    // delete
    public boolean delete(ProductCategory object);

    // find by id
    public ProductCategory findById(int categoryId);

    // load list category
    public List<ProductCategory> getAll();
    
    public List<ProductCategory> getListByCategory(int categoryId, String name);
}
