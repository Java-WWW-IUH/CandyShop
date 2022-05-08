/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.ProductCategory;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.ProductBrandService;
import sv.iuh.project.service.ProductCategoryService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping("/productcategory")
public class ProductCategoryController {
    @Autowired
    private ProductCategoryService productCategoryService;

    @RequestMapping("/show")
    public String viewHome(ModelMap mm, HttpSession session) {
        String link = adminDashboard(session);
        if(link != null)
            return link;
        mm.put("list", productCategoryService.getAll());
        return "admin/productcategorymanage";
    }

    @RequestMapping(value = "/showform", method = RequestMethod.GET)
    public String viewProductNew(ModelMap mm, HttpSession session) {
        String link = adminDashboard(session);
        if(link != null)
            return link;
        return "admin/productcategoryform";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String viewSearch(ModelMap mm, HttpSession session, @RequestParam("productcategoryfilter") int id, @RequestParam(required = true) String productCategoryName) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                if (productCategoryName == "" && id == 0) {
                    return "redirect:/productcategory/show";
                } else {
                    mm.put("list", productCategoryService.getListByCategory(id, productCategoryName));
                    mm.put("listcategory", productCategoryService.getAll());
                    mm.put("category", productCategoryService.findById(id));
                    mm.put("s", productCategoryName);
                    return "admin/productcategorymanage";
                }
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
        String link = adminDashboard(session);
        if(link != null)
            return link;
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        ProductCategory productCategory = new ProductCategory();
        productCategory.setProductCategoryName(name);
        if (request.getParameter("id") == "") {
            productCategoryService.create(productCategory);
            mm.put("listProductCategory", productCategoryService.getAll());
            mm.put("success", "Thêm thành công");
            return "admin/productcategoryform";
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            productCategory.setProductCategoryID(id);
            productCategoryService.update(productCategory);
            mm.put("productCategory", productCategory);
            mm.put("listProductCategory", productCategoryService.getAll());
            String inf="Sua thanh cong";
            return "redirect:/productcategory/showformupdate?id="+id+"&success="+inf+"";
        }
    }
    @RequestMapping(value = "/showformupdate")
    public String showFormUdate(ModelMap mm, HttpSession session,@RequestParam("id") int id,@RequestParam(required = false) String success) {
        String link = adminDashboard(session);
        if(link != null)
            return link;
        ProductCategory productCategory=productCategoryService.findById(id);
        mm.put("productCategory", productCategory);
        mm.put("success", success);
        return "admin/productcategoryform";
    }
    @RequestMapping(value = "remove")
    public String viewRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        String link = adminDashboard(session);
        if(link != null)
            return link;
        ProductCategory p = productCategoryService.findById(id);
        if (p != null) {
            productCategoryService.delete(p);
        }
        mm.put("list", productCategoryService.getAll());
        return "admin/productcategorymanage";
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