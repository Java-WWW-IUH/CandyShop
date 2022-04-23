/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Contact", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Contact.findAll", query = "SELECT c FROM Contact c")
    , @NamedQuery(name = "Contact.findByContactID", query = "SELECT c FROM Contact c WHERE c.contactID = :contactID")
    , @NamedQuery(name = "Contact.findByUserContactName", query = "SELECT c FROM Contact c WHERE c.userContactName = :userContactName")
    , @NamedQuery(name = "Contact.findByContactEmail", query = "SELECT c FROM Contact c WHERE c.contactEmail = :contactEmail")
    , @NamedQuery(name = "Contact.findByContactMessage", query = "SELECT c FROM Contact c WHERE c.contactMessage = :contactMessage")})
public class Contact implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ContactID", nullable = false)
    private Integer contactID;
    @Column(name = "UserContactName", length = 50)
    private String userContactName;
    @Column(name = "ContactEmail", length = 50)
    private String contactEmail;
    @Column(name = "ContactMessage", length = 255)
    private String contactMessage;

    public Contact() {
    }

    public Contact(Integer contactID) {
        this.contactID = contactID;
    }

    public Contact(String userContactName, String contactEmail, String contactMessage) {
        this.userContactName = userContactName;
        this.contactEmail = contactEmail;
        this.contactMessage = contactMessage;
    }
    
    

    public Integer getContactID() {
        return contactID;
    }

    public void setContactID(Integer contactID) {
        this.contactID = contactID;
    }

    public String getUserContactName() {
        return userContactName;
    }

    public void setUserContactName(String userContactName) {
        this.userContactName = userContactName;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactMessage() {
        return contactMessage;
    }

    public void setContactMessage(String contactMessage) {
        this.contactMessage = contactMessage;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (contactID != null ? contactID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Contact)) {
            return false;
        }
        Contact other = (Contact) object;
        if ((this.contactID == null && other.contactID != null) || (this.contactID != null && !this.contactID.equals(other.contactID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.Contact[ contactID=" + contactID + " ]";
    }
    
}
