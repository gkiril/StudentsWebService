<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
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
			<b>Promotion ID:</b> <%= request.getParameter("promID") %>	<br>
		
			<%
				Dao dao = new Dao();
				dao.init();
			
				Integer prom = Integer.valueOf(request.getParameter("promID"));
			
				Promotion p = dao.findPromotionById(prom);
			
				out.print(p.getOptionInitial() + " " + p.getYear());
			
				dao.close();
			%>
		
			<br><br>
		
			<form name='editProm' method='post' action='updateProm2Confirm.jsp'>
				<b>Specialité: </b> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='text' name='specNom' value='<% out.print(p.getSpecName()); %>'/> <br/>
			
				<b>Specialité initiales: </b> &nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='specInit' value='<% out.print(p.getSpecInitial()); %>'/> <br/>
			
				<b>Option: </b> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='text' name='optNom' value='<% out.print(p.getOptionName()); %>'/> <br/>
			
				<b>Option initiales: </b> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='text' name='optInit' value='<% out.print(p.getOptionInitial()); %>'/> <br/>
			
				<b>Anné:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="year">
  					<option <%if (p.getBegYear()==2011) out.print(" selected "); %>value=2011>2011/2012</option>
  					<option <%if (p.getBegYear()==2010) out.print(" selected "); %>value=2010>2010/2011</option>
  					<option <%if (p.getBegYear()==2009) out.print(" selected "); %>value=2009>2009/2010</option>
  					<option <%if (p.getBegYear()==2008) out.print(" selected "); %>value=2008>2008/2009</option>
  					<option <%if (p.getBegYear()==2007) out.print(" selected "); %>value=2007>2007/2008</option>
  					<option <%if (p.getBegYear()==2006) out.print(" selected "); %>value=2006>2006/2007</option>
  					<option <%if (p.getBegYear()==2005) out.print(" selected "); %>value=2005>2005/2006</option>
				</select> <br><br>
			
				<input type='hidden' name='promID' value='<% out.print(p.getId()); %>' />
			
				<input type="submit" value="Modifiez" />
			</form>
						
			<p><i><a href="updatePromotion.jsp">Modifiez autre promotion</a></i> </p>
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