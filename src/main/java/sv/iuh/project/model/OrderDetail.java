/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Thanh Hoai
 */
@Entity
@Table(name = "OrderDetail", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o")
    , @NamedQuery(name = "OrderDetail.findByOrderDetailId", query = "SELECT o FROM OrderDetail o WHERE o.orderDetailId = :orderDetailId")
    , @NamedQuery(name = "OrderDetail.findByQuantity", query = "SELECT o FROM OrderDetail o WHERE o.quantity = :quantity")
    , @NamedQuery(name = "OrderDetail.findByStatusOrderDetail", query = "SELECT o FROM OrderDetail o WHERE o.statusOrderDetail = :statusOrderDetail")})
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "OrderDetailId", nullable = false)
    private Integer orderDetailId;
    @Column(name = "Quantity")
    private Integer quantity;
    @Column(name = "DateOrder")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOrder;
    @Column(name = "Total", precision = 53)
    private Double total;
    @Column(name = "StatusOrderDetail", length = 50)
    private String statusOrderDetail;
    @JoinColumn(name = "OrderID", referencedColumnName = "OrderID")
    @ManyToOne
    private OrderProduct orderID;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    @ManyToOne
    private Product productID;

    public OrderDetail() {
    }

    public OrderDetail(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getStatusOrderDetail() {
        return statusOrderDetail;
    }

    public void setStatusOrderDetail(String statusOrderDetail) {
        this.statusOrderDetail = statusOrderDetail;
    }

    public OrderProduct getOrderID() {
        return orderID;
    }

    public void setOrderID(OrderProduct orderID) {
        this.orderID = orderID;
    }

    public Product getProductID() {
        return productID;
    }

    public void setProductID(Product productID) {
        this.productID = productID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderDetailId != null ? orderDetailId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetail)) {
            return false;
        }
        OrderDetail other = (OrderDetail) object;
        if ((this.orderDetailId == null && other.orderDetailId != null) || (this.orderDetailId != null && !this.orderDetailId.equals(other.orderDetailId))) {
            return false;
        }
        return true;
    }
    
    public void tinhTien(){
        double total = getQuantity() *  getProductID().getPrice();
        setTotal(total);
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.OrderDetail[ orderDetailId=" + orderDetailId + " ]";
    }
    
}
