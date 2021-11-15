<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="ecommerce.m2i.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home ShopShette</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/home/home_style.css"/>
</head> 
<body>
	<%@ include file="../fragments/header.jsp" %>
	
	<%! ArrayList<Product> lptpl = new ArrayList<Product>();
%>

	<div class="head">
        <h1>SHOP</h1>
        <p id="data"></p>
        <a class="btn btn-medium btn-primary btn-action" id="open-modal" href="#" title="New product">
            <span class="fa fa-plus mr-2"></span> Nouveau produit
        </a>
    </div>

	
	<div class="products" id="app">
	<%
		lptpl = ( ArrayList ) request.getAttribute("productl"); 
		for(Product p :  lptpl ) {
			%>
		<div class="product">
            <img id="img_chaussete" src="${pageContext.request.contextPath}/assets/images/chaussettes/<%=p.getImage()%>" alt="mon image">
            <button class="btn btn-danger btn-sm btn-delete" id="btnDelete" onclick="supprimer(<%= p.getId() %>)"><i class="fa fa-trash" aria-hidden="true"></i></button> 
            <div class="card-footer">
                <a href="detailProduct?id=<%=p.getId() %>" class="h5"><%=p.getTitle() %></a>
                <div class="price_product">€<%=p.getPrice() %>
                    <a class="btn btn-small btn-primary" href="#" title="Add to cart">
                        <span class="fa fa-shopping-bag mr-2"></span> Add to cart
                    </a>
                </div>
            </div>
        </div>
        <%
		}
        %>
	</div>

    <div id="product-modal" class="modal">
        <div id="modal-content">
            <div id="modal-header">
                <h2>Modale nouvelle chaussette</h2>
                <span class="close-modal">&times;</span>
            </div>
            <form name="monForm" action="http://localhost:8080/ecommerce/HomeServlet" method="post">
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
                    <input type="submit" class="btn btn-medium btn-submit" value="Ajouter">
                </div>
            </form>
        </div>
    </div>

   <!-- <script src="home_main.js"></script> -->
</body>
<script>
	let name = "${user.name}";
	let btnModal = document.getElementById('open-modal');
	let btnDelete = document.getElementById('btnDelete');

	console.log(name);

	if("${user.name}"=="admin") {
		btnModal.style.display = 'block';
		btnDelete.style.display = 'block';
	}
	else {
		btnModal.style.display = 'none';
		btnDelete.style.display = 'none';
	}

	let modal = document.getElementById("product-modal");
	let openModal = document.getElementById("open-modal");
	let closeModal = document.querySelector(".close-modal");

	openModal.addEventListener('click', function() {
	    modal.style.display = 'block';
	})

	closeModal.addEventListener('click', function() {
	    modal.style.display = 'none';
	})

	window.addEventListener('click', function(e) {
	    if(e.target == modal) {
	        modal.style.display = 'none';
	    }
	})
	
	function supprimer(id) {
		if(confirm("Etes-vous sur " + id + " ?")){
			console.log('deleteProduct?id='+id);
			window.location = 'deleteProduct?id='+id;
		}
	}

	
</script>
</html>