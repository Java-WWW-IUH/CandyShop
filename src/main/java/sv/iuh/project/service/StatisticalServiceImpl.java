/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.StatisticalDao;
import sv.iuh.project.model.OrderDetail;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class StatisticalServiceImpl implements StatisticalService{
    @Autowired
    private StatisticalDao statisticalDao;
    @Override
    public Long totalUserShop() {
        return statisticalDao.totalUserShop();
    }

    @Override
    public Long totalProductBrand() {
        return statisticalDao.totalProductBrand();
    }

    @Override
    public Long totalOrderDetail() {
        return statisticalDao.totalOrderDetail();
    }

    @Override
    public Long totalProduct() {
        return statisticalDao.totalProduct();
    }

    @Override
    public List<OrderDetail> newFiveOrder() {
        return statisticalDao.newFiveOrder();
    }
    
}
