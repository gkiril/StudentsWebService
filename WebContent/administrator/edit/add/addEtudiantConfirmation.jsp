<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="entities.Etudiant"%>
<%@page import="entities.Promotion" %>
<%@page import="dao.Dao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Ajoutation de nouvelles etudiants</title>
	
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
		<h1><center>Ajoutation de nouvelles etudiants</center></h1>
	
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
	
		<div id="contenu">
			<h2>Etudiant ajouté:</h2> 
	
			<%
				Etudiant e = new Etudiant();
	
				e.setName(request.getParameter("nom"));
				e.seteMail(request.getParameter("email"));
				e.setComment(request.getParameter("comment"));
				e.setWeb(request.getParameter("web"));
		
				Integer prom = Integer.valueOf(request.getParameter("promotion"));
				e.setPromotionID(prom);
		
				Dao dao = new Dao();
				dao.init();
		
	    		List<Etudiant> list = dao.findEtudiantByEMail(request.getParameter("email"));
				Promotion p = new Promotion();
	    		
	    		if(list.size()==0){
					dao.addEtudiant(e);
				
					p = dao.findPromotionById(e.getPromotionID());
		
					dao.close();
			%>	
	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Nom:</b> <%= e.getName() %>	<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>e-mail:</b> <%= e.geteMail() %>	<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>commentaires:</b> <%= e.getComment() %>	<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>web:</b> <%= e.getWeb() %>	<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>promotion:</b> <% out.print(p.getOptionInitial() + " " + p.getYear()); %>	<br>

			<p></p>
			<% 
	    		}
				
	    		else {
	    			out.print("Aucune etudiant ajouté. Etudiant avec cet email est déjà ajouté:<b> ");
	    			out.print(list.get(0).getName() + " " + list.get(0).geteMail() + "</b>");
	    		}
				dao.close();
			%>
			<p><i><a href="addEtudiant.jsp">Ajoutez nouvel etudiant</a></i></p>
			<p><i><a href="/JavaProject/administrator/administrator.jsp">admin panel</a></i></p>
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