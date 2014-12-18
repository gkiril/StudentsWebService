package dao;

import static org.junit.Assert.*;

import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import entities.Administrator;
import entities.Etudiant;
import entities.Promotion;

public class TestDao {

	static Dao dao;

	@BeforeClass
	public static void beforeAll() {
		dao = new Dao();
		dao.init();
	}

	@AfterClass
	public static void afterAll() {
		dao.close();
	}

	@Before
	public void setUp() {
		// pour plus tard
	}

	@After
	public void tearDown() {
		// pour plus tard
	}

	@Test
	public void testVide() {
		Promotion promotion = new Promotion();
		promotion.setOptionInitial("IF");
		promotion.setOptionName("Informatique Fondamentalle");
		promotion.setSpecInitial("IF");
		promotion.setSpecName("Informatique Fondamentalle");
		promotion.setYear("2010/2011");

		//dao.addPromotion(promotion);

		Etudiant student = new Etudiant();
		student.setName("Kiril Gashteovski");
		student.seteMail("kire_gasteovski@yahoo.com");
		student.setPromotionID(1);

		//dao.addAdministrator("admin", "admin");

		Administrator admin = new Administrator();
		admin.setAdminUser("jean");
		admin.setAdminPass("simplePassword");
		//dao.addAdministrator(admin);

		//dao.addEtudiant(student);
		//dao.addEtudiant("Bernine Nabil", null, "bernine@yahoo.com", null, 3,
		 //"bnabil", "simplepassword");

		Etudiant e = new Etudiant();
		e = dao.findEtudiantById(1);
		try {
			System.err.println("Student found - Name: " + e.getName());
		} catch (java.lang.NullPointerException ex) {
		}

		// dao.deleteEtudiant(3);

		List<Etudiant> list = dao.findAllEtudiants();
		System.err.println("Total number of students = " + list.size());

		System.err.println("Students found:");
		for (Etudiant etudiant : list) {
			System.out.println(etudiant.getName());
		}
		
		list = dao.findEtudiantByName("Kiril Gashteovski");
		System.err.println("Find students by name: ");
		for (Etudiant etudiant : list) {
			System.out.println(etudiant.getName());
		}

		// Etudiant Stud1 [] = new Etudiant[list.size()];
		// for (int i=0; i<list.size(); i++){
		// Stud1[i] = list.get(i);
		// }

		list = dao.findEtudiantByName("Bernine Nabil");
		System.err
				.println("Total number of students with name Bernine Nabil = "
						+ list.size());

		// Etudiant Students[] = new Etudiant[l.size()];
		// Students = l.toArray(Students);
		// System.out.println("Students found: " + Students[0].getName());

		// Collection<Etudiant> l = dao.findAllEtudiants();

		// List<Etudiant> l = dao.findAllEtudiants();
		// System.out.println(l.toString());

		// Collection<Etudiant> emps = dao.findAllStudents();
		// for (Etudiant e : emps)
		// System.out.println("Found student: " + e);

		//Promotion p = new Promotion();
		//p = dao.findPromotionById(1);
		//try {
			//System.err.println("Promotion id=" + p.getId() + " found: "
				//	+ p.getOptionName());
		//}

		//catch (java.lang.NullPointerException ex) {
			//System.err.println("No such promotion found");
		//}

		//List<Promotion> l = dao.findPromotionByOptionInitial("ARO");
		//System.err.println("Number of promotions ARO found: " + l.size());
		//dao.deletePromotion(1);
		//l = dao.findPromotionBySpecialiteInitial("I2A");
		//System.err.println("Number of promotions I2A found: " + l.size());

		//l = dao.findAllPromotions();
		//System.err.println("Total number of promotions: " + l.size());
		//for (int i=0; i<l.size(); i++)
		//	System.out.println(l.get(i).getOptionName());
		
		//l = dao.findPromotionByOptionInitial("aro");
		//System.err.println("Find promotion by option initial: " + l.size());
		//for (int i=0; i<l.size(); i++)
			//System.out.println(l.get(i).getOptionInitial());
		
		//l = dao.findPromotionBySpecialiteInitial("inf");
		//System.err.println("Find promotion by specialite initial: " + l.size());
		//for (int i=0; i<l.size(); i++)
		//	System.out.println(l.get(i).getSpecInitial());
		
		Etudiant Student = new Etudiant();
		student.setName("John Smith");
		student.seteMail("smith@yahoo.com");
		student.setPromotionID(1);
		// dao.updateEtudiant(3, Student);

		//dao.updateEtudiantName(2, "Marie Claire");
		//dao.updateEtudiantEMail(2, "claire@yahoo.com");
		//dao.updateEtudiantComments(2, "comment");
		//dao.updateEtudiantPromID(2, 20);
		//dao.updateEtudiantWeb(2, "www.google.com");


		//dao.updatePromotionOptInitial(1, "aro");
		//dao.updatePromotionOptNom(1, "Alg. et RO");
		//dao.updatePromotionSpecInitial(1, "inf");
		//dao.updatePromotionSpecNom(1, "informatique");
		//dao.updatePromotionYear(1, "2012/2013");

		//dao.updateAdministratorUserName(1, "jacques");
		//dao.updateAdministratorPassword(1, "NEW PASSWORD");

		// dao.deleteAdministrator(2);

		List<Administrator> adminList = dao.findAllAdministrators();
		System.err.println("Number of administrators: " + adminList.size() + "\n");
		for(int i=0; i<adminList.size(); i++)
			System.out.println(adminList.get(i).getAdminUser());

		adminList = dao.findAdministratorByUserName("jean");
		System.err.println("Number of administrators by username 'jean': "
				+ adminList.size());
		
		adminList = dao.findAdministratorByUserName("jean");
		System.err.println("Find administrator by username: " + adminList.size() + "\n");
		for(int i=0; i<adminList.size(); i++)
			System.err.println(adminList.get(i).getAdminUser());

		admin = dao.findAdministratorById(1);
		//System.err.println("Administrator found by ID=1: "
			//	+ admin.getAdminUser() + "  ");
		
		List<Promotion> promList = dao.findPromotionByBegYear(2009);
		for (int i=0; i<promList.size(); i++)
			System.err.print(promList.get(i).getOptionInitial() + " " + promList.get(i).getYear() + "\n");
		
		//promList = dao.findPromotionByOptBegYear("ARO", 2004);
			//System.err.println(promList.get(0).getOptionInitial() + " " + promList.get(0).getYear());
			
		List<Etudiant> listEt = dao.findEtudiantByEMail("nabil@yahoo.com");
		System.err.println(listEt.get(0).getName() + " " + listEt.get(0).geteMail());
	}
}