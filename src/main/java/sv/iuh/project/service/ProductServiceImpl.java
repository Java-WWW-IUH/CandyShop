/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.ProductDao;
import sv.iuh.project.model.Product;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public boolean create(Product object) {
        return productDao.create(object);
    }

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }
    @Override
    public boolean update(Product object) {
        return productDao.update(object);
    }

    @Override
    public boolean delete(Product object) {
        return productDao.delete(object);
    }

    @Override
    public Product findById(int categoryId) {
        return productDao.findById(categoryId);
    }
    @Override
    public List<Product> getListNav(int start, int limit) {
        return productDao.getListNav(start, limit);
    }
    @Override
    public Long totalItem() {
        return productDao.totalItem();
    }

    @Override
    public List<Product> getNewProduct() {
        return productDao.getNewProduct();
    }

    @Override
    public List<Product> getListByBrand(int brandId, String name) {
        return productDao.getListByBrand(brandId, name);
    }

    @Override
    public List<Product> getListBrand(int brandId) {
        return productDao.getListBrand(brandId);
    }

    @Override
    public List<Product> getFilter(String brandId, String cateId, int minPrice, int maxPrice, String sort) {
        return productDao.getFilter(brandId, cateId, minPrice, maxPrice, sort);
    }
}
