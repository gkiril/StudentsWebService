<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Language" content="fr" />

		<link rel="stylesheet" type="text/css" href="/JavaProject/app.css"/>
</head>
</head>
<body>
	<div id="conteneur">	
		<div id="contenu">
			<h1>LOGIN FORM</h1>
	
			<%
        		String myname =  (String)session.getAttribute("username");
       
        		if(myname!=null){
             		out.println("Bienvenue  "+myname+"  , <a href=\"logout.jsp\" >Logout</a>");
            	}
        		else {
            %>
            
            <form action="checkLogin.jsp">
                <table>
                    <tr>
                        <td> Username  : </td><td> <input name="username" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" size=15 type="password" /> </td> 
                    </tr>
                </table>
                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="login" />
            </form>
    		
    		<% 
       			}
    		%>
    		<br>
    		<p>Pour aller dans l'annuaire de promotions, cliquez <a href="/JavaProject/annuaire.jsp">ici</a>
    	</div>
    </div>
</body>
</html>