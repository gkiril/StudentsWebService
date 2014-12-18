<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List"%>
<%@page import="entities.Promotion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Modifications des promotions</title>
	
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
		<h1><center>Modifications des promotions</center></h1>
	
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
		
				List<Promotion> list = dao.findAllPromotionsSortedByYear();
				int ind = -1;
			%>
	
			<% for (int i=0; i<list.size(); i++){ 
				if(ind != list.get(i).getBegYear()){
					out.print("<h2>Promotion: " + list.get(i).getYear() +"</h2>");
					ind = list.get(i).getBegYear();
				}
			%>
	
				<form name='editProm<%out.print(i);%>' method='post' action='updateProm2.jsp'>
		
					<b>Specialité:</b> <%out.print(list.get(i).getSpecInitial() + "- " + list.get(i).getSpecName()); %> <br>
					<b>Option:</b> <%out.print(list.get(i).getOptionInitial() + "- " + list.get(i).getOptionName()); %> <br>
					<b>Anné:</b> <% out.print(list.get(i).getYear()); %> <br>
			
					<input type='hidden' name='promID' value='<%out.print(list.get(i).getId()); %>' />
			
					<input type='submit' name='edit<%out.print(i);%>' value='Modifiez'/>
			
				</form>
				<h2></h2>
			<%}
				dao.close();%>	
	
		</div>
		<br><br>
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