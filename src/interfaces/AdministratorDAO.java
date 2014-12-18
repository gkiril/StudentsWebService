package interfaces;

import java.util.List;

import entities.Administrator;

public interface AdministratorDAO {
	//ajoutation
	public void addAdministrator(Administrator admin);
	public void addAdministrator(String userName, String pass);
	
	//modification
	public void updateAdministratorUserName(long id, String name);
	public void updateAdministratorPassword(long id, String pass);
	
	//recherche
	public List<Administrator> findAllAdministrators();
	public List<Administrator> findAdministratorByUserName(String name);
	public Administrator findAdministratorById(long id);
	
	//supression
	public void deleteAdministrator(long id);
	
}
