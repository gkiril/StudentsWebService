package rmi;

import java.rmi.RemoteException;

import entities.Etudiant;

public interface IEtudiant extends IUtilisateur {
	Etudiant newEtudiant() throws RemoteException;
}
