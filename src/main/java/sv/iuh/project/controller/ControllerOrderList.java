/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sv.iuh.project.model.OrderDetail;
import sv.iuh.project.model.OrderProduct;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.OrderDetailService;
import sv.iuh.project.service.OrderManagementService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping(value = "/orderList")
public class ControllerOrderList {  
    
    @Autowired
    private OrderDetailService orderDetailService;
    
    @Autowired
    private OrderManagementService orderManagementService;
    
    @RequestMapping("/show")
    public String viewHome(ModelMap mm, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        List<OrderProduct> orderList = orderManagementService.getOrderIdByUser(userShop.getUserID());
        List<OrderDetail> orderDetailList = new ArrayList<>();
        for(OrderProduct op : orderList){
            orderDetailList.addAll(orderDetailService.getOrdersOfUser(op.getOrderID()));
        }   
        mm.put("list",  orderDetailList);
        return "user/orderList";
    }
    
    @RequestMapping(value = "remove")
    public String viewOrderProductRemoveUser(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
         OrderDetail orderDetail = orderDetailService.findById(id);
         double total = orderDetail.getTotal();
         int orderID = orderDetail.getOrderID().getOrderID();
        if (orderDetail != null) {
            orderDetailService.delete(orderDetail);
        }
        OrderProduct orderProduct = orderManagementService.findById(orderID);
        orderProduct.setTotalMoney(orderProduct.getTotalMoney() - total);
        orderManagementService.update(orderProduct);
        return viewHome(mm, session);
    }
}
