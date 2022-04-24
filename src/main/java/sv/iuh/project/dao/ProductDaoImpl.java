/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.hibernate.type.StringType;
import org.springframework.stereotype.Repository;

import sv.iuh.project.model.OrderDetail;
import sv.iuh.project.model.Product;
import sv.iuh.project.model.ProductCategory;
import sv.iuh.project.util.HibernateUtil;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override

	public List<Product> getAll() {

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Product");
			List<Product> list = query.list();
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
//           //           //            session.flush();
			session.close();
		}
		return null;

	}

	@Override
	public List<Product> getNewProduct() {

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Product order by productID desc");
			query.setMaxResults(8);
			List<Product> list = query.list();
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
//           //           //            session.flush();
			session.close();
		}
		return null;

	}

	@Override
	public boolean create(Product object) {
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
			// // session.flush();
			session.close();
		}
		return false;
	}

	@Override
	public boolean update(Product object) {
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
			// // session.flush();
			session.close();
		}
		return false;
	}

	@Override
	public boolean delete(Product object) {
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
			// // session.flush();
			session.close();
		}
		return false;
	}

	@Override
	public Product findById(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Product WHERE ProductID = :ProductID");
			query.setInteger("ProductID", id);
			Product obj = (Product) query.uniqueResult();
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

	@Override
	public List<Product> getListNav(int start, int limit) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Product");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Product> list = query.list();
			transaction.commit();
			return list;
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

	@Override
	public Long totalItem() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("select count(p) from Product p");
			Long count = (Long) query.list().get(0);
			transaction.commit();
			return count;
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

	@Override
	public List<Product> getListByBrand(int brandId, String name) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			List<Product> obj = new ArrayList<Product>();
			if (brandId == 0 && name != null) {
				Query query = session.createQuery("FROM Product WHERE ProductName like:ProductName");
				query.setString("ProductName", "%" + name + "%");
				obj = query.list();
			}
			if (brandId != 0 && name == null) {
				Query query = session.createQuery("FROM Product WHERE ProductBrandID = :ProductBrandID");
				query.setInteger("ProductBrandID", brandId);
				obj = query.list();
			}
			if (brandId != 0 && name != null) {
				Query query = session.createQuery(
						"FROM Product WHERE ProductBrandID = :ProductBrandID and ProductName like:ProductName");
				query.setInteger("ProductBrandID", brandId);
				query.setString("ProductName", "%" + name + "%");
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

	@Override
	public List<Product> getListBrand(int brandId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			List<Product> obj = new ArrayList<Product>();
			Query query = session.createQuery("FROM Product WHERE ProductBrandID = :ProductBrandID");
			query.setInteger("ProductBrandID", brandId);
			obj = query.list();
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

	@Override
	public List<Product> getFilter(String brandId, String cateId, int minPrice, int maxPrice, String sort) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			List<Product> obj = new ArrayList<Product>();
			Query query = session.createQuery("FROM Product WHERE ProductBrandID like:ProductBrandID and "
					+ "ProductCategoryID like:ProductCategoryID and " + "Price >=:minPrice and Price <=:maxPrice "
					+ "order by price " + sort);
			query.setString("ProductBrandID", "%" + brandId + "%");
			query.setString("ProductCategoryID", "%" + cateId + "%");
			query.setInteger("minPrice", minPrice);
			query.setInteger("maxPrice", maxPrice);

			obj = query.list();
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

	@Override
	public List<Product> top4Product() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			Query query = session.createNativeQuery("Select Top 4 p.ProductID,p.ProductName,p.Description,p.img ,SUM(od.Quantity) as Tongsoluong\r\n"
					+ "from Product p, OrderDetail od where p.ProductID = od.ProductID\r\n"
					+ "group by p.ProductName,p.Description,p.img,p.ProductID\r\n"
					+ "having SUM(od.Quantity) >=2\r\n"
					+ "order by Tongsoluong desc");
			List<Object[]> res = query.getResultList();
			
			//List<Product> list = (List<Product>) query.list();
			List<Product> list = new ArrayList<Product>();
			
			Iterator it = res.iterator();
			while(it.hasNext()) {
				Object[] line = (Object[]) it.next();
				System.out.println(line.toString());
				Product product = new Product();
				product.setProductID((Integer) line[0]);
				product.setProductName((String) line[1]);
				product.setDescription((String) line[2]);
				product.setImg((String) line[3]);
				
				list.add(product);
			}

			transaction.commit();
			return list;
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
