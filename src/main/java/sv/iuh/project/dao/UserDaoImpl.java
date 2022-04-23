/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sv.iuh.project.model.Product;

import sv.iuh.project.model.UserShop;
import sv.iuh.project.util.HibernateUtil;

/**
 *
 * @author Hung
 */
public class UserDaoImpl implements UserDao{

    @Override
    public List<UserShop> getAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM UserShop");
            List<UserShop> list = query.list();
            transaction.commit();
            return list;
        }catch(Exception ex){
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
    
    //create User
    @Override
    public boolean create(UserShop object) {
        
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
    public boolean update(UserShop object) {
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
    public boolean delete(UserShop object) {
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
    public UserShop findById(int userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM UserShop WHERE UserID = :UserID");
            query.setInteger("UserID", userId);
            UserShop obj = (UserShop) query.uniqueResult();
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
    public List<UserShop> getListNav(int start, int limit) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM UserShop");
            query.setFirstResult(start);
            query.setMaxResults(limit);
            List<UserShop> list = query.list();
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
    public List<UserShop> getListByName( String name) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            List<UserShop> obj = new ArrayList<UserShop>();
            
//            if(name == null){
//               Query query = session.createQuery("FROM UserShop");
//               obj = query.list();
//            }
            
            Query query = session.createQuery("FROM UserShop WHERE fullName like:fullName");
            query.setString("fullName", "%" + name + "%");
            obj = query.list();
            
          
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
    
    
}
