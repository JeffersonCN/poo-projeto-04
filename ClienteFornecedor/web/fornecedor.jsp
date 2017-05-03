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
                    <%
                        Fornecedor fornecedorEncontrado = null;
                        if(request.getParameter("adicionar") != null) {
                            String nome = request.getParameter("nome");
                            String razaoSocial = request.getParameter("razao_social");
                            String cnpj = request.getParameter("cnpj");
                            String email = request.getParameter("email");
                            String telefone = request.getParameter("telefone");
                            String endereco = request.getParameter("endereco");
                            
                            Fornecedor f = new Fornecedor(nome, razaoSocial, cnpj, email, telefone, endereco);
                            
                            Fornecedor.adicionar(f);                            
                        }
                    %>
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

                        <%
                            for(Fornecedor fornecedor : Fornecedor.getLista()) {
                        %>
                        <tr>
                            <td><%=fornecedor.getId()%></td>
                            <td><%=fornecedor.getNome()%></td>
                            <td><%=fornecedor.getRazaoSocial()%></td>
                            <td><%=fornecedor.getCnpj()%></td>
                            <td><%=fornecedor.getEmail()%></td>
                            <td><%=fornecedor.getTelefone()%></td>
                            <td><%=fornecedor.getEndereco()%></td>
                            <td>
                                <div class="row">
                                    <div class="col-md-6">
                                        <form action="" method="POST">
                                            <input type="number" name="id" value="<%=fornecedor.getId()%>" hidden>
                                            <input class="btn btn-warning btn-sm" type="submit" name="editar" value="Editar">
                                        </form>
                                    </div>
                                    <div class="col-md-6">
                                        <form action="" method="POST">
                                            <input type="number" name="id" value="<%=fornecedor.getId()%>" hidden>
                                            <input class="btn btn-danger btn-sm" type="submit" name="excluir" value="Excluir">
                                        </form>
                                    </div>
                                </div>


                            </td>
                        </tr>

                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
