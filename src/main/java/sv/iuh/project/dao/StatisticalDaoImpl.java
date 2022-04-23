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
import sv.iuh.project.model.OrderDetail;
import sv.iuh.project.util.HibernateUtil;

/**
 *
 * @author Thanh Hoai
 */
@Repository
public class StatisticalDaoImpl implements StatisticalDao {

    @Override
    public Long totalUserShop() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("select count(u) from UserShop u");
            Long count = (Long) query.list().get(0);
            transaction.commit();
            return count;
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
    public Long totalProductBrand() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("select count(o) from ProductBrand o");
            Long count = (Long) query.list().get(0);
            transaction.commit();
            return count;
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
    public Long totalOrderDetail() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("select count(p) from OrderDetail p");
            Long count = (Long) query.list().get(0);
            transaction.commit();
            return count;
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
    public Long totalProduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("select sum(p.quantity) from Product p");
            Long count = (Long) query.list().get(0);
            transaction.commit();
            return count;
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
    public List<OrderDetail> newFiveOrder() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("from OrderDetail order by orderDetailID desc");
            query.setMaxResults(5);
            List<OrderDetail> orderDetail =  query.list();
            transaction.commit();
            return orderDetail;
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
