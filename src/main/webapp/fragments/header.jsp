<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header_style.css"/>

<div class="menu">
        <ul>
            <a id="logo" href="#logo"><img id="img_logo" src="${pageContext.request.contextPath}/assets/images/page_login/logo_shopsette.png"" alt="logo">
                ShopSette</a>
            <div class="links">
                <li id="link_center"><a href="HomeServlet">Accueil</a></li>
                <li id="link_center"><a href="#news">Nouveautés</a></li>
                <li id="link_center"><a href="#contact">Contact</a></li>
            </div>
            <div>
                <li class="dropdown">
                    <span class="dropbtn" id="name">${user.name}</span>
                    <div class="dropdown-content">
                        <a href="#">Profile</a>
                        <a href="#Panier">Panier <span class="badge">5</span></a>
                        <a href="LoginServlet">Déconnexion</a>
                    </div>
                </li>
            </div>
        </ul>
    </div>