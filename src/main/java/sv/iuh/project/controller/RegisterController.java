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
import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.RegisterService;

/**
 *
 * @author Hung
 */
@Controller
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/register")
    public String register(HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            return "redirect:/";
        } else {
            return "user/register";
        }

    }

    @RequestMapping(value = "/register/save", method = RequestMethod.POST)
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request, @RequestParam(value = "image") MultipartFile photo) throws UnsupportedEncodingException {

        String fullName = request.getParameter("tendaydu");
        String name = request.getParameter("tendangnhap");
        String pass = request.getParameter("matkhau");
        String email = request.getParameter("email");
        String phone = request.getParameter("sodt");
        Date birth = Date.valueOf(request.getParameter("ngaysinh"));
        String tinh = request.getParameter("calc_shipping_provinces");
        String quan = request.getParameter("calc_shipping_district");
        String diachi = request.getParameter("diachi");

        String address = " DiaChi " + diachi + " - Huyen/Quan " + quan + "- Tinh " + tinh;
        List<UserShop> userShops = registerService.getAll();
        int a = 0, b = 0, c = 0;
        for (UserShop userShop : userShops) {
            if (userShop.getUsername().equalsIgnoreCase(name)) {
                a++;
            }
            if (userShop.getEmail().equalsIgnoreCase(email)) {
                b++;
            }
        }
        if (a > 0 && b > 0) {
            mm.put("err", "Tên tài khoản này đã được sử dụng");
            mm.put("err1", "Email này đã được sử dụng");
            UserShop userShop = new UserShop();
            userShop.setUserID(1);
            userShop.setFullName(fullName);
            userShop.setUsername(name);
            userShop.setPassword(pass);
            userShop.setEmail(email);
            userShop.setPhoneNumber(phone);
            userShop.setBirthday(birth);
            mm.put("u", userShop);
            return "user/register";
        }
        if (a > 0) {
            
            mm.put("err", "Tên tài khoản này đã được sử dụng");
            UserShop userShop = new UserShop();
            userShop.setUserID(1);
            userShop.setFullName(fullName);
            userShop.setUsername(name);
            userShop.setPassword(pass);
            userShop.setEmail(email);
            userShop.setPhoneNumber(phone);
            userShop.setBirthday(birth);
            mm.put("u", userShop);
            return "user/register";
        }
        if (b > 0) {
            mm.put("err1", "Email này đã được sử dụng");
            UserShop userShop = new UserShop();
            userShop.setUserID(1);
            userShop.setFullName(fullName);
            userShop.setUsername(name);
            userShop.setPassword(pass);
            userShop.setEmail(email);
            userShop.setPhoneNumber(phone);
            userShop.setBirthday(birth);
            mm.put("u", userShop);
            return "user/register";
        }
        UserShop userShop = new UserShop();
        userShop.setUserID(1);
        userShop.setFullName(fullName);
        userShop.setUsername(name);
        userShop.setPassword(pass);
        userShop.setEmail(email);
        userShop.setPhoneNumber(phone);
        userShop.setBirthday(birth);
        userShop.setAddress(address);
        userShop.setRole("user");
        userShop.setActive(0);
        userShop.setImg(saveFile(photo));

        registerService.create(userShop);
        //return "user/login";

        //registerService.create(userShop);
        mm.put("success", "Bạn đã đăng kí thành công vui lòng đăng nhập !!!");
        return "user/login";
    }

    private String saveFile(MultipartFile file) {
        if (null != file && !file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "assets/user/imguser");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                String name = String.valueOf(new java.util.Date().getTime() + ".jpg");
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
}
