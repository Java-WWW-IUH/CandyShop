/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.ProductBrandService;

/**
 *
 * @author VanToan
 */
@Controller
@RequestMapping("/productbrand")
public class ProductBrandManage {

    @Autowired
    private ProductBrandService productBrandService;

    @RequestMapping("/show")
    public String viewHome(ModelMap mm, HttpSession session) {
        String link = adminDashboard(session);
        if (link != null) {
            return link;
        }
        mm.put("list", productBrandService.getAll());
        return "admin/productbrandmanage";
    }

    @RequestMapping(value = "/showform", method = RequestMethod.GET)
    public String viewProductNew(ModelMap mm, HttpSession session, @RequestParam(required = false) String success) {
        String link = adminDashboard(session);
        if (link != null) {
            return link;
        }
        mm.put("list", productBrandService.getAllCountry());
        mm.put("success", success);
        return "admin/productbrandform";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request, @RequestParam(value = "image") MultipartFile photo) throws UnsupportedEncodingException {
        String link = adminDashboard(session);
        if (link != null) {
            return link;
        }
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String nation = request.getParameter("nation");
        ProductBrand productBrand = new ProductBrand();
        productBrand.setProductBrandName(name);
        productBrand.setNationalProduction(nation);
        productBrand.setImg(saveFile(photo));
        int a = 0;
        for (int i = 0; i < productBrandService.getAll().size(); i++) {
            if (name.equalsIgnoreCase(productBrandService.getAll().get(i).getProductBrandName())) {
                a++;
            }
        }
        if ("".equals(request.getParameter("id"))) {
            if (a > 0) {
                mm.put("err", "Thương hiệu này đã tồn tại");
                mm.put("list", productBrandService.getAllCountry());
                return "admin/productbrandform";
            } else {

                productBrandService.create(productBrand);
                mm.put("listProductBrand", productBrandService.getAll());
                return "redirect:/productbrand/showform?success=Them thanh cong";
            }
        }
        if (!"".equals(request.getParameter("id"))) {
            int id = Integer.parseInt(request.getParameter("id"));
            String imgUp = request.getParameter("imgUp");
            if (photo.isEmpty()) {
                productBrand.setImg(imgUp);
            } else {
                productBrand.setImg(saveFile(photo));
            }
            productBrand.setProductBrandID(id);
            productBrandService.update(productBrand);
            mm.put("productBrand", productBrand);
            mm.put("listProductBrand", productBrandService.getAll());
            String inf = "Sua thanh cong";
            return "redirect:/productbrand/showformupdate?id=" + id + "&success=" + inf + "";
        }
        return "admin/productbrandmanage";
    }

    @RequestMapping(value = "/showformupdate")
    public String showFormUdate(ModelMap mm, HttpSession session, @RequestParam("id") int id, @RequestParam(required = false) String success) {
        String link = adminDashboard(session);
        if (link != null) {
            return link;
        }
        ProductBrand productBrand = productBrandService.findById(id);
        mm.put("productBrand", productBrand);
        mm.put("list", productBrandService.getAllCountry());
        mm.put("success", success);
        return "admin/productbrandform";
    }

    @RequestMapping(value = "remove")
    public String viewProductRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        String link = adminDashboard(session);
        if (link != null) {
            return link;
        }
        ProductBrand p = productBrandService.findById(id);
        if (p != null) {
            productBrandService.delete(p);
        }
        mm.put("list", productBrandService.getAll());
        return "admin/productbrandmanage";
    }

    private String saveFile(MultipartFile file) {
        if (null != file && !file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "assets/user/imgbrand");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                String name = String.valueOf(new Date().getTime() + ".jpg");
                File serverFile = new File(dir.getAbsoluteFile() + File.separator + name);
                System.out.println("Path on server: " + serverFile.getPath());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return name;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Not exist");

        }
        return null;
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
        } else {
            return "redirect:/";
        }
    }
}