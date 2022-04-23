/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sv.iuh.project.model.Product;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.ProductBrandService;
import sv.iuh.project.service.ProductService;
import sv.iuh.project.service.StatisticalService;

@Controller
public class Test {

    @Autowired
    private ProductBrandService productBrandService;
    @Autowired
    private ProductService productService;
    @Autowired
    private StatisticalService statisticalService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String viewHome(ModelMap mm, HttpSession session) {
        mm.put("listbrand", productBrandService.getAll());
        mm.put("newproduct", productService.getNewProduct());
        return "user/dashboard";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String viewAbout(ModelMap mm) {
        return "user/about";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String viewLogin(ModelMap mm, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            return "redirect:/";

        } else {

            return "user/login";
        }

    }

    @RequestMapping("/admin")
    public String adminDashboard(ModelMap mm, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                mm.put("tuser", statisticalService.totalUserShop());
                mm.put("tbrand", statisticalService.totalProductBrand());
                mm.put("torder", statisticalService.totalOrderDetail());
                mm.put("tproduct", statisticalService.totalProduct());
                mm.put("listOr", statisticalService.newFiveOrder());
                return "admin/dashboard";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }
    }
}
