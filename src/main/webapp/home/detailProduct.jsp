<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="ecommerce.m2i.model.*" %>

<% Product p = new Product(); %>
<% p = (Product) request.getAttribute("productparam"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Product</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/home/home_style.css"/>
</head>
<style>
 
  /********** Block general **********/
  .container {
    display: flex;
    position: absolute;
    top: 80px;
  }

  /********** Cote gauche **********/
  .rectLeft {
    width: 45%;
    display: block;
    text-align: center;
}

 #img_grd {
   width: 420px;
   border-radius: 1rem;
   box-shadow: 3px 3px 6px #b8b9be, -3px -3px 6px #fff;
   margin: 0px 20px 20px 20px;
   padding: 20px;
  }

  .ptt_img { 
    display: flex;
    justify-content: space-around;
    align-items: center;
  }
  
  #img_ptt {
    padding: 20px;
    width: 100px;
    border-radius: 10px;
    box-shadow: 3px 3px 6px #b8b9be, -3px -3px 6px #fff;
   }
   
  /********** Cote droite **********/

  h4, h5{
    font-family: "Nunito Sans";
    font-weight: 500;
    color:dimgray;
    margin-bottom: 10px;
  }

  h2, h3, select, quantite, btn{
    margin-bottom: 10px;
  }

  .btnM , .btnP {
    border-radius: 5px;
    border: none;
    margin: 5px;
    padding: 5px;
    font-size: 15px;
    font-family: "Nunito Sans";
    box-shadow: 3px 3px 6px #b8b9be, -3px -3px 6px #fff;
  }
  
  .btn-addCart {
    display: block;
    margin: 20px 0px;
    width: fit-content;
  }

  .fa {
    margin:5px;
  }

  input[type="number"], select {
    border-radius: 5px;
    border: solid 0.5px #d1d9e6;
    color: #31344b;
    background: #e6e7ee;
    box-shadow: inset 2.5px 2.5px 5px #a1a2a7, inset -2.5px -2.5px 5px #ffffff;
    padding: 5px;
  }
  
  .description {
  	width: 85%;
    text-align: justify;
  }
</style>
<body>
<%@ include file="../fragments/header.jsp" %>

<div class="container">
        <div class="rectLeft">
            <!-- image de la chaussette en grand-->
            <img id="img_grd" src="${pageContext.request.contextPath}/assets/images/chaussettes/<%= p.getImage() %>">
            <!-- petite image de la chaussette choisie + 2 autres images de chaussettes-->
            <div class="ptt_img">
                <img id="img_ptt" src="${pageContext.request.contextPath}/assets/images/chaussettes/avocat.png">
                <img id="img_ptt" src="${pageContext.request.contextPath}/assets/images/chaussettes/cochons.png">
                <img id="img_ptt" src="${pageContext.request.contextPath}/assets/images/chaussettes/foot.png">
            </div>
        </div>
        <div class="rectRight">
            <!--Petit, aligne gauche et en gris-->
            <h5>Home/Chaussettes</h5>
            <!--la il faudrait faire un truc en javascript pour a chaque fois récuperer les bonnes infos-->
            <!--Grand, gras, aligne gauche et noir-->
            <h3><%= p.getTitle() %></h3>
            <!--Tres grand, aligne gauche, gras et noir-->
            <h2><%= p.getPrice() %> €</h2>
            <!-- Formulaire-->
            <form method="post">
                <!--Select size -->
                <select id="monselect">
                    <option value="Select size">Select size</option>
                    <option value="S" selected>S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                </select>
                <div class="quantite">            
                    <input type="button" class="btn btnM" disabled value="-" />
                    <input type="number" aria-valuemin="1" height="100%" autocomplete="off" value="1">
                    <input type="button" class="btn btnP" value="+" />
                </div>        

                    <!--Bouton ajouter au panier-->
                    <a class="btn btn-small btn-primary btn-addCart" href="#" title="Add to cart">
                        <span class="fa fa-cart-plus mr-2"></span> Add to cart
                    </a>
                    <!--Grand, gras, aligne gauche et noir-->
                    <h3>Product Detail </h3>
                    <!--Moyen aligne gauche et noir-->
                    <h4 class="description"><%= p.getDescription() %></h4>
        </div>
    </div>
</body>
</html>