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
import org.springframework.stereotype.Repository;

import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductBrand;
import sv.iuh.project.model.ProductCategory;
import sv.iuh.project.util.HibernateUtil;

/**
 *
 * @author Thanh Hoai
 */
@Repository
public class ProductCategoryDaoImpl implements ProductCategoryDao{
    @Override
    public boolean create(ProductCategory object) {
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
    public boolean update(ProductCategory object) {
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
    public boolean delete(ProductCategory object) {
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
    public ProductCategory findById(int categoryId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM ProductCategory WHERE ProductCategoryID = :ProductCategoryID");
            query.setInteger("ProductCategoryID", categoryId);
            ProductCategory obj = (ProductCategory) query.uniqueResult();
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
    public List<ProductCategory> getAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM ProductCategory");
            List<ProductCategory> list = query.list();
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
    
    public List<ProductCategory> getListByCategory(int categoryId, String productCategoryName){
    	Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			List<ProductCategory> obj = new ArrayList<ProductCategory>();
			if (categoryId == 0 && productCategoryName != null) {
				Query query = session.createQuery("FROM ProductCategory WHERE ProductCategoryName like:ProductCategoryName");
				query.setString("ProductCategoryName", "%" + productCategoryName + "%");
				obj = query.list();
			}
			if (categoryId != 0 && productCategoryName == null) {
				Query query = session.createQuery("FROM ProductCategory WHERE ProductCategoryID = :ProductCategoryID");
				query.setInteger("ProductCategoryID", categoryId);
				obj = query.list();
			}
			if (categoryId != 0 && productCategoryName != null) {
				Query query = session.createQuery(
						"FROM ProductCategory WHERE ProductCategoryID = :ProductCategoryID and ProductCategoryName like:ProductCategoryName");
				query.setInteger("ProductCategoryID", categoryId);
				query.setString("ProductCategoryName", "%" + productCategoryName + "%");
				obj = query.list();
			}
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			// // session.flush();
			session.close();
		}
		return null;
    }
    
}
