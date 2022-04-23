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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
//import org.hibernate.validator.constraints.Email;
//import org.hibernate.validator.constraints.NotBlank;
//import org.hibernate.validator.constraints.NotEmpty;


/**
 *
 * @author Thanh Hoai
 */
@Entity
@Table(name = "UserShop", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserShop.findAll", query = "SELECT u FROM UserShop u")
    , @NamedQuery(name = "UserShop.findByUserID", query = "SELECT u FROM UserShop u WHERE u.userID = :userID")
    , @NamedQuery(name = "UserShop.findByActive", query = "SELECT u FROM UserShop u WHERE u.active = :active")
    , @NamedQuery(name = "UserShop.findByEmail", query = "SELECT u FROM UserShop u WHERE u.email = :email")
    , @NamedQuery(name = "UserShop.findByPassword", query = "SELECT u FROM UserShop u WHERE u.password = :password")
    , @NamedQuery(name = "UserShop.findByUsername", query = "SELECT u FROM UserShop u WHERE u.username = :username")
    , @NamedQuery(name = "UserShop.findByRole", query = "SELECT u FROM UserShop u WHERE u.role = :role")
    , @NamedQuery(name = "UserShop.findByAddress", query = "SELECT u FROM UserShop u WHERE u.address = :address")
    , @NamedQuery(name = "UserShop.findByBirthday", query = "SELECT u FROM UserShop u WHERE u.birthday = :birthday")
    , @NamedQuery(name = "UserShop.findByFullName", query = "SELECT u FROM UserShop u WHERE u.fullName = :fullName")
    , @NamedQuery(name = "UserShop.findByImg", query = "SELECT u FROM UserShop u WHERE u.img = :img")
    , @NamedQuery(name = "UserShop.findByPhoneNumber", query = "SELECT u FROM UserShop u WHERE u.phoneNumber = :phoneNumber")})
public class UserShop implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "UserID", nullable = false)
    private Integer userID;
    @Column(name = "Active")
    private Integer active;
    @Column(name = "Email", length = 50)
    //@Email(message = "Email không được trống")
   
    private String email;
    @Column(name = "Password", length = 50)
    //@NotBlank(message = "Mật khẩu không được trống")
    private String password;
    @Column(name = "Username", length = 50)
    //@NotBlank(message="Tài khoản không được trống")
    private String username;
    @Column(name = "Role", length = 50)
    private String role;
    @Column(name = "Addresss", length = 100)
    private String address;
    @Column(name = "Birthday")
    @Temporal(TemporalType.TIMESTAMP)
    //@Past
    //@NotBlank(message = "Ngày sinh không trống và trước ngày hiện tại")
    private Date birthday;
    @Column(name = "FullName", length = 50)
    private String fullName;
    @Column(name = "Img", length = 255)
    private String img;
    @Column(name = "PhoneNumber", length = 50)

    //@NotEmpty(message = "Số điện thoại không được trống")
    
    private String phoneNumber;
    @OneToMany(mappedBy = "userID")
    private List<OrderProduct> orderProductList;
    @OneToMany(mappedBy = "userID")
    private List<Comment> commentList;

    public UserShop() {
    }

    public UserShop(String email, String password, String username, String address,  String fullName, String img, String phoneNumber) {
        this.email = email;
        this.password = password;
        this.username = username;
        this.address = address;
        //this.birthday = birthday;
        this.fullName = fullName;
        this.img = img;
        this.phoneNumber = phoneNumber;
    }
    
   
     public UserShop(String email, String password, String address,  String fullName, String img, String phoneNumber) {
        this.email = email;
        this.password = password;
        //this.username = username;
        this.address = address;
        //this.birthday = birthday;
        this.fullName = fullName;
        this.img = img;
        this.phoneNumber = phoneNumber;
    }

    public UserShop(Integer userID) {
        this.userID = userID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @XmlTransient
    public List<OrderProduct> getOrderProductList() {
        return orderProductList;
    }

    public void setOrderProductList(List<OrderProduct> orderProductList) {
        this.orderProductList = orderProductList;
    }

    @XmlTransient
    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userID != null ? userID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserShop)) {
            return false;
        }
        UserShop other = (UserShop) object;
        if ((this.userID == null && other.userID != null) || (this.userID != null && !this.userID.equals(other.userID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.UserShop[ userID=" + userID + " ]";
    }
    
}
