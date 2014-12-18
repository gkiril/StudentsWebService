package rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class AnnuaireImpl extends UnicastRemoteObject implements IAnnuaire{

	protected AnnuaireImpl() throws RemoteException {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final long serialVersionUID = 1L;

	@Override
	public IUtilisateur Authentification(String name, String PassWord)
			throws RemoteException {
		
		return null;
	}

}
