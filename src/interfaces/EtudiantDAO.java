package interfaces;

import java.util.List;

import entities.Etudiant;

public interface EtudiantDAO {
	//ajoutation
	public void addEtudiant(String name, String com, String email, String webSite, int promID);
	public void addEtudiant(Etudiant e);
	
	//recherche
	public Etudiant findEtudiantById(long id);
	public List<Etudiant> findAllEtudiants();
	public List<Etudiant> findEtudiantByName(String name);
	public List<Etudiant> findEtudiantByEMail(String eMail);
	public List<Etudiant> findEtudiantByPromotion(int promID);
	
	//modification
	public void updateEtudiantName(long id, String name);
	public void updateEtudiantEMail(long id, String eMail);
	public void updateEtudiantComments(long id, String comment);
	public void updateEtudiantPromID(long id, int PromID);
	public void updateEtudiantWeb(long id, String WebSite);
	
	//supprimation
	public void deleteEtudiant(long id);
}
