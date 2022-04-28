/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import sv.iuh.project.model.OrderDetail;

/**
 *
 * @author Thanh Hoai
 */
public interface OrderDetailDao {
    
    public boolean create (Object object);
    
    public List<OrderDetail> getOrdersOfUser(int id);
    
    public boolean delete (OrderDetail orderDetail);
    
    public boolean update(OrderDetail object);
    
    public OrderDetail findById(int id);
}
