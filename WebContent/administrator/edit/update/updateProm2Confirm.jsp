<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="entities.Promotion" %>
<%@page import="java.util.List" %>
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
			<h2>Promotion modifié:</h2> 	
			<%	
				Dao dao = new Dao();
				dao.init();
		
				Integer id = Integer.valueOf(request.getParameter("promID"));
				
				Promotion p = new Promotion();
				p = dao.findPromotionById(id);
				
				Integer year = Integer.valueOf(request.getParameter("year"));
	    		List<Promotion> list = dao.findPromotionByOptBegYear(request.getParameter("optInit"), year);
		
				if (list.size()==0){
					dao.updatePromotionOptInitial(id, request.getParameter("optInit"));
					dao.updatePromotionOptNom(id, request.getParameter("optNom"));
					dao.updatePromotionSpecInitial(id, request.getParameter("specInit"));
					dao.updatePromotionSpecNom(id, request.getParameter("specNom"));
					dao.updatePromotionStartYear(id, year);
		
					int year2 = year + 1;
					String anne = Integer.toString(year2);
		
					String anne2 = (request.getParameter("year") + "/" + anne);
					dao.updatePromotionYear(id, anne2);
			%>
	
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Promotion ID: </b> <% out.print(p.getId()); %> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Specialité: </b> <% out.print(p.getSpecInitial()+ "- " + p.getSpecName()); %> <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Option:</b> <% out.print(p.getOptionInitial() + "- " + p.getOptionName()); %> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Année:</b> <% out.print(p.getYear()); %>
			</p>
			<h2></h2>
			<%
				p = dao.findPromotionById(id);
				dao.close();
			%>
			
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Promotion ID: </b> <% out.print(p.getId()); %> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Specialité: </b> <% out.print(p.getSpecInitial()+ "- " + p.getSpecName()); %> <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Option:</b> <% out.print(p.getOptionInitial() + "- " + p.getOptionName()); %> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Année:</b> <% out.print(p.getYear()); %>
			</p>
	
			<p><i><a href="updatePromotion.jsp">Modifiez autre promotion</a></i> </p>
			<p><i><a href="/JavaProject/administrator/administrator.jsp">admin panel</a></i> </p>
		</div>
		<%
    		}
					else {
						out.print("Le promotion n'est pas modifié. Cette promotion déjà existe " + list.get(0).getOptionInitial() + " " + list.get(0).getYear() + "<br>");
						
						dao.close();
		%>
					<p><i><a href="updatePromotion.jsp">Modifiez autre promotion</a></i> </p>
					<p><i><a href="/JavaProject/administrator/administrator.jsp">admin panel</a></i> </p>			
		<%
					}
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