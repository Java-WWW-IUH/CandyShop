/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sv.iuh.project.dao.CommentDao;
import sv.iuh.project.model.Comment;

/**
 *
 * @author Thanh Hoai
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentDao commentDao;

    @Override
    public boolean create(Comment object) {
        return commentDao.create(object);
    }

    @Override
    public boolean update(Comment object) {
        return commentDao.update(object);
    }

    @Override
    public boolean delete(Comment object) {
        return commentDao.delete(object);
    }

    @Override
    public Comment findById(int id) {
        return commentDao.findById(id);
    }

    @Override
    public List<Comment> getAll() {
        return commentDao.getAll();
    }

    @Override
    public List<Comment> getCommentUser(int userId, int productId) {
        return commentDao.getCommentUser(userId, productId);
    } 

    @Override
    public List<Object[]> roleComment(int userId, int productId) {
        return commentDao.roleComment(userId, productId);
    }

    @Override
    public List<Comment> getCommentProduct(int productId) {
        return commentDao.getCommentProduct(productId);
    }
}
