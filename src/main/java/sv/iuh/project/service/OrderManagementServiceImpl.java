/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.OrderManagementDao;
import sv.iuh.project.model.OrderProduct;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class OrderManagementServiceImpl implements OrderManagementService{
    
    @Autowired
    private OrderManagementDao orderManagementDao;

    @Override
    public boolean create(OrderProduct object) {
        return orderManagementDao.create(object);
    }

    @Override
    public boolean update(OrderProduct object) {
        return orderManagementDao.update(object);
    }

    @Override
    public boolean delete(OrderProduct object) {
        return orderManagementDao.delete(object);
    }

    @Override
    public OrderProduct findById(int id) {
        return orderManagementDao.findById(id);
    }

    @Override
    public List<OrderProduct> getAll() {
        return orderManagementDao.getAll();
    }

    @Override
    public List<OrderProduct> getOrdersByDate(String date) {
        return orderManagementDao.getOrdersByDate(date);
    }

    @Override
    public List<OrderProduct> getOrdersUnpaid() {
        return orderManagementDao.getOrdersUnpaid();
    }
    
    public List<OrderProduct> getOrdersPaid(){
    	return orderManagementDao.getOrdersPaid();
    }

    @Override
    public List<OrderProduct> getOrderIdByUser(int id) {
        return orderManagementDao.getOrderIdByUser(id);
    }
    
}
