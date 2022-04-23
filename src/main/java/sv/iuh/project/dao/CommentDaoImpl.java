/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import sv.iuh.project.model.Comment;
import sv.iuh.project.util.HibernateUtil;

/**
 *
 * @author Thanh Hoai
 */
@Repository
public class CommentDaoImpl implements CommentDao {

    @Override
    public boolean create(Comment object) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(object);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.clear();
           //            session.flush();
            session.close();
        }
        return false;
    }

    @Override
    public boolean update(Comment object) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(object);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.clear();
           //            session.flush();
            session.close();
        }
        return false;
    }

    @Override
    public boolean delete(Comment object) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(object);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
           //            session.flush();
            session.close();
        }
        return false;
    }

    @Override
    public Comment findById(int commentId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Comment WHERE CommentID = :CommentID");
            query.setInteger("CommentID", commentId);
            Comment obj = (Comment) query.uniqueResult();
            transaction.commit();
            return obj;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
           //            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public List<Comment> getAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Comment");
            List<Comment> list = query.list();
            transaction.commit();
            return list;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
           //            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public List<Comment> getCommentUser(int UserID, int productId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Comment Where UserID =:UserID and ProductID=:ProductID");
            query.setInteger("UserID", UserID);
            query.setInteger("ProductID", productId);
            List<Comment> list = query.list();
            transaction.commit();
            return list;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
           //            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public List<Object[]> roleComment(int userId,int productId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            String hql = "FROM OrderDetail o LEFT JOIN o.orderID p Where p.userID ="+userId+" and o.productID="+productId+"";
            Query query = session.createQuery(hql);
            
            
            List<Object[]> ord = session.createQuery(hql).list();
            transaction.commit();
            return ord;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
           //            session.flush();
            session.close();
        }
        return null;
    }

    @Override
    public List<Comment> getCommentProduct(int productId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Comment Where ProductID=:ProductID");
            query.setInteger("ProductID", productId);
            List<Comment> list = query.list();
            transaction.commit();
            return list;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
           //            session.flush();
            session.close();
        }
        return null;
    }
}
