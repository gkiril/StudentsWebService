<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List" %>
<%@page import="entities.Promotion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Annuaire des anciens étudiants du Master Informatique</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Language" content="fr" />

		<link rel="stylesheet" type="text/css" href="app.css"/>
</head>
<body>
	<div id="conteneur">	
	
		<%
			String username=(String)session.getAttribute("username");
    		if(username!=null){
    			out.println(username );
    	%>
    		<a href="login/logout.jsp">(logout)</a>
    	<%	
    		}
		%>
	
		<center><h1>Annuaire des anciens étudiants du Master Informatique</h1></center>
		<ul id="menu">
			<li><a href="login/login.jsp">Login</a></li>
			<%
				if(username!=null){
			%>
			<li><a href="administrator/administrator.jsp">Admin</a></li>
			<%
				}
			%>
		</ul>
		<div id="contenu">
	
			<%
				Dao dao = new Dao();
				dao.init();
		
				List<Promotion> list = dao.findAllPromotionsSortedByYear();
			%>	
	
			<p>Les anciens étudiants du Master (ancien DESS) (ainsi que les nouveaux) sont invités à envoyer un courrier précisant, leur adresse (courrier, courriel et web) pour mettre à jour l'annuaire. </p>

			<p>Par avance, Merci !</p>
	
	
			<%
				int ind = -1;

				for (int i=0; i<list.size(); i++){
					if(ind != list.get(i).getBegYear()){
						out.print("<h2>Promotion: " + list.get(i).getYear() +"</h2>");
						ind = list.get(i).getBegYear();
					}
					out.print(list.get(i).getSpecName()+ ": "+ list.get(i).getOptionName() + " (" + list.get(i).getYear() + ")");
			%>

				<form name='viewPromotion<% out.print(i); %>' method='post' action='afficherPromotion.jsp'>
					<input type='hidden' name='promID' value='<%out.print(list.get(i).getId()); %>' />
					<input type='submit' name='view<%out.print(i);%>' value='Afficher'/>
				</form>
				<br>
			<%	
						
					}
					out.print("</p>");
				
	
				dao.close();
			%>
		</div>
	</div>
</body>
</html>