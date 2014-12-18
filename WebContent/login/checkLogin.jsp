<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List"%>
<%@page import="entities.Administrator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Language" content="fr" />

		<link rel="stylesheet" type="text/css" href="/JavaProject/app.css"/>
</head>
<body>

	<%
    	String username = request.getParameter("username");
        String password = request.getParameter("password");
        out.println("Vérification de connexion<br>");
        
        
        Dao dao = new Dao();
        dao.init();
        
        List<Administrator> list = dao.findAdministratorByUserName(username);
        
        try{
        	Administrator admin = list.get(0);

        	if (username.equals(admin.getAdminUser()) && password.equals(admin.getAdminPass())) {
        		out.println("Bienvenu " + username);
        		session.setAttribute("username", username);
        	}
        
        	else{
           		out.println("Nom et mot de passe invalide");
        	}
        }
        catch(java.lang.IndexOutOfBoundsException e){
        	out.println("Nom et mot de passe invalide!");
        }
        
	%> 
	<a href="/JavaProject/annuaire.jsp">Retour</a>
</body>
</html>