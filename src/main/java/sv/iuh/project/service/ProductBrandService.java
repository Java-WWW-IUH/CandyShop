/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import sv.iuh.project.model.Country;
import sv.iuh.project.model.ProductBrand;

/**
 *
 * @author Thanh Hoai
 */
public interface ProductBrandService {
    // create
    public boolean create(ProductBrand object);

    // update
    public boolean update(ProductBrand object);

    // delete
    public boolean delete(ProductBrand object);

    // find by id
    public ProductBrand findById(int categoryId);

    // load list category
    public List<ProductBrand> getAll();
    
    public List<Country> getAllCountry();
}
