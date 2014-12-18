package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PostUpdate;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.Version;

@Entity(name = "AdministratorEntity")

@Table(name = "administrator")

public class Administrator implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id()
	@Column(name = "AdminID", nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long AdminID;
	
	@Basic(optional = false)
	@Column(name="AdminUser", length = 30, nullable = false, unique = true)
	private String adminUser;
	   
	@Basic(optional = false)
	@Column(name="AdminPass", length = 30, nullable = false, unique = false)
	private String AdminPass;

    @Version()
    @Transient
    public static long updateCounter = 0;
    
    public Administrator() {
        super();
     }
    
    public Administrator(String userName, String pass) {
    	super();
    	this.adminUser = userName;
    	this.AdminPass = pass;
    }
    
    @PreUpdate
    public void beforeUpdate() {
       System.err.println("PreUpdate of " + this);
    }

    @PostUpdate
    public void afterUpdate() {
       System.err.println("PostUpdate of " + this);
       updateCounter++;
    }
    
    @Override
    public String toString() {
       return "Administrator(id=" + getAdminID() + ", Username: " + getAdminUser() + ")";
    }
    
	public long getAdminID() {
		return AdminID;
	}

	public String getAdminUser() {
		return adminUser;
	}

	public void setAdminID(long adminID) {
		AdminID = adminID;
	}

	public void setAdminUser(String adminUser) {
		this.adminUser = adminUser;
	}

	public void setAdminPass(String adminPass) {
		AdminPass = adminPass;
	}
	
	public String getAdminPass(){
		return this.AdminPass;
	}
}
