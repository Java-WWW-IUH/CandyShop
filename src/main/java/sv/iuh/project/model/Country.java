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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Thanh Hoai
 */
@Entity
@Table(name = "country", catalog = "ShopCanDyDatabase", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Country.findAll", query = "SELECT c FROM Country c")
    , @NamedQuery(name = "Country.findById", query = "SELECT c FROM Country c WHERE c.id = :id")
    , @NamedQuery(name = "Country.findByIso", query = "SELECT c FROM Country c WHERE c.iso = :iso")
    , @NamedQuery(name = "Country.findByName", query = "SELECT c FROM Country c WHERE c.name = :name")
    , @NamedQuery(name = "Country.findByNicename", query = "SELECT c FROM Country c WHERE c.nicename = :nicename")
    , @NamedQuery(name = "Country.findByIso3", query = "SELECT c FROM Country c WHERE c.iso3 = :iso3")
    , @NamedQuery(name = "Country.findByNumcode", query = "SELECT c FROM Country c WHERE c.numcode = :numcode")
    , @NamedQuery(name = "Country.findByPhonecode", query = "SELECT c FROM Country c WHERE c.phonecode = :phonecode")})
public class Country implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "iso", nullable = false, length = 2)
    private String iso;
    @Basic(optional = false)
    @Column(name = "name", nullable = false, length = 80)
    private String name;
    @Basic(optional = false)
    @Column(name = "nicename", nullable = false, length = 80)
    private String nicename;
    @Column(name = "iso3", length = 3)
    private String iso3;
    @Column(name = "numcode")
    private Short numcode;
    @Basic(optional = false)
    @Column(name = "phonecode", nullable = false)
    private int phonecode;

    public Country() {
    }

    public Country(Integer id) {
        this.id = id;
    }

    public Country(Integer id, String iso, String name, String nicename, int phonecode) {
        this.id = id;
        this.iso = iso;
        this.name = name;
        this.nicename = nicename;
        this.phonecode = phonecode;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIso() {
        return iso;
    }

    public void setIso(String iso) {
        this.iso = iso;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNicename() {
        return nicename;
    }

    public void setNicename(String nicename) {
        this.nicename = nicename;
    }

    public String getIso3() {
        return iso3;
    }

    public void setIso3(String iso3) {
        this.iso3 = iso3;
    }

    public Short getNumcode() {
        return numcode;
    }

    public void setNumcode(Short numcode) {
        this.numcode = numcode;
    }

    public int getPhonecode() {
        return phonecode;
    }

    public void setPhonecode(int phonecode) {
        this.phonecode = phonecode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Country)) {
            return false;
        }
        Country other = (Country) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.iuh.project.model.Country[ id=" + id + " ]";
    }
    
}
