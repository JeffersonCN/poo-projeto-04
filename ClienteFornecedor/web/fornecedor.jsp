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
        <link rel="icon" href="libs/img/icon.jpg">
        <link href="libs/css/bootstrap.min.css" rel="stylesheet">
        <link href="libs/css/styles.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="WEB-INF/header.jspf" %>
        <hr>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Fornecedores</h1>
                    <%
                        Fornecedor fornecedorEncontrado = null;
                        if(request.getParameter("adicionar") != null || request.getParameter("salvar") != null) {
                            String nome = request.getParameter("nome");
                            String razaoSocial = request.getParameter("razao_social");
                            String cnpj = request.getParameter("cnpj");
                            String email = request.getParameter("email");
                            String telefone = request.getParameter("telefone");
                            String endereco = request.getParameter("endereco");
                            
                            Fornecedor f = new Fornecedor(nome, razaoSocial, cnpj, email, telefone, endereco);
                            
                            if (request.getParameter("adicionar") != null) {
                                Fornecedor.adicionar(f);
                            } else {
                                short id = Short.parseShort(request.getParameter("id"));
                                Fornecedor.editar(f, id);
                            }                            
                        } else if(request.getParameter("editar") != null) {
                            short id = Short.parseShort(request.getParameter("id"));
                            fornecedorEncontrado = Fornecedor.fornecedorById(id);
                        } else if(request.getParameter("excluir") != null) {
                            short id = Short.parseShort(request.getParameter("id"));
                            Fornecedor.excluir(id);
                        }
                    %>
                    <form class="form" action="" method="POST">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="nome" id="nome" placeholder="Nome" <% if(fornecedorEncontrado != null) {%> value="<%=fornecedorEncontrado.getNome()%>" <%}%>>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="razao_social" id="razao-social" placeholder="Razão Social" <% if(fornecedorEncontrado != null) {%> value="<%=fornecedorEncontrado.getRazaoSocial()%>" <%}%>>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="cnpj" id="cnpj" maxlength="14" placeholder="CNPJ" <% if(fornecedorEncontrado != null) {%> value="<%=fornecedorEncontrado.getCnpj()%>" <%}%>>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="email" name="email" id="email" placeholder="E-mail" <% if(fornecedorEncontrado != null) {%> value="<%=fornecedorEncontrado.getEmail()%>" <%}%>>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="telefone" id="telefone" placeholder="Telefone" <% if(fornecedorEncontrado != null) {%> value="<%=fornecedorEncontrado.getTelefone()%>" <%}%>>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="endereco" id="endereco"  placeholder="Endereço" <% if(fornecedorEncontrado != null) {%> value="<%=fornecedorEncontrado.getEndereco()%>" <%}%>>
                                </div>
                            </div>
                        </div>
                        
                        <% if(fornecedorEncontrado == null) {%>
                            <input class="btn btn-primary pull-right" type="submit" name="adicionar" value="Adicionar">
                        <%} else {%>
                            <input type="number" name="id" value="<%=fornecedorEncontrado.getId()%>" hidden>
                            <input class="btn btn-primary pull-right" type="submit" name="salvar" value="Salvar">
                        <%}%>

                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <hr>
                    <h1>Listagem</h1>
                    <table class="table table-striped table-responsive table-bordered">
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
                    <hr>
    <%@ include file="WEB-INF/footer.jspf" %>                
    </body>
</html>
