<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao" %>
<%@page import="entities.Administrator"%>
<%@page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Ajoutation de nouvelles administrateurs</title>
	
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
		<h1><center>Ajoutation de nouvelles administrateurs</center></h1>
	
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
	
		<div id="contenu">
			<h2>Administrateur ajouté:</h2>
			<%
				Administrator admin = new Administrator();
				admin.setAdminUser(request.getParameter("userName"));
				admin.setAdminPass(request.getParameter("pass"));
		
				Dao dao = new Dao();
				dao.init();
		
				List<Administrator> list = dao.findAdministratorByUserName(request.getParameter("userName"));
				
				if(list.size()==0){
					dao.addAdministrator(admin);
		
					dao.close();
			%>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>username:</b> <%= admin.getAdminUser() %><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>password:</b> <%= admin.getAdminPass() %><br>
			<%
				} else out.print("Aucune administrateur ajouté. Administrateur avec cet nom d'utilisateur est déjà ajouté:<br><b> Nom d'utilisateur: "+ list.get(0).getAdminUser() +"</b>");
			%>
			
			<p><i><a href="addAdministrateur.jsp">Ajoutez nouvel administrateur</a></i></p>	
			<p><i><a href="/JavaProject/administrator/administrator.jsp">Admin panel</a></i></p>
		</div>
		<%
    		}
    		else{	
    			out.println("Vous n'êtes pas connecté. Pour vous connecter, cliquez ");
    	%>
           	<a href="/JavaProject/login/login.jsp">ici</a>
    	<%	
    		}
		%>
	</div>
</body>
</html>