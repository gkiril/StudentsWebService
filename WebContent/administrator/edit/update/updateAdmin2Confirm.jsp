<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="entities.Administrator" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Modifications des administrateurs</title>
	
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
		<h1><center>Modifications des administrateurs</center></h1>
	
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
		
		<div id="contenu">
	
			<b>Etudiant ID:</b> <% out.print(request.getParameter("adminID")); %> 
	
			<%
				Dao dao = new Dao();
				dao.init();
		
				Integer id = Integer.valueOf(request.getParameter("adminID"));
		
				List<Administrator> list = dao.findAdministratorByUserName(request.getParameter("userName"));
				
				if(list.size()!=0)
					if(list.get(0).getAdminID()==id)
						list.remove(0);
				
				if (list.size()==0){
					dao.updateAdministratorUserName(id, request.getParameter("userName"));
					dao.updateAdministratorPassword(id, request.getParameter("pass"));
				
					Administrator admin = new Administrator();
					admin = dao.findAdministratorById(id);
		
					dao.close();
			%>
	
					<p>
						Modifications ont été apportées à l'administrateur suivant: <br>
						<b>Admin ID: </b> <% out.print(admin.getAdminID()); %> <br/>
						<b>Username:</b> <% out.print(admin.getAdminUser()); %> <br />
					</p>
			<%
				} else out.print("L'administrateur n'est pas modifié. Administrateur avec ce nom d'utilisateur déjà existe:<br><b> Nom d'utilisateur: " + list.get(0).getAdminUser() + "</b><br>");

			%>

			<p><i><a href="updateAdministrateur.jsp">Modifiez autre administrateur</a></i> </p>
			<p><i><a href="/JavaProject/administrator/administrator.jsp">Admin panel</a></i></p> 
		</div>
		
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
</body>
</html>