<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="entities.Etudiant" %>
<%@page import="entities.Promotion" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Modifications des etudiants</title>
	
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
	
		<h1><center>Modifications des etudiants</center></h1>
	
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
	
		<div id="contenu">
			<h2><b>Etudiant ID:</b> <% out.print(request.getParameter("E_ID")); %></h2>
	
			<%
				Dao dao = new Dao();
				dao.init();
		
				Integer id = Integer.valueOf(request.getParameter("E_ID"));
				Etudiant e = new Etudiant();
				e = dao.findEtudiantById(id);
				
				Integer PromID = Integer.valueOf(request.getParameter("promotion"));
				Promotion p = new Promotion();
				p = dao.findPromotionById(e.getPromotionID());
		
				List<Etudiant> list = dao.findEtudiantByEMail(request.getParameter("email"));
				
				if (list.size()!=0)
					if (list.get(0).getId()==id)
						list.remove(0);
				
				if (list.size()==0){
					dao.updateEtudiantName(id, request.getParameter("nom"));
					dao.updateEtudiantEMail(id, request.getParameter("email"));
					dao.updateEtudiantWeb(id, request.getParameter("web"));
		
					dao.updateEtudiantPromID(id, PromID);
		
					dao.updateEtudiantComments(id, request.getParameter("comment"));
			%>
					<h3>Anciennes données pour l'étudiant:</h3>
					<p>
						<b>Nom: </b> <% out.print(e.getName()); %> <br/>
						<b>E-mail:</b> <% out.print(e.geteMail()); %> <br />
						<b>Web:</b> <% out.print(e.getWeb()); %> <br />
						<b>Promotion: </b> <% out.print(p.getOptionInitial() + " " + p.getYear()); %> <br/>
						<b>Commentaires:</b> <% out.print(e.getComment()); %> <br />
					</p>
					<h3>Nouvelles données pour l'étudiant: </h3>
			<% 
					e = dao.findEtudiantById(id);
					p = dao.findPromotionById(PromID);
					dao.close();
			%>
					<p>
						<b>Nom: </b> <% out.print(e.getName()); %> <br/>
						<b>E-mail:</b> <% out.print(e.geteMail()); %> <br />
						<b>Web:</b> <% out.print(e.getWeb()); %> <br />
						<b>Promotion: </b> <% out.print(p.getOptionInitial() + " " + p.getYear()); %> <br/>
						<b>Commentaires:</b> <% out.print(e.getComment()); %> <br />
					</p>
			<%
				}
				else
					out.print("L'étudiant n'est pas modifié. Etudiant avec cet email déjà existe:<b> " + list.get(0).getName() + " " + list.get(0).geteMail() + "</b><br>");

			%>
					<p><i><a href="updateEtudiant.jsp">Modifiez autre etudiant</a></i> </p>
					<p><i><a href="/JavaProject/administrator/administrator.jsp">Admin panel</a></i> </p>
		
			<%
				dao.close();
			%>
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