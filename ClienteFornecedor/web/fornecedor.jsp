<%-- 
    Document   : fornecedor
    Created on : May 2, 2017, 11:06:08 PM
    Author     : jeffersoncn
--%>

<%@page import="br.com.fatecpg.models.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Fornecedores</title>
        <link rel="stylesheet" href="libs/css/bootstrap.css"/>
        <link rel="stylesheet" href="libs/css/bootstrap-theme.css"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1>Fornecedores</h1>
                    <form class="form" action="" method="POST">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="nome" id="nome" placeholder="Nome">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="razao_social" id="razao-social" placeholder="Razão Social">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="cnpj" id="cnpj" maxlength="14" placeholder="CNPJ">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="email" name="email" id="email" placeholder="E-mail">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="telefone" id="telefone" placeholder="Telefone">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="endereco" id="endereco"  placeholder="Endereço">
                                </div>
                            </div>
                        </div>
                        
                        <input class="btn btn-primary pull-right" type="submit" name="adicionar" value="Adicionar">
                        
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>Listagem</h1>
                    <table class="table table-striped">
                        <tr>
                            <th>#</th>
                            <th>Nome</th>
                            <th>Razão Social</th>
                            <th>CNPJ</th>
                            <th>E-mail</th>
                            <th>Telefone</th>
                            <th>Endereço</th>
                            <th>Ação</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
