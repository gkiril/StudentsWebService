<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List"%>
<%@page import="entities.Etudiant" %>
<%@page import="entities.Promotion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Suppression des etudiants</title>
	
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
		<h1><center>Suppression des etudiants</center></h1>
	
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
		
				Integer studID = Integer.valueOf(request.getParameter("etudiantID"));
			
				Etudiant e = dao.findEtudiantById(studID);
				Promotion p = new Promotion();
			%>
	
			<form name='deleteEtudiant' method='post' action='deleteEtudiantConfirm.jsp'>
				<p>
					<p>
						<b>Nom: </b> <% out.print(e.getName()); %> <br/>
						<b>E-mail:</b> <% out.print(e.geteMail()); %> <br />
						<b>Web:</b> <% out.print(e.getWeb()); %> <br />
						<b>Promotion: </b>
						<% 
						p = dao.findPromotionById(e.getPromotionID());
						out.print(p.getOptionInitial() + " " + p.getYear()); %> <br/>
						<b>Commentaires:</b> <% out.print(e.getComment()); %> <br />
					</p>
				
					<input type='hidden' name='etudiantID' value='<% out.print(e.getId()); %>' />
			
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Supprimez" />
				</p>
			</form>
	
			<p><i><a href="deleteEtudiant.jsp">Supprimez autre etudiant</a></i> </p>
			<p><i><a href="/JavaProject/administrator/administrator.jsp">Admin panel</a></i> </p>
		</div>
		<%
			dao.close();
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