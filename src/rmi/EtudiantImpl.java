package rmi;

import java.rmi.RemoteException;
import java.rmi.server.RMIClientSocketFactory;
import java.rmi.server.RMIServerSocketFactory;
import java.rmi.server.UnicastRemoteObject;

import entities.Etudiant;

public class EtudiantImpl extends UnicastRemoteObject implements IEtudiant{

	protected EtudiantImpl(int port, RMIClientSocketFactory csf,
			RMIServerSocketFactory ssf) throws RemoteException {
		super(port, csf, ssf);
	}

	private static final long serialVersionUID = 1L;

	@Override
	public void afficherPromotions() throws RemoteException {		
	}

	@Override
	public void afficherEtudiants() throws RemoteException {		
	}

	@Override
	public Etudiant newEtudiant() throws RemoteException {
		return null;
	}
	
}
