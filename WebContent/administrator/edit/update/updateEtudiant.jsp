<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List"%>
<%@page import="entities.Etudiant" %>
<%@page import="entities.Promotion" %>

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
		<h1>Modifications des etudiants</h1>
	
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
		
				List<Etudiant> list = dao.findAllEtudiants();
				Promotion p = new Promotion();
				Promotion p1 = new Promotion();
				
				int ind = -1;
				
				for (int i=0; i<list.size(); i++){ 
					if (ind != list.get(i).getPromotionID()){
						p1 = dao.findPromotionById(list.get(i).getPromotionID());
						out.print("<h2>Promotion:" + p1.getOptionInitial() + " " + p1.getYear()+ "</h2>");
						ind = list.get(i).getPromotionID();
					}
			%>
	
				<form name='editEtudiant<% out.print(i); %>' method='post' action='updateEtudiant2.jsp'>
		
					<b>Nom:</b> <%out.print(list.get(i).getName()); %> <br>
					<b>E-mail:</b> <%out.print(list.get(i).geteMail()); %> <br>
					<b>Web:</b> <% out.print(list.get(i).getWeb()); %> <br>
					<b>Promotion: </b> 
					<% 	try{
							p = dao.findPromotionById(list.get(i).getPromotionID());
							out.print(p.getOptionInitial() + " " + p.getYear()); 
						} catch(java.lang.NullPointerException e){
							out.print("Cet promotion n'existe pas");
						}
						%><br>
					<b>Commentaires: </b> <% out.print(list.get(i).getComment()); %> <br>
			
					<input type='hidden' name='etudiantID' value='<%out.print(list.get(i).getId()); %>' />
			
					<input type='submit' name='edit<%out.print(i);%>' value='Modifiez'/>
			
				</form>
				<h2></h2>
			<%} 
		
				dao.close();
			%>	
	
		</div>

		<i><a href="/JavaProject/administrator/administrator.jsp">admin panel</a></i>
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