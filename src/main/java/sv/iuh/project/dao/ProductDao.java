/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.ProductCategory;

/**
 *
 * @author Thanh Hoai
 */
public interface ProductDao {
    public List<Product> getAll();
    
    public List<Product> getNewProduct();
    
    // update
    public boolean update(Product object);

    // delete
    public boolean delete(Product object);

    // find by id
    public Product findById(int categoryId);
    
    public boolean create(Product object);
    public List<Product> getListNav(int start, int limit);
    
    public List<Product> getListByBrand(int brandId, String name);
    
    public List<Product> getListBrand(int brandId);
    
    public List<Product> getFilter(String brandId,String cateId, int minPrice, int maxPrice, String sort);
    
    public Long totalItem();
    
    public List<Product> top4Product();
}
