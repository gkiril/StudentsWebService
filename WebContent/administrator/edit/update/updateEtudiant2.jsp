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
			<b>Etudiant ID:</b> <% out.print(request.getParameter("etudiantID")); %> 
	
			<%
				Dao dao = new Dao();
				dao.init();
			
				Integer id = Integer.valueOf(request.getParameter("etudiantID"));
			
				Etudiant e = new Etudiant();
			
				e = dao.findEtudiantById(id);
				out.print(e.getName());
			%>
	
			<br><br>
	
			<form name='editEtudiant' method='post' action='updateEtudiant2Confirm.jsp'>
				<b>Nom: </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='text' name='nom' value='<% out.print(e.getName()); %>'/> <br/>
			
				<b>E-mail: </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='text' name='email' value='<% out.print(e.geteMail()); %>'/> <br/>
			
				<b>Web:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='text' name='web' value='<% out.print(e.getWeb()); %>'/> <br/>
			
				<%
					List<Promotion> list = dao.findAllPromotions();
				%>
				<b><i>Promotion:</i></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="promotion">
			
					<%
						for (int i=0; i<list.size(); i++){
					%>
  						<option 
  							<% if (list.get(i).getId()==e.getPromotionID())
  								out.print(" selected ");%>
  							value=<% out.print(list.get(i).getId()); %>><% out.print(list.get(i).getOptionInitial() + " " + list.get(i).getYear()); %> </option>
					<%
						}
					%>
				</select> <br>
			
				<b>Commentaires: &nbsp;&nbsp;&nbsp;&nbsp;</b>
				<input type='text' name='comment' value='<% out.print(e.getComment()); %>'/> <br/>
			
				<input type='hidden' name='E_ID' value='<% out.print(id); %>' />
			
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Modifiez" />
			
			</form>
	
			<br>

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