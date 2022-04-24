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
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.ProductCategory;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.CommentService;
import sv.iuh.project.service.ProductBrandService;
import sv.iuh.project.service.ProductCategoryService;
import sv.iuh.project.service.ProductService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductBrandService productBrandService;
    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/show")
    public String viewAdmin(ModelMap mm, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                mm.put("list", productService.getListNav(0, 6));
                mm.put("totalItem", productService.totalItem() / 6);
                mm.put("listbrand", productBrandService.getAll());
                return "admin/productmanage";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/show/{page}", method = RequestMethod.GET)
    public String viewProductAdminByPage(ModelMap mm, HttpSession session, @PathVariable("page") int page) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                mm.put("list", productService.getListNav((page - 1) * 6, 6));
                mm.put("totalItem", productService.totalItem() / 6);
                mm.put("listbrand", productBrandService.getAll());
                return "admin/productmanage";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping("/showproductuser")
    public String viewProduct(ModelMap mm) {
        mm.put("list", productService.getAll());
        mm.put("listbrand", productBrandService.getAll());
        mm.put("listcate", productCategoryService.getAll());
       
        return "user/product";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String viewSearch(ModelMap mm, HttpSession session, @RequestParam("brandfilter") int id, @RequestParam(required = false) String name) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                if (name == "" && id == 0) {
                    return "redirect:/product/show";
                } else {
                    mm.put("list", productService.getListByBrand(id, name));
                    mm.put("listbrand", productBrandService.getAll());
                    mm.put("brand", productBrandService.findById(id));
                    mm.put("s", name);
                    return "admin/productmanage";
                }
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/searchpro", method = RequestMethod.GET)
    public String viewSearchUser(ModelMap mm, HttpSession session, @RequestParam("ten") String name) {
        mm.put("list", productService.getListByBrand(0, name));
        mm.put("listbrand", productBrandService.getAll());
        mm.put("listcate", productCategoryService.getAll());
        mm.put("s", name);
        return "user/product";
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public String viewFilterUser(ModelMap mm, HttpSession session, @RequestParam("lb") String lb,
            @RequestParam("lc") String lc, @RequestParam("sort") String sort, HttpServletRequest request) {
        if (request.getParameter("minprice").equals("") && request.getParameter("maxprice").equals("")) {
            mm.put("list", productService.getFilter(lb, lc, 0, 1000000000, sort));
            mm.put("listbrand", productBrandService.getAll());
            mm.put("listcate", productCategoryService.getAll());
            return "user/product";
        } else if (request.getParameter("minprice").equals("")) {
            Integer maxprice = Integer.parseInt(request.getParameter("maxprice"));
            mm.put("list", productService.getFilter(lb, lc, 0, maxprice, sort));
            mm.put("listbrand", productBrandService.getAll());
            mm.put("listcate", productCategoryService.getAll());
            return "user/product";
        } else if (request.getParameter("maxprice").equals("")) {
            Integer minprice = Integer.parseInt(request.getParameter("minprice"));
            mm.put("list", productService.getFilter(lb, lc, minprice, 1000000000, sort));
            mm.put("listbrand", productBrandService.getAll());
            mm.put("listcate", productCategoryService.getAll());
            return "user/product";
        } else {
            Integer minprice = Integer.parseInt(request.getParameter("minprice"));
            Integer maxprice = Integer.parseInt(request.getParameter("maxprice"));
            mm.put("list", productService.getFilter(lb, lc, minprice, maxprice, sort));
            mm.put("listbrand", productBrandService.getAll());
            mm.put("listcate", productCategoryService.getAll());
            return "user/product";
        }
    }

    //Phan trang
    @RequestMapping(value = "/productpage", method = RequestMethod.GET)
    public String viewProductList(ModelMap mm, HttpSession session) {
        mm.put("listbrand", productBrandService.getAll());
        mm.put("list", productService.getListNav(0, 8));
        mm.put("totalItem", productService.totalItem() / 8);
        mm.put("listcate", productCategoryService.getAll());
        return "user/product";
    }

    @RequestMapping(value = "/productpage/{page}", method = RequestMethod.GET)
    public String viewProductListByPage(ModelMap mm, HttpSession session, @PathVariable("page") int page) {
        mm.put("listbrand", productBrandService.getAll());
        mm.put("list", productService.getListNav((page - 1) * 8, 8));
        mm.put("totalItem", productService.totalItem() / 8);
        mm.put("listcate", productCategoryService.getAll());
        return "user/product";
    }

    @RequestMapping(value = "/filterBrand", method = RequestMethod.GET)
    public String filterBrand(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        mm.put("list", productService.getListBrand(id));
        mm.put("b", productBrandService.findById(id));
        mm.put("listbrand", productBrandService.getAll());
        mm.put("listcate", productCategoryService.getAll());
        return "user/product";
    }

    //Luu san pham
    @RequestMapping(value = "save", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request,
            @RequestParam(value = "image") MultipartFile photo) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("des");
        ProductBrand productBrand = productBrandService.findById(Integer.parseInt(request.getParameter("brand")));
        ProductCategory productCategory = productCategoryService.findById(Integer.parseInt(request.getParameter("cate")));
        String warranTyperiod = request.getParameter("warranTyperiod");
        Product product = new Product(name, price, quantity, description, warranTyperiod, saveFile(photo), productBrand, productCategory);
        if ("".equals(request.getParameter("id"))) {
            productService.create(product);
            mm.put("success", "Thêm thành cônng");
            return "redirect:/product/showform";
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            String imgUp = request.getParameter("imgUp");
            if (photo.isEmpty()) {
                product.setImg(imgUp);
            } else {
                product.setImg(saveFile(photo));
            }
            product.setProductID(id);
            productService.update(product);
            mm.put("productCategory", productCategory);
            mm.put("listProductCategory", productCategoryService.getAll());
            String inf = "Sua thanh cong";
            return "redirect:/product/showformupdate?id=" + id + "&success=" + inf + "";
        }
    }

    @RequestMapping(value = "/showform", method = RequestMethod.GET)
    public String viewProductNew(ModelMap mm, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                mm.put("listcate", productCategoryService.getAll());
                mm.put("listbrand", productBrandService.getAll());
                String required = "required";
                mm.put("r", required);
                return "admin/productform";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/showformupdate")
    public String showFormUdate(ModelMap mm, HttpSession session, @RequestParam("id") int id, @RequestParam(required = false) String success) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                Product product = productService.findById(id);
                ProductCategory productCategory = productCategoryService.findById(product.getProductCategoryID().getProductCategoryID());
                ProductBrand productBrand = productBrandService.findById(product.getProductBrandID().getProductBrandID());
                mm.put("listcate", productCategoryService.getAll());
                mm.put("listbrand", productBrandService.getAll());
                mm.put("category", productCategory);
                mm.put("product", product);
                mm.put("brand", productBrand);
                mm.put("success", success);
                return "admin/productform";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    private String saveFile(MultipartFile file) {
        if (null != file && !file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "assets/user/imgproduct");
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
//User

    @RequestMapping(value = "remove")
    public String viewRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                Product p = productService.findById(id);
                if (p != null) {
                    productService.delete(p);
                }
                mm.put("list", productService.getAll());
                return "admin/productmanage";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/detail")
    public String showDetailProduct(ModelMap mm, @RequestParam("id") int id, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop == null) {
            Product product = productService.findById(id);
            mm.put("p", product);
            mm.put("listComment", commentService.getCommentProduct(id));
            return "user/productdetail";
        } else {
            List<Object[]> order = commentService.roleComment(userShop.getUserID(), id);
            Product product = productService.findById(id);
            mm.put("list", order);
            mm.put("p", product);
            mm.put("userShop", userShop);
            mm.put("listComment", commentService.getCommentProduct(id));
            return "user/productdetail";
        }
    }
}
