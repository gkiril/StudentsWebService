package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Persistence;
import javax.persistence.PostUpdate;
import javax.persistence.PreUpdate;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.Version;

@Entity(name = "EtudiantEntity")

@Table(name = "etudiant")

public class Etudiant implements Serializable {

   private static final long serialVersionUID = 1L;

   @Id()
   @Column(name = "E_ID", nullable = false)
   @GeneratedValue(strategy = GenerationType.AUTO)
   private long id;

   @Basic(optional = false)
   @Column(name = "Nom", length = 100,
      nullable = false, unique = false)
   private String name;
   
   @Basic(optional = true)
   @Column(name = "Couriel", length = 50,
      nullable = true, unique = true)
   private String eMail;
   
   @Basic(optional = true)
   @Column(name = "Web", length = 50,
      nullable = true, unique = false)
   private String web;
   
   @Basic(optional = true)
   @Column(name = "Comentaires", length = 200,
      nullable = true, unique = false)
   private String comment;

   //foreign key???
   @Basic(optional = false)
   @Column(name = "PromID")
   private int promotionID;
   
   @OneToOne
   @PrimaryKeyJoinColumn(name="PromID", referencedColumnName="PromotionID")
   
   @Version()

   @Transient
   public static long updateCounter = 0;

   public Etudiant() {
      super();
   }

   public Etudiant(String nom, String couriel, String Web, String commentaires, 
		   			int promID, String userName, String pass) {
      super();
      this.name = nom;
      this.eMail = couriel;
      this.web = Web;
      this.comment = commentaires;
      this.promotionID = promID;
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
      return "Etudiant(id=" + getId() + "," + name + "," + eMail + "," + web + "," + comment + "," +
             promotionID + ", Username: " + ")";
   }

   public long getId() {
	   return id;
   }

   public String getName() {
	   return name;
   }

   public String geteMail() {
	   return eMail;
   }

   public String getWeb() {
	   return web;
   }

   public String getComment() {
	   return comment;
   }

   public int getPromotionID() {
	   return promotionID;
   }

   public void setId(long id) {
	   this.id = id;
   }

   public void setName(String name) {
	   this.name = name;
   }

   public void seteMail(String eMail) {
	   this.eMail = eMail;
   }

   public void setWeb(String web) {
	   this.web = web;
   }

   public void setComment(String comment) {
	   this.comment = comment;
   }

   public void setPromotionID(int promotionID) {
	   this.promotionID = promotionID;
   }
}