/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.ProductBrandDao;
import sv.iuh.project.dao.ProductCategoryDao;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.ProductCategory;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class ProductCategoryServiceImpl implements ProductCategoryService{
    @Autowired
    private ProductCategoryDao productCategoryDao;

    @Override
    public boolean create(ProductCategory object) {
        return productCategoryDao.create(object);
    }

    @Override
    public boolean update(ProductCategory object) {
        return productCategoryDao.update(object);
    }

    @Override
    public boolean delete(ProductCategory object) {
        return productCategoryDao.delete(object);
    }

    @Override
    public ProductCategory findById(int categoryId) {
        return productCategoryDao.findById(categoryId);
    }

    @Override
    public List<ProductCategory> getAll() {
        return productCategoryDao.getAll();
    }
    
    @Override
    public List<ProductCategory> getListByCategory(int categoryId, String productCategoryName){
    	return productCategoryDao.getListByCategory(categoryId, productCategoryName);
    }
}
