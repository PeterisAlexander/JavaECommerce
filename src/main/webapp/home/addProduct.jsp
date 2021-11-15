<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/home/home_style.css"/>
</head>
<body>
<%@ include file="../fragments/header.jsp" %>
<div id="product-modal" class="modal">
        <div id="modal-content">
            <div id="modal-header">
                <h2>Modale nouvelle chaussette</h2>
                <span class="close-modal">&times;</span>
            </div>
            <form name="monForm" action="http://localhost:8080/ecommerce/AddProductServlet" method="post">
                <div id="modal-body">
                    <div class="form-group">
                        <label for="title">Dénomination article</label>
                        <input type="text" name="title" id="title" placeholder="Entrer le titre de l'article">
                    </div>
                    <div class="form-group">
                        <label for="price">Prix de l'article</label>
                        <input type="number" name="price" id="price" value="5">
                    </div>
                    <div class="form-group">
                        <label for="image">Importer une image</label>
                        <input type="file" name="image" id="image">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-medium btn-cancel" value="Annuler">
                    <button type="submit" class="btn btn-medium btn-submit">Ajouter</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>