<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Administration d'administrateurs</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="Content-Language" content="fr" />	

	<link rel="stylesheet" type="text/css" href="/JavaProject/app.css"/>
</head>
<body>
	<div id="conteneur">
		<%
		String username=(String)session.getAttribute("username");
    	if(username!=null){
    		out.println(username);
    	%>
        
        <a href="/JavaProject/login/logout.jsp">(logout)</a>
    	
    	<%	
		%>
		<h1><center>Administration d'administrateurs</center></h1>
	
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
	
		<div id="contenu">
			<ul>
				<li><a href="add/addAdministrateur.jsp"> Ajoutez nouvel administrateur</a></li>
				<li><a href="update/updateAdministrateur.jsp">Modifiez administrateur</a></li>
				<li><a href="delete/deleteAdmin.jsp"> Supprimer administrateur</a></li>	
			</ul>
			
			<i><a href="/JavaProject/administrator/administrator.jsp">retour</a></i>
			<br><br> 
			
			<%
    			}
    			else {
       				out.println("Vous n'êtes pas connecté. Pour vous connecter, cliquez ");
    		%>
           		<a href="/JavaProject/login/login.jsp">ici</a>
    		<%	
    			}
			%>
		</div>
	</div>
</body>
</html>