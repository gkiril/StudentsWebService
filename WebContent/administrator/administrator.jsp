<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Panneau d'administrateur</title>
	
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
		
		<h1><center>Panneau d'administrateur</center></h1>
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
		<br>
		
		<div id="contenu">
			<h3>Si vous souhaitez modifier les promotions, cliquez 	<a href="edit/adminPromotions.jsp"> ici</a></h3>
			<h3>Si vous souhaitez modifier les etudiants, cliquez 	<a href="edit/adminEtudiants.jsp"> ici</a></h3>
			<h3>Si vous souhaitez modifier les administrateurs, cliquez <a href="edit/adminAdministrateurs.jsp"> ici</a></h3>
		
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