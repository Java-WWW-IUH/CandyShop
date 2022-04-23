/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.util.HibernateUtil;

/**
 *
 * @author Thanh Hoai
 */
@Repository
public class LoginDaoImpl implements LoginDao{

    @Override
    public UserShop login(String uname, String passwd) {
         Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM UserShop WHERE Username = :uname AND password = :passwd");
            query.setString("uname", uname);
            query.setString("passwd", passwd);
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
    
}
