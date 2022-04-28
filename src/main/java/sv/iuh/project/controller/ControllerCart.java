/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sv.iuh.project.model.Cart;
import sv.iuh.project.model.OrderDetail;
import sv.iuh.project.model.OrderProduct;
import sv.iuh.project.model.Product;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.OrderDetailService;
import sv.iuh.project.service.OrderManagementService;
import sv.iuh.project.service.ProductService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping(value = "/cart")
public class ControllerCart {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderManagementService orderManagementService;

    @Autowired
    private OrderDetailService orderDetailService;

    @RequestMapping("/show")
    public String viewHome(ModelMap mm) {
        return "user/cart";
    }

    @RequestMapping(value = "/add/{productID}.html", method = RequestMethod.GET)
    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable("productID") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = productService.findById(productId);
        if (product != null) {
            if (cartItems.containsKey(productId)) {
                Cart item = cartItems.get(productId);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + 1);
                cartItems.put(productId, item);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuantity(1);
                cartItems.put(productId, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/";
    }
    
    @RequestMapping(value = "/adds/{productID}.html", method = RequestMethod.POST)
    public String viewAddFromProductDetail(ModelMap mm, HttpSession session, @PathVariable("productID") int productId, HttpServletRequest request){
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = productService.findById(productId);
        //System.out.println("----------------" +request.getParameter("qty") + "---------------");
        int qty = Integer.parseInt(request.getParameter("qty"));
        if (product != null) {
            if (cartItems.containsKey(productId)) {
                Cart item = cartItems.get(productId);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + qty);
                cartItems.put(productId, item);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuantity(qty);
                cartItems.put(productId, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/product/detail?id=" + productId;
    }
    
    @RequestMapping(value = "/addList/{productID}.html", method = RequestMethod.GET)
    public String viewAddFromProductList(ModelMap mm, HttpSession session, @PathVariable("productID") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = productService.findById(productId);
        if (product != null) {
            if (cartItems.containsKey(productId)) {
                Cart item = cartItems.get(productId);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + 1);
                cartItems.put(productId, item);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuantity(1);
                cartItems.put(productId, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/product/productpage";
    }


    @RequestMapping(value = "/increase/{productID}.html", method = RequestMethod.GET)
    public String increaseQuantityInCart(ModelMap mm, HttpSession session, @PathVariable("productID") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = productService.findById(productId);
        Cart item = cartItems.get(productId);
        item.setProduct(product);
        if(product.getQuantity() > item.getQuantity())
            item.setQuantity(item.getQuantity() + 1);
        cartItems.put(productId, item);
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "user/cart";
    }

    @RequestMapping(value = "/decrease/{productID}.html", method = RequestMethod.GET)
    public String decreaseQuantityInCart(ModelMap mm, HttpSession session, @PathVariable("productID") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = productService.findById(productId);
        Cart item = cartItems.get(productId);
        item.setProduct(product);
        if(item.getQuantity() > 1)
            item.setQuantity(item.getQuantity() - 1);
        cartItems.put(productId, item);

        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "user/cart";
    }

    @RequestMapping(value = "/sub/{productId}.html", method = RequestMethod.GET)
    public String viewUpdate(ModelMap mm, HttpSession session, @PathVariable("productId") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        session.setAttribute("myCartItems", cartItems);
        return "user/cart";
    }

    @RequestMapping(value = "/remove/{productId}.html", method = RequestMethod.GET)
    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("productId") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        System.out.println(productId);
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(productId)) {
            cartItems.remove(productId);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "user/cart";
    }

    @RequestMapping("/checkoutshow")
    public String viewPaid(ModelMap mm, HttpSession session) {      
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if(userShop == null)
            return "user/login";
        mm.put("user", userShop);
        return "user/checkout";
    }

    @RequestMapping(value = "/orderItems.html", method = RequestMethod.POST)
    public String orderItems(ModelMap mm, HttpSession session) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        OrderProduct orderProduct = new OrderProduct();
        orderProduct.setDateOrder(new Date());
        orderProduct.setStatusOrder("Chưa thanh toán");
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        orderProduct.setUserID(userShop);
        orderProduct.setTotalMoney(totalPrice(cartItems));
        orderManagementService.create(orderProduct);
        for (Map.Entry<Integer, Cart> entry : cartItems.entrySet()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrderID(orderProduct);
            orderDetail.setProductID(entry.getValue().getProduct());
            orderDetail.setQuantity(entry.getValue().getQuantity());
            orderDetail.setStatusOrderDetail("Chưa thanh toán");
            orderDetail.setDateOrder(new Date());
            orderDetail.tinhTien();
            orderDetailService.create(orderDetail);
            Product product =  productService.findById(entry.getValue().getProduct().getProductID());
            product.setQuantity(product.getQuantity() - entry.getValue().getQuantity());
            productService.update(product);
        }
        cartItems = new HashMap<>();
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", 0);
        session.setAttribute("myCartNum", 0);
        return "user/cart";
    }

    public double totalPrice(HashMap<Integer, Cart> cartItems) {
        int count = 0;
        for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
        }
        return count;
    }
}
