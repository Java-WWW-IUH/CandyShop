/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.LoginService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;
    @RequestMapping(value = "user", method = RequestMethod.POST)
    public String doLogin(ModelMap mm, HttpSession session, HttpServletRequest request) {
        String uname=request.getParameter("uname");
        String password=request.getParameter("pass");
        UserShop user = loginService.login(uname, password);
        if (user == null) {
            mm.put("mess", "Tài khoản hoặc mật khẩu không chính xác");
            return "user/login";
        }
        session.setAttribute("userlogin", user);
        mm.addAttribute("user",session.getAttribute("userlogin"));
        return "redirect:/";
    }
    @RequestMapping(value = "logout")
    public String doLogout(ModelMap mm, HttpSession session, HttpServletRequest request) {
        session.removeAttribute("userlogin");
        return "user/login";
    }
}
