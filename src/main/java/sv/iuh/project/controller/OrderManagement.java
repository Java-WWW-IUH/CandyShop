/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sv.iuh.project.model.OrderProduct;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.OrderDetailService;
import sv.iuh.project.service.OrderManagementService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping("/orderManagement")
public class OrderManagement {
    
    @Autowired
    private OrderManagementService orderManagementService;
    
    @Autowired
    private OrderDetailService orderDetailService;
    
    @RequestMapping("/show")
    public String viewHome(ModelMap mm, HttpSession session){
        String link = adminDashboard(session);
        if(link != null)
            return link;
        mm.put("list", orderManagementService.getAll());
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String dateString  = df.format(date);
        mm.put("newlist", orderManagementService.getOrdersByDate(dateString));
        mm.put("unpaidlist", orderManagementService.getOrdersUnpaid());
        return "admin/orderManagement";
    }

    
    @RequestMapping(value = "remove")
    public String viewOrderProductRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        OrderProduct orderProduct = orderManagementService.findById(id);
        if (orderProduct != null) {
            orderManagementService.delete(orderProduct);
        }
        mm.put("list", orderManagementService.getAll());
        return "redirect:/orderManagement/show";
    }
    
    public String adminDashboard(HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                return null;
            } else {
                return "redirect:/";
            }
        }else{
            return "redirect:/";
        }
    }
}


