<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Language" content="fr" />

		<link rel="stylesheet" type="text/css" href="/JavaProject/app.css"/>
</head>
<body>
	<%
    	String username=(String)session.getAttribute("username");
    	if(username!=null){
    		out.println(username+" déconnecté");
        	session.removeAttribute("username");    
    	}
    	else {
         	out.println("Vous n'êtes pas connecté");
    	}
	%> 
	<a href="/JavaProject/annuaire.jsp">Retour</a>
</body>
</html>