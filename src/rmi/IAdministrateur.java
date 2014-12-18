package rmi;

import entities.Etudiant;
import entities.Promotion;

import java.rmi.RemoteException;

public interface IAdministrateur extends IUtilisateur {
	
	void AddStudent(Etudiant e)throws RemoteException;
	void AddStudent(int ID,String name,String eMail,String web,String comment,int promotionID)throws RemoteException;
	void DeleteStudent(Etudiant e)throws RemoteException;	
	void DeleteStudent(String name,int ID)throws RemoteException;
	void AddPromotion(Promotion p) throws RemoteException;
	void AddPromotion(int ID,String year,int ID_Specialite,int ID_Option) throws RemoteException;
	void DeletePromotion(Promotion p) throws RemoteException;
	void DeletePromotion(int ID,String year,int ID_Specialite,int ID_Option) throws RemoteException;

}
