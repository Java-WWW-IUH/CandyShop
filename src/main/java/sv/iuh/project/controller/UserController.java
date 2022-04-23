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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.LoginService;
import sv.iuh.project.service.UserService;

/**
 *
 * @author Hung
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private LoginService loginService;

    @RequestMapping("/show")
    public String viewUser(ModelMap mm, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                //mm.put("list", userService.getListNav(0, 6));
                mm.put("list", userService.getListNav(0, 6));
                return "admin/usermanage";
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
                mm.put("list", userService.getListNav((page - 1) * 6, 6));
                return "admin/usermanage";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    // thêm khách hàng
    @RequestMapping(value = "save", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request,
            @RequestParam(value = "image") MultipartFile photo) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullname");
        String userName = request.getParameter("userName");
        String passWord = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Date birth = java.sql.Date.valueOf(request.getParameter("birthday"));

        String address = request.getParameter("address");

        UserShop userShop = new UserShop(email, passWord, userName, address, fullName, saveFile(photo), phone);
        userShop.setRole("user");
        userShop.setActive(0);
        if ("".equals(request.getParameter("id"))) {
            userService.create(userShop);
            mm.put("success", "Thêm thành công");
            return "redirect:/user/showform";
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            String imgUp = request.getParameter("imgUp");
            if (photo.isEmpty()) {
                userShop.setImg(imgUp);
            } else {
                userShop.setImg(saveFile(photo));
            }
            userShop.setUserID(id);
            userService.update(userShop);

            String inf = "Sua thanh cong";
            return "redirect:/user/showformupdate?id=" + id + "&success=" + inf + "";
        }
    }

    //Luu san pham
    @RequestMapping(value = "saveUser", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String viewUserSave(ModelMap mm, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("tendaydu");
        String name = request.getParameter("tendangnhap");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("sodt");
        java.sql.Date birth = java.sql.Date.valueOf(request.getParameter("ngaysinh"));
        String diachi = request.getParameter("diachi");
        String img = request.getParameter("img");
        String address = diachi;
        UserShop userShop = new UserShop();
        userShop.setUserID(id);
        userShop.setFullName(fullName);
        userShop.setUsername(name);
        userShop.setPassword(pass);
        userShop.setEmail(email);
        userShop.setPhoneNumber(phone);
        userShop.setBirthday(birth);
        userShop.setAddress(address);
        userShop.setRole("user");
        userShop.setActive(0);
        userShop.setImg(img);
        userService.update(userShop);
        session.removeAttribute("userlogin");
        UserShop user = loginService.login(name, pass);
        if (user == null) {
            mm.put("mess", "Tài khoản hoặc mật khẩu không chính xác");
            return "user/login";
        }
        session.setAttribute("userlogin", user);
        mm.addAttribute("user", session.getAttribute("userlogin"));
        return "redirect:/user/showformuserupdate";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String viewSearch(ModelMap mm, HttpSession session, @RequestParam(required = true) String name) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                if (name == "") {
                    return "redirect:/user/show";
                } else {
                    mm.put("list", userService.getListByName(name));
//            mm.put("listbrand", productBrandService.getAll());
//            mm.put("brand", productBrandService.findById(id));
                    mm.put("s", name);
                    return "admin/usermanage";
                }
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    //hiển thị form
    @RequestMapping(value = "/showuserform", method = RequestMethod.GET)
    public String viewUserUpdateNew(ModelMap mm, HttpSession session) {
        mm.put("list", userService.getAll());
        String required = "required";
        mm.put("r", required);
        return "user/useredit";
    }

    @RequestMapping(value = "/showform", method = RequestMethod.GET)
    public String viewUserNew(ModelMap mm, HttpSession session) {
        mm.put("list", userService.getAll());
        String required = "required";
        mm.put("r", required);
        return "admin/userform";
    }

    @RequestMapping(value = "/showformupdate")
    public String showFormUdate(ModelMap mm, @RequestParam("id") int id, @RequestParam(required = false) String success) {
        UserShop userShop = userService.findById(id);

        SimpleDateFormat sm = new SimpleDateFormat("yyy-MM-dd");
        String date = sm.format(userShop.getBirthday());
        System.out.println("-------------------------" + date);
        mm.put("userShop", userShop);
        mm.put("date", date);
        mm.put("success", success);
        return "admin/userform";
    }

    @RequestMapping(value = "/showformuserupdate")
    public String showFormUserUdate(ModelMap mm, HttpSession session) {

        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        //int id = Integer.parseInt(request.getParameter("id"));
        //UserShop userShop = userService.findById(id);

        mm.put("userShop", userShop);

        return "user/useredit";
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

    @RequestMapping(value = "remove")
    public String viewRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                UserShop p = userService.findById(id);
                if (p != null) {
                    userService.delete(p);
                }
                mm.put("list", userService.getAll());
                return "admin/usermanage";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

}
