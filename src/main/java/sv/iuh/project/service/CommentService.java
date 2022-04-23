/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import sv.iuh.project.model.Comment;

/**
 *
 * @author Thanh Hoai
 */
public interface CommentService {
     public boolean create(Comment object);

    // update
    public boolean update(Comment object);

    // delete
    public boolean delete(Comment object);

    // find by id
    public Comment findById(int id);
    // load list brand
    public List<Comment> getAll();
    
    public List<Comment> getCommentUser(int userId,int productId);
    
    public List<Object[]> roleComment(int userId,int productId);
    
    public List<Comment> getCommentProduct(int productId);
}
