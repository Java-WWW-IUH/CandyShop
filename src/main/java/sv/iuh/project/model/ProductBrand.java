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
@Table(name = "ProductBrand", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductBrand.findAll", query = "SELECT p FROM ProductBrand p")
    , @NamedQuery(name = "ProductBrand.findByProductBrandID", query = "SELECT p FROM ProductBrand p WHERE p.productBrandID = :productBrandID")
    , @NamedQuery(name = "ProductBrand.findByProductBrandName", query = "SELECT p FROM ProductBrand p WHERE p.productBrandName = :productBrandName")
    , @NamedQuery(name = "ProductBrand.findByNationalProduction", query = "SELECT p FROM ProductBrand p WHERE p.nationalProduction = :nationalProduction")})
public class ProductBrand implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ProductBrandID", nullable = false)
    private Integer productBrandID;
    @Column(name = "ProductBrandName", length = 50)
    private String productBrandName;
    @Column(name = "NationalProduction", length = 50)
    private String nationalProduction;
    @Column(name = "img", length = 200)
    private String img;
    @OneToMany(mappedBy = "productBrandID")
    private List<Product> productList;

    public ProductBrand() {
    }

    public ProductBrand(Integer productBrandID) {
        this.productBrandID = productBrandID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getProductBrandID() {
        return productBrandID;
    }

    public void setProductBrandID(Integer productBrandID) {
        this.productBrandID = productBrandID;
    }

    public String getProductBrandName() {
        return productBrandName;
    }

    public void setProductBrandName(String productBrandName) {
        this.productBrandName = productBrandName;
    }

    public String getNationalProduction() {
        return nationalProduction;
    }

    public void setNationalProduction(String nationalProduction) {
        this.nationalProduction = nationalProduction;
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
        hash += (productBrandID != null ? productBrandID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductBrand)) {
            return false;
        }
        ProductBrand other = (ProductBrand) object;
        if ((this.productBrandID == null && other.productBrandID != null) || (this.productBrandID != null && !this.productBrandID.equals(other.productBrandID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.ProductBrand[ productBrandID=" + productBrandID + " ]";
    }
    
}
