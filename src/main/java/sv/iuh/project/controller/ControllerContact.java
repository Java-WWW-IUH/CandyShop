/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sv.iuh.project.model.Contact;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.ContactService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping(value = "/contact")
public class ControllerContact {
    
    @Autowired
    private ContactService contactService;
    
    
    @Bean
	public JavaMailSender getMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("trannhathung.130420@gmail.com");
		mailSender.setPassword("hungpro@123");

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		return mailSender;

	}
    
    
    @RequestMapping("/show")
    public String viewHome(ModelMap mm) {
        return "user/contact";
    }
    
    @RequestMapping("/managementShow")
    public String viewHomeAdmin(ModelMap mm, HttpSession session) {
        String link = adminDashboard(session);
        if(link != null)
            return link;
        mm.put("list", contactService.getAll());
        return "admin/ContactManagement";
    }
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String viewSave(ModelMap mm, HttpSession session, HttpServletRequest request, @RequestParam(required = false) String success) throws UnsupportedEncodingException{
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String comment = request.getParameter("comment");
        Contact contact = new Contact(name, email, comment);
        contactService.create(contact);
        mm.put("success", "Phản hồi thành công");
 	
		mailSender("trannhathung.130420@gmail.com", email, "Response from Candy Shop", "Thank you for submitting your feedback to Candy Shop !!! \n "
				+ "This is an autoresponder. Please do not respond. We will contact you");
        
        //return "redirect:/contact/show";
        return "user/contact";
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
    
    public void mailSender(String from, String to, String subject, String content) {
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom(from);
		simpleMailMessage.setTo(to);
		simpleMailMessage.setSubject(to);
		simpleMailMessage.setText(content);
		
		getMailSender().send(simpleMailMessage);
	}
  
}
