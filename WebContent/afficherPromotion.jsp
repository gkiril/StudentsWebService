<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="entities.Etudiant" %>
<%@page import="entities.Promotion"%>
<%@page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Insert title here</title>
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
		
			Integer id = Integer.valueOf(request.getParameter("promID"));

			Dao dao = new Dao();
			dao.init();
		
			Promotion p = dao.findPromotionById(id);
		
			List<Etudiant> list = dao.findEtudiantByPromotion(id);
		
			dao.close();
		%>
	
		<center><h2>Promotion <%= p.getYear() %></h2></center>
		<center><h2>Master Informatique, Specialité <%= p.getSpecInitial() %>, Option <%= p.getOptionInitial() %></h2></center>
		<ul id="menu">
			<li><a href="annuaire.jsp">Annuaire</a></li>
		</ul>
		<div id="contenu">
		
			<%
				for (int i=0; i<list.size(); i++){
			%>
		
				<p>
					<b>Nom:</b> <%out.print(list.get(i).getName()); %> <br>
					<b>E-mail:</b> <%out.print(list.get(i).geteMail()); %><br> 
					<b>Web:</b> <% out.print(list.get(i).getWeb()); %> <br>
					<b>Commentaires: </b> <% out.print(list.get(i).getComment()); %> <br>
					<h2></h2>
				</p>

			<%
				}
			%>
		</div>
	</div>
</body>
</html>