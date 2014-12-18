package dao;

import interfaces.AdministratorDAO;
import interfaces.EtudiantDAO;
import interfaces.PromotionDAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import entities.Administrator;
import entities.Etudiant;
import entities.Promotion;

public class Dao implements EtudiantDAO, PromotionDAO, AdministratorDAO {
	private EntityManagerFactory factory = null;

	public void init() {
		factory = Persistence.createEntityManagerFactory("myBase");
	}

	public void close() {
		if (factory != null) {
			factory.close();
		}
	}

	public void addEtudiant(String name, String com, String email, String webSite, int promID) {
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();
		EntityTransaction userTransaction = em.getTransaction();

		userTransaction.begin();

		Etudiant e = new Etudiant();

		e.setName(name);
		e.setComment(com);
		e.seteMail(email);
		e.setWeb(webSite);
		e.setPromotionID(promID);

		em.persist(e);
		userTransaction.commit();
		em.close();
		entityManagerFactory.close();
	}

	public void addEtudiant(Etudiant e) {
		EntityManager em = null;
		
		try{
		
			EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("myBase");
			em = entityManagerFactory.createEntityManager();
			EntityTransaction userTransaction = em.getTransaction();

			userTransaction.begin();

			em.persist(e);
			userTransaction.commit();
		}
		
		finally {
			if (em != null) { 
				em.close();  
			}
		}

	}

	public Etudiant findEtudiantById(long id) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		Etudiant e = em.find(Etudiant.class, id);

		if (e == null) {
			System.err.println("No such student found DAO");
		}

		return e;
	}

	public List<Etudiant> findEtudiantByName(String name) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Etudiant> query = em.createQuery(
				"From EtudiantEntity Where (nom = :nom)", Etudiant.class);
		query.setParameter("nom", name);

		return query.getResultList();
	}
	
	public List<Etudiant> findEtudiantByPromotion(int promID) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Etudiant> query = em.createQuery(
				"From EtudiantEntity Where (PromID = :PromID)", Etudiant.class)
				.setParameter("PromID", promID);

		return query.getResultList();
	}
	
	public List<Etudiant> findEtudiantByEMail(String eMail) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Etudiant> query = em.createQuery(
				"From EtudiantEntity Where (couriel = :couriel)", Etudiant.class);
		query.setParameter("couriel", eMail);

		return query.getResultList();
	}

	public List<Etudiant> findAllEtudiants() {

		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Etudiant> query = em.createQuery("From EtudiantEntity Order By PromID",
				Etudiant.class);

		return query.getResultList();
	}

	public void updateEtudiantName(long id, String name) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Etudiant stud1 = em.find(Etudiant.class, id);
		stud1.setName(name);

		// update
		em.merge(stud1);
		em.getTransaction().commit();
	}

	public void updateEtudiantEMail(long id, String eMail) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Etudiant stud1 = em.find(Etudiant.class, id);
		stud1.seteMail(eMail);

		// update
		em.merge(stud1);
		em.getTransaction().commit();
	}

	public void updateEtudiantComments(long id, String comment) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Etudiant stud1 = em.find(Etudiant.class, id);
		stud1.setComment(comment);

		// update
		em.merge(stud1);
		em.getTransaction().commit();
	}

	public void updateEtudiantPromID(long id, int PromID) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Etudiant stud1 = em.find(Etudiant.class, id);
		stud1.setPromotionID(PromID);

		// update
		em.merge(stud1);
		em.getTransaction().commit();
	}

	public void updateEtudiantWeb(long id, String WebSite) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Etudiant stud1 = em.find(Etudiant.class, id);
		stud1.setWeb(WebSite);

		// update
		em.merge(stud1);
		em.getTransaction().commit();
	}

	public void deleteEtudiant(long id) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		try {
			em.getTransaction().begin();

			Etudiant e = em.find(Etudiant.class, id);
			if (e == null) {
				System.err.println("The student with id=" + id
						+ " can not be erased because it doesn't exist!");
				return;
			}
			em.remove(e);
			em.getTransaction().commit();
			System.err.println("Student with id=" + id + " deleted");
		}

		finally {
			em.close();
		}
	}

	public void addPromotion(String optInit, String optName, String specInit,
			String specName, String year, int debAnne) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();
		EntityTransaction userTransaction = em.getTransaction();

		userTransaction.begin();

		Promotion p = new Promotion();

		p.setOptionInitial(optInit);
		p.setOptionName(optName);
		p.setSpecInitial(specInit);
		p.setSpecName(specName);
		p.setYear(year);
		p.setBegYear(debAnne);

		em.persist(p);
		userTransaction.commit();
		em.close();
		entityManagerFactory.close();
	}

	public void addPromotion(Promotion p) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();
		EntityTransaction userTransaction = em.getTransaction();

		userTransaction.begin();

		em.persist(p);
		userTransaction.commit();
		em.close();
		entityManagerFactory.close();
	}

	public Promotion findPromotionById(long id) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		Promotion p = em.find(Promotion.class, id);

		if (p == null) {
			System.err.println("No such promotion found DAO");
		}

		return p;
	}

	public List<Promotion> findPromotionByOptionInitial(String name) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Promotion> query = em.createQuery(
				"From PromotionEntity Where (OptInitial = :OptInitial)",
				Promotion.class).setParameter("OptInitial", name);

		return query.getResultList();
	}

	public List<Promotion> findPromotionBySpecialiteInitial(String name) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Promotion> query = em.createQuery(
				"From PromotionEntity Where (SpecInitial = :SpecInitial)",
				Promotion.class).setParameter("SpecInitial", name);

		return query.getResultList();
	}
	
	public List<Promotion> findPromotionByBegYear(int year){
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Promotion> query = em.createQuery(
				"From PromotionEntity Where (BeginingYear = :BeginingYear)",
				Promotion.class).setParameter("BeginingYear", year);

		return query.getResultList();
	}
	
	public List<Promotion> findPromotionByOptBegYear(String opt, int year){
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Promotion> query = em.createQuery(
				"From PromotionEntity Where (BeginingYear = :BeginingYear) and (OptInitial = :OptInitial)",
				Promotion.class).setParameter("BeginingYear", year).setParameter("OptInitial", opt);
		return query.getResultList();
	}
	
	public List<Promotion> findAllPromotions() {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Promotion> query = em.createQuery("From PromotionEntity Order By OptInitial",
				Promotion.class);

		return query.getResultList();
	}
	
	public List<Promotion> findAllPromotionsSortedByYear() {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Promotion> query = em.createQuery("From PromotionEntity Order By BeginingYear",
				Promotion.class);

		return query.getResultList();
	}

	public void updatePromotionOptInitial(long id, String optionInitial) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Promotion promo1 = em.find(Promotion.class, id);
		promo1.setOptionInitial(optionInitial);

		// update
		em.merge(promo1);
		em.getTransaction().commit();
	}

	public void updatePromotionOptNom(long id, String optionNom) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Promotion promo1 = em.find(Promotion.class, id);
		promo1.setOptionName(optionNom);

		// update
		em.merge(promo1);
		em.getTransaction().commit();
	}

	public void updatePromotionSpecInitial(long id, String specialiteInitial) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Promotion promo1 = em.find(Promotion.class, id);
		promo1.setSpecInitial(specialiteInitial);

		// update
		em.merge(promo1);
		em.getTransaction().commit();
	}

	public void updatePromotionSpecNom(long id, String speciaNom) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Promotion promo1 = em.find(Promotion.class, id);
		promo1.setSpecName(speciaNom);

		// update
		em.merge(promo1);
		em.getTransaction().commit();
	}

	public void updatePromotionYear(long id, String year) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Promotion promo1 = em.find(Promotion.class, id);
		promo1.setYear(year);

		// update
		em.merge(promo1);
		em.getTransaction().commit();
	}
	
	public void updatePromotionStartYear(long id, int year) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Promotion promo1 = em.find(Promotion.class, id);
		promo1.setBegYear(year);

		// update
		em.merge(promo1);
		em.getTransaction().commit();
	}

	public void deletePromotion(long id) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		try {
			em.getTransaction().begin();

			Promotion p = em.find(Promotion.class, id);
			if (p == null) {
				System.err.println("The promotion with id=" + id
						+ " can not be erased because it doesn't exist!");
				return;
			}
			em.remove(p);
			em.getTransaction().commit();
			System.err.println("Promotion with id=" + id + " deleted");
		}

		finally {
			em.close();
		}
	}

	public void addAdministrator(Administrator admin) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();
		EntityTransaction userTransaction = em.getTransaction();

		userTransaction.begin();

		em.persist(admin);
		userTransaction.commit();
		em.close();
		entityManagerFactory.close();
	}

	public void addAdministrator(String userName, String pass) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();
		EntityTransaction userTransaction = em.getTransaction();

		userTransaction.begin();

		Administrator admin = new Administrator();

		admin.setAdminUser(userName);
		admin.setAdminPass(pass);

		em.persist(admin);
		userTransaction.commit();
		em.close();
		entityManagerFactory.close();
	}

	public void updateAdministratorUserName(long id, String name) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Administrator admin1 = em.find(Administrator.class, id);
		admin1.setAdminUser(name);

		// update
		em.merge(admin1);
		em.getTransaction().commit();
	}

	public void updateAdministratorPassword(long id, String pass) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		em.getTransaction().begin();

		// find
		Administrator admin1 = em.find(Administrator.class, id);
		admin1.setAdminPass(pass);

		// update
		em.merge(admin1);
		em.getTransaction().commit();
	}

	public void deleteAdministrator(long id) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		try {
			em.getTransaction().begin();

			Administrator p = em.find(Administrator.class, id);
			if (p == null) {
				System.err.println("The administrator with id=" + id
						+ " can not be erased because it doesn't exist!");
				return;
			}
			em.remove(p);
			em.getTransaction().commit();
			System.err.println("Administrator with id=" + id + " deleted");
		}

		finally {
			em.close();
		}
	}

	public List<Administrator> findAllAdministrators() {

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Administrator> query = em.createQuery(
				"From AdministratorEntity Order By AdminUser", Administrator.class);

		return query.getResultList();
	}

	public List<Administrator> findAdministratorByUserName(String name) {

		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		TypedQuery<Administrator> query = em.createQuery(
				"From AdministratorEntity Where (AdminUser = :AdminUser)",
				Administrator.class).setParameter("AdminUser", name);

		return query.getResultList();
	}

	public Administrator findAdministratorById(long id) {
		EntityManagerFactory entityManagerFactory = Persistence
				.createEntityManagerFactory("myBase");
		EntityManager em = entityManagerFactory.createEntityManager();

		Administrator e = em.find(Administrator.class, id);

		if (e == null) {
			System.err.println("No such administrator found DAO");
		}

		return e;
	}

	
}
