/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.OrderDetailDao;
import sv.iuh.project.model.OrderDetail;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService{
    
    @Autowired
    private OrderDetailDao orderDetailDao;

    @Override
    public boolean create(Object object) {
        return orderDetailDao.create(object);
    }

    @Override
    public List<OrderDetail> getOrdersOfUser(int id) {
        return orderDetailDao.getOrdersOfUser(id);
    }

    @Override
    public boolean delete(OrderDetail orderDetail) {
        return orderDetailDao.delete(orderDetail);
    }

    @Override
    public OrderDetail findById(int id) {
        return orderDetailDao.findById(id);
    }

	@Override
	public boolean update(OrderDetail object) {
		// TODO Auto-generated method stub
		return orderDetailDao.update(object);
	}
  
}
