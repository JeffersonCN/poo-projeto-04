<%-- 
    Document   : home
    Created on : 02/05/2017, 23:07:30
    Author     : sabino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="libs/img/icon.jpg">
        <link href="libs/css/bootstrap.min.css" rel="stylesheet">
        <link href="libs/css/styles.css" rel="stylesheet">
        <title>Home</title>
    </head>
    <body>
                    <%@ include file="WEB-INF/header.jspf" %>
                    <hr>
                    <div class="inner cover">
                        <h1>Conheça o Grupo</h1>
                        <div class="container-fluid">

                            <hr>
                            <div class="row featurette">
                                <div class="col-md-7">
                                    <h2>Leonardo Sabino</h2>
                                    <p class="lead">Responsável pela criação da Home e das estilizações das páginas.</p>
                                </div>
                                <div class="col-md-5">
                                    <img src="libs/img/leo.jpg" alt="Generic placeholder image">
                                </div>
                            </div>

                            <hr>
                            <div class="row featurette">
                                <div class="col-md-7 col-md-push-5">
                                    <h2 class="featurette" style="padding-left: 43px">Victor Schleumer</h2>
                                    <p class="lead" style="padding-left: 43px;">Responsável pela criação das Classes utilizadas.</p>
                                </div>
                                <div class="col-md-5 col-md-pull-7">
                                    <img src="libs/img/victor.jpg" alt="Generic placeholder image">
                                </div>
                            </div>

                            <hr>

                            <div class="row featurette">
                                <div class="col-md-7">
                                    <h2>Pedro Henrique do Amaral Costa e Silva</h2>
                                    <p class="lead">Responsável pela criação da página de registro dos clientes.</p>
                                </div>
                                <div class="col-md-5">
                                    <img src="libs/img/pedro.jpg" alt="Generic placeholder image">
                                </div>
                            </div>

                            <hr>

                            <div class="row featurette">
                                <div class="col-md-7 col-md-push-5">
                                    <h2 class="featurette" style="padding-left: 43px;">Jefferson Nascimento</h2>
                                    <p class="lead" style="padding-left: 43px;">Responsável pela criação da página de registro dos fornecedores.</p>
                                </div>
                                <div class="col-md-5 col-md-pull-7">
                                    <img src="libs/img/jefferson.jpg" alt="Generic placeholder image">
                                </div>
                            </div>

                            <hr>

                            <div class="row featurette">
                                <div class="col-md-7">
                                    <h2>Cesar Cesario</h2>
                                    <p class="lead">Auxílio na correção de bugs.</p>
                                </div>
                                <div class="col-md-5">
                                    <img src="libs/img/cesar.jpg" alt="Generic placeholder image">
                                </div>
                            </div>
                        </div>
                        <hr>
                        <%@ include file="WEB-INF/footer.jspf" %>                     
    </body>
</html>
