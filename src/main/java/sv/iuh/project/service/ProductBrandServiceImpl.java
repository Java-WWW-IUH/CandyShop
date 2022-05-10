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
import sv.iuh.project.model.Country;
import sv.iuh.project.model.ProductBrand;

/**
 *
 * @author VanToan
 */
@Service
public class ProductBrandServiceImpl implements ProductBrandService{
    @Autowired
    private ProductBrandDao productBrandDao;

    @Override
    public boolean create(ProductBrand object) {
        return productBrandDao.create(object);
    }

    @Override
    public boolean update(ProductBrand object) {
        return productBrandDao.update(object);
    }

    @Override
    public boolean delete(ProductBrand object) {
        return productBrandDao.delete(object);
    }

    @Override
    public ProductBrand findById(int categoryId) {
        return productBrandDao.findById(categoryId);
    }

    @Override
    public List<ProductBrand> getAll() {
        return productBrandDao.getAll();
    }

    @Override
    public List<Country> getAllCountry() {
        return productBrandDao.getAllCountry();
    }
}
