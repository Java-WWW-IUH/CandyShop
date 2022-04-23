/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Thanh Hoai
 */
@Entity
@Table(name = "ProductCategory", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductCategory.findAll", query = "SELECT p FROM ProductCategory p")
    , @NamedQuery(name = "ProductCategory.findByProductCategoryID", query = "SELECT p FROM ProductCategory p WHERE p.productCategoryID = :productCategoryID")
    , @NamedQuery(name = "ProductCategory.findByProductCategoryName", query = "SELECT p FROM ProductCategory p WHERE p.productCategoryName = :productCategoryName")})
public class ProductCategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ProductCategoryID", nullable = false)
    private Integer productCategoryID;
    @Column(name = "ProductCategoryName", length = 100)
    private String productCategoryName;
    @OneToMany(mappedBy = "productCategoryID")
    private List<Product> productList;

    public ProductCategory() {
    }

    public ProductCategory(Integer productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public Integer getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(Integer productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public String getProductCategoryName() {
        return productCategoryName;
    }

    public void setProductCategoryName(String productCategoryName) {
        this.productCategoryName = productCategoryName;
    }

    @XmlTransient
    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productCategoryID != null ? productCategoryID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductCategory)) {
            return false;
        }
        ProductCategory other = (ProductCategory) object;
        if ((this.productCategoryID == null && other.productCategoryID != null) || (this.productCategoryID != null && !this.productCategoryID.equals(other.productCategoryID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.ProductCategory[ productCategoryID=" + productCategoryID + " ]";
    }
    
}
