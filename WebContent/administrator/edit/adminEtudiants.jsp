<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Insert title here</title>
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
		<h1><center>Administration des etudiants</center></h1>
	
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
	
		<div id="contenu">
			<ul>
				<li><a href="add/addEtudiant.jsp">Ajoutez nouvel etudiant</a></li>
				<li><a href="update/updateEtudiant.jsp">Modifiez etudiants</a></li>
				<li><a href="delete/deleteEtudiant.jsp"> Supprimer etudiant</a></li>	
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