<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List"%>
<%@page import="entities.Promotion" %>
<%@page import="entities.Etudiant" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Suppression des promotions</title>
	
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
		<h1><center>Suppression des promotions</center></h1>
		
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
		
		<div id="contenu">
		
			<%
				Dao dao = new Dao();
				dao.init();
			
				Integer prom = Integer.valueOf(request.getParameter("promID"));
			
				Promotion p = dao.findPromotionById(prom);
			
				dao.deletePromotion(prom);
			%>
		
			<b>Promotion supprimé: </b><br>
		
			<b>Promotion ID:</b> <%out.print(p.getId()); %><br>
			<% out.print(p.getOptionInitial() + " " + p.getYear());%> <br>
		
			<h4>Etudiants supprimé: </h4>
			<h2></h2>
			<%
				List<Etudiant> list = dao.findEtudiantByPromotion(prom); 
			
				for (int i=0; i<list.size(); i++)
					dao.deleteEtudiant(list.get(i).getId());
			
				dao.close();
				
				for (int i=0; i<list.size(); i++)
					{
			%>
				<b>Nom: </b> <%= list.get(i).getName() %> <br>
				<b>Couriel: </b> <%= list.get(i).geteMail() %> <br>
				<h2></h2>
			<%
					}
				
				if (list.size()==0)
					out.print("Aucune étudiant est supprimé");
			%>
			<br><br>
			<i><a href="deletePromotion.jsp">Supprimez autre promotion</a></i> <br>
			<i><a href="/JavaProject/administrator/administrator.jsp">Admin panel</a></i> 
			<br><br>
		</div>
		
		<% dao.close(); 
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