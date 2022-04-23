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
import sv.iuh.project.model.Comment;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.CommentService;
import sv.iuh.project.service.ProductService;
import sv.iuh.project.service.RegisterService;

/**
 *
 * @author Thanh Hoai
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private ProductService productService;
    @Autowired
    private RegisterService registerService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String viewProductSave(ModelMap mm, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        int productId = Integer.parseInt(request.getParameter("productId"));
        String cmt = request.getParameter("cmt");
        int rating = Integer.parseInt(request.getParameter("rating"));
        Comment comment = new Comment();
        comment.setProductID(productService.findById(productId));
        comment.setUserID(userShop);
        comment.setCommentContent(cmt);
        comment.setVote(rating);
        commentService.create(comment);
        mm.put("listComment", commentService.getCommentProduct(productId));
        return "redirect:/product/detail?id=" + productId + "";
    }

    @RequestMapping(value = "/rep", method = RequestMethod.POST)
    public String viewProductRep(ModelMap mm, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int id = Integer.parseInt(request.getParameter("id"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int vote = Integer.parseInt(request.getParameter("vote"));
        String cmt = request.getParameter("cmt");
        String repcmt = request.getParameter("repCmt");
        Comment comment = new Comment();
        comment.setCommentID(id);
        comment.setRepComment(repcmt);
        comment.setUserID(registerService.findById(userId));
        comment.setCommentContent(cmt);
        comment.setProductID(productService.findById(productId));
        comment.setVote(vote);
        commentService.update(comment);
        mm.put("listComment", commentService.getCommentProduct(productId));
        return "redirect:/product/detail?id=" + productId + "";
    }

    @RequestMapping("/show")
    public String viewHome(ModelMap mm, HttpSession session) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                mm.put("list", commentService.getAll());
                return "admin/commentmanage";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "remove")
    public String viewRemove(ModelMap mm, HttpSession session, @RequestParam("id") int id) {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                Comment p = commentService.findById(id);
                if (p != null) {
                    commentService.delete(p);
                }
                mm.put("list", commentService.getAll());
                return "admin/commentmanage";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/repadmin", method = RequestMethod.POST)
    public String viewProductRepAdmin(ModelMap mm, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
        UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if (userShop != null) {
            if (userShop.getRole().equals("user")) {
                return "redirect:/";
            }
            if (userShop.getRole().equals("admin")) {
                request.setCharacterEncoding("UTF-8");
                int productId = Integer.parseInt(request.getParameter("pId"));
                int id = Integer.parseInt(request.getParameter("id"));
                int userId = Integer.parseInt(request.getParameter("uId"));
                int vote = Integer.parseInt(request.getParameter("vote"));
                String cmt = request.getParameter("cmtC");
                String repcmt = request.getParameter("rep");
                Comment comment = new Comment();
                comment.setCommentID(id);
                comment.setRepComment(repcmt);
                comment.setUserID(registerService.findById(userId));
                comment.setCommentContent(cmt);
                comment.setProductID(productService.findById(productId));
                comment.setVote(vote);
                commentService.update(comment);
                mm.put("listComment", commentService.getCommentProduct(productId));
                return "redirect:/comment/show";
            } else {
                return "redirect:/";
            }
        } else {
            return "redirect:/";
        }

    }
}
