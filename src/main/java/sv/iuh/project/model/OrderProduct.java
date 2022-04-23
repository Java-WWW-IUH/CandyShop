/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Thanh Hoai
 */
@Entity
@Table(name = "OrderProduct", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderProduct.findAll", query = "SELECT o FROM OrderProduct o")
    , @NamedQuery(name = "OrderProduct.findByOrderID", query = "SELECT o FROM OrderProduct o WHERE o.orderID = :orderID")
    , @NamedQuery(name = "OrderProduct.findByDateOrder", query = "SELECT o FROM OrderProduct o WHERE o.dateOrder = :dateOrder")
    , @NamedQuery(name = "OrderProduct.findByStatusOrder", query = "SELECT o FROM OrderProduct o WHERE o.statusOrder = :statusOrder")
    , @NamedQuery(name = "OrderProduct.findByTotalMoney", query = "SELECT o FROM OrderProduct o WHERE o.totalMoney = :totalMoney")})
public class OrderProduct implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "OrderID", nullable = false)
    private Integer orderID;
    @Column(name = "DateOrder")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOrder;
    @Column(name = "StatusOrder", length = 50)
    private String statusOrder;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "TotalMoney", precision = 53)
    private Double totalMoney;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID")
    @ManyToOne
    private UserShop userID;
    @OneToMany(mappedBy = "orderID")
    private List<OrderDetail> orderDetailList;

    public OrderProduct() {
    }

    public OrderProduct(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(String statusOrder) {
        this.statusOrder = statusOrder;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public UserShop getUserID() {
        return userID;
    }

    public void setUserID(UserShop userID) {
        this.userID = userID;
    }

    @XmlTransient
    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderProduct)) {
            return false;
        }
        OrderProduct other = (OrderProduct) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.OrderProduct[ orderID=" + orderID + " ]";
    }
    
}
