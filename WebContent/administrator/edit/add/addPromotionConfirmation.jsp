<%@page import="java.io.IOException"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="entities.Promotion" %>
<%@page import="dao.Dao"%>
<%@page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Ajoutation de nouvelles promotions</title>
	
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
		<h1><center>Ajoutation de nouvelles promotions</center></h1>
	
		<ul id="menu">
			<li><a href="/JavaProject/annuaire.jsp">Annuaire</a></li>
			<li><a href="/JavaProject/administrator/edit/adminPromotions.jsp">Promotions</a></li>
			<li><a href="/JavaProject/administrator/edit/adminEtudiants.jsp">Etudiants</a></li>
			<li><a href="/JavaProject/administrator/edit/adminAdministrateurs.jsp">Administrateurs</a></li>
		</ul>
	
		<div id="contenu">
			
			<%
				Promotion p = new Promotion();
				p.setSpecName(request.getParameter("specName"));
				p.setSpecInitial(request.getParameter("specInit"));
				p.setOptionName(request.getParameter("optName"));
				p.setOptionInitial(request.getParameter("optInit"));
		
				Integer anne = Integer.valueOf(request.getParameter("year"));
				p.setBegYear(anne);
		
				int anne2 = anne + 1;
				String year = Integer.toString(anne);
				year = (year + "/" + Integer.toString(anne2));
		
				p.setYear(year);
				
				Dao dao = new Dao();
	    		dao.init();
	    		
	    		List<Promotion> list = dao.findPromotionByOptBegYear(p.getOptionInitial(), p.getBegYear());
	    		
	    		if (list.size()==0){
    				dao.addPromotion(p);
    				out.print("<h2>Promotion ajouté:</h2>");
    				%>
    					
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Specialité:</b> <%= p.getSpecName() %>	<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Specialité initiales:</b> <%= p.getSpecInitial() %> 	<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Option:</b> <%= p.getOptionName() %>		<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Option initiales: </b> <%= p.getOptionInitial() %> <br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Année: </b> <%= p.getYear() %> <br><br>
					</p>
    				
    				<% 
	    		}
				
	    		else out.print("Aucune promotion ajouté. Cette promotion déjà existe ");
				dao.close();
			%>

	
			<p><i><a href="addPromotion.jsp">Ajoutez nouvel promotion</a></i></p>	
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