package rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IAnnuaire extends Remote {

     IUtilisateur Authentification(String name,String PassWord) throws RemoteException;
     
}