<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List"%>
<%@page import="entities.Administrator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Suppression des administrateurs</title>
	
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
		<h1><center>Suppression des administrateurs</center></h1>
		
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
			
				Integer adminID = Integer.valueOf(request.getParameter("adminID"));
			
				Administrator admin = dao.findAdministratorById(adminID);
			
				dao.close();
			%>
		
			<form name='deleteAdmin' method='post' action='deleteAdminConfirm.jsp'>
				<p>
					<b>Administrateur ID: </b> <% out.print(admin.getAdminID()); %> <br/>
					<b>Administrateur username:</b> <% out.print(admin.getAdminUser()); %> <br />
				
					<input type='hidden' name='adminID' value='<% out.print(admin.getAdminID()); %>' />
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Supprimez" />
				</p>
			</form>
		
			<p><i><a href="deleteAdmin.jsp">Supprimez autre administrateur</a></i> </p>
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