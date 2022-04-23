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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "Product", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProductID", query = "SELECT p FROM Product p WHERE p.productID = :productID")
    , @NamedQuery(name = "Product.findByProductName", query = "SELECT p FROM Product p WHERE p.productName = :productName")
    , @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price")
    , @NamedQuery(name = "Product.findByQuantity", query = "SELECT p FROM Product p WHERE p.quantity = :quantity")
    , @NamedQuery(name = "Product.findByDescription", query = "SELECT p FROM Product p WHERE p.description = :description")
    , @NamedQuery(name = "Product.findByImg", query = "SELECT p FROM Product p WHERE p.img = :img")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ProductID", nullable = false)
    private Integer productID;
    
    @Column(name = "ProductName", length = 100)
    private String productName;
    
    @Column(name = "Price")
    private Integer price;
    
    @Column(name = "Quantity")
    private Integer quantity;
    
//    @Column(name = "Color", length = 50)
//    private String color;
    
    @Column(name = "Description", length = 1000)
    private String description;
    
    @Column(name = "WarranTyperiod", length = 50)
    private String warranTyperiod;
    
    @Column(name = "img", length = 255)
    private String img;
    
//    @Column(name = "Sensor", length = 150)
//    private String sensor;
//    @Column(name = "Iso", length = 150)
//    private String iso;
//    @Column(name = "Resolution", length = 150)
//    private String resolution;
//    @Column(name = "Sizephoto", length = 150)
//    private String sizephoto;
//    @Column(name = "Micro", length = 150)
//    private String micro;
//    @Column(name = "Metering", length = 150)
//    private String metering;
    
    @OneToMany(mappedBy = "productID")
    private List<OrderDetail> orderDetailList;
    @OneToMany(mappedBy = "productID")
    private List<Comment> commentList;
    @JoinColumn(name = "ProductBrandID", referencedColumnName = "ProductBrandID")
    @ManyToOne
    private ProductBrand productBrandID;
    @JoinColumn(name = "ProductCategoryID", referencedColumnName = "ProductCategoryID")
    @ManyToOne
    private ProductCategory productCategoryID;

    public Product() {
    }


    public Product(String productName, Integer price, Integer quantity, String description, String warranTyperiod,
			String img, ProductBrand productBrandID, ProductCategory productCategoryID) {
		super();
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
		this.description = description;
		this.warranTyperiod = warranTyperiod;
		this.img = img;
		this.productBrandID = productBrandID;
		this.productCategoryID = productCategoryID;
	}





	public Integer getProductID() {
		return productID;
	}



	public void setProductID(Integer productID) {
		this.productID = productID;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public Integer getPrice() {
		return price;
	}



	public void setPrice(Integer price) {
		this.price = price;
	}



	public Integer getQuantity() {
		return quantity;
	}



	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getWarranTyperiod() {
		return warranTyperiod;
	}



	public void setWarranTyperiod(String warranTyperiod) {
		this.warranTyperiod = warranTyperiod;
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public List<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}



	public void setOrderDetailList(List<OrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}



	@XmlTransient
    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public ProductBrand getProductBrandID() {
        return productBrandID;
    }

    public void setProductBrandID(ProductBrand productBrandID) {
        this.productBrandID = productBrandID;
    }

    public ProductCategory getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(ProductCategory productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productID != null ? productID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productID == null && other.productID != null) || (this.productID != null && !this.productID.equals(other.productID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.Product[ productID=" + productID + " ]";
    }
    
}
