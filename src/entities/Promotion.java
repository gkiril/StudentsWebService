package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PostUpdate;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.Version;
import javax.persistence.UniqueConstraint;

@Entity(name = "PromotionEntity")

@Table(name = "Promotion", 
	   uniqueConstraints = @UniqueConstraint(columnNames={"OptInitial", "Anne"})
	   )

public class Promotion implements Serializable {

   private static final long serialVersionUID = 1L;
   
   @Id()
   @Column(name = "Prom_ID", nullable = false)
   @GeneratedValue(strategy = GenerationType.AUTO)
   private long id;

   @Basic(optional = false)
   @Column(name = "Anne", length = 9,
      nullable = false, unique = false)
   private String year;
   
   @Basic(optional = false)
   @Column(name = "OptNom", length = 100,
      nullable = false, unique = false)
   private String optionName;
   
   @Basic(optional = false)
   @Column(name = "OptInitial", length = 3,
      nullable = false, unique = false)
   private String optionInitial;
   
   @Basic(optional = false)
   @Column(name = "SpecNom", length = 100,
      nullable = false, unique = false)
   private String specName;
   
   @Basic(optional = false)
   @Column(name = "SpecInitial", length = 3,
      nullable = false, unique = false)
   private String specInitial;
   
   @Basic(optional = false)
   @Column(name = "BeginingYear")
   private int begYear;
   
   public int getBegYear() {
	   return begYear;
   }

   public void setBegYear(int begYear) {
	   this.begYear = begYear;
   }

@Version()

   @Transient
   public static long updateCounter = 0;

   public Promotion() {
      super();
   }

   public Promotion(String yr, int IDspec) {
      super();
      this.year = yr;
      
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
      return "Promotion(id=" + getId() + "," + year + "," +  "," + 
             ",v" + ")";
   }

   public long getId() {
	   return id;
   }

   public String getYear() {
	   return year;
   }

   public String getOptionName() {
	   return optionName;
   }

   public String getOptionInitial() {
	   return optionInitial;
   }

   public String getSpecName() {
	   return specName;
   }

   public String getSpecInitial() {
	   return specInitial;
   }

   public void setId(long id) {
	   this.id = id;
   }

   public void setYear(String year) {
	   this.year = year;
   }

   public void setOptionName(String optionName) {
	   this.optionName = optionName;
   }

   public void setOptionInitial(String optionInitial) {
	   this.optionInitial = optionInitial;
   }

   public void setSpecName(String specName) {
	   this.specName = specName;
   }

   public void setSpecInitial(String specInitial) {
	   this.specInitial = specInitial;
   }
}
