<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="ecommerce.m2i.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main class="container">
<h3>Liste des utilisateurs</h3>

<table class="table table-striped">
<thead>
	<th>ID</th>
	<th>UserName</th>
	<th>Email</th>
	<th>Roles</th>
</thead>
<tbody>

<%! ArrayList<User> userTpl = new ArrayList<User>();
%>

	<%
		userTpl = ( ArrayList ) request.getAttribute("user"); 
		for(User u : userTpl) {
			%>
			
			<tr>
				<td><%= u.getId() %></td>
				<td><%= u.getUsername() %></td>
				<td><%= u.getEmail() %></td>
				<td><%= u.getRoles() %></td>
				<td>
					<a class="btn btn-secondary btn-sm" href="editUser?id=<%= u.getId() %>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
					<button class="btn btn-danger btn-sm" onclick="supprimer(<%= u.getId() %>)"><i class="fa fa-trash-o" aria-hidden="true"></i></button> 
				</td>
			</tr>
			<%
		}
	%>
</tbody>
</table>

<a href="userregister.jsp" class="btn btn-primary">Ajouter un utilisateur</a>

</main>
<%@ include file="../fragments/footer.jsp" %>

<script>
	function supprimer( id ){
		if( confirm("Êtes vous sur ?") ){
			console.log('deleteUser?id='+id  );
			window.location = 'deleteUser?id='+id; 
		}
	}
</script>
</body>
</html>