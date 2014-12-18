package rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IUtilisateur extends Remote {

	void afficherPromotions() throws RemoteException;
	void afficherEtudiants() throws RemoteException;

}
