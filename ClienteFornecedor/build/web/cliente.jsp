<%-- 
    Document   : fornecedor
    Created on : May 2, 2017, 11:06:08 PM
    Author     : jeffersoncn
--%>

<%@page import="br.com.fatecpg.models.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Clientes</title>
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
                    <h1>Clientes</h1>
                    <%
                        Cliente clienteEncontrado = null;
                        if(request.getParameter("adicionar") != null || request.getParameter("salvar") != null) {
                            String nome = request.getParameter("nome");
                            String rg = request.getParameter("rg");
                            String cpf = request.getParameter("cpf");
                            String email = request.getParameter("email");
                            String telefone = request.getParameter("telefone");
                            String endereco = request.getParameter("endereco");
                            
                            Cliente c = new Cliente(nome, rg, cpf, email, telefone, endereco);
                            
                            if (request.getParameter("adicionar") != null) {
                                Cliente.adicionar(c);
                            } else {
                                short id = Short.parseShort(request.getParameter("id"));
                                Cliente.editar(c, id);
                            }                            
                        } else if(request.getParameter("editar") != null) {
                            short id = Short.parseShort(request.getParameter("id"));
                            clienteEncontrado = Cliente.clienteById(id);
                        } else if(request.getParameter("excluir") != null) {
                            short id = Short.parseShort(request.getParameter("id"));
                            Cliente.excluir(id);
                        }
                    %>
                    <form class="form" action="" method="POST">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="nome" id="nome" placeholder="Nome" <% if(clienteEncontrado != null) {%> value="<%=clienteEncontrado.getNome()%>" <%}%>>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="rg" id="rg" placeholder="RG" <% if(clienteEncontrado != null) {%> value="<%=clienteEncontrado.getRg()%>" <%}%>>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="cpf" id="cpf" maxlength="14" placeholder="CPF" <% if(clienteEncontrado != null) {%> value="<%=clienteEncontrado.getCpf()%>" <%}%>>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="email" name="email" id="email" placeholder="E-mail" <% if(clienteEncontrado != null) {%> value="<%=clienteEncontrado.getEmail()%>" <%}%>>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="telefone" id="telefone" placeholder="Telefone" <% if(clienteEncontrado != null) {%> value="<%=clienteEncontrado.getTelefone()%>" <%}%>>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="endereco" id="endereco"  placeholder="Endereço" <% if(clienteEncontrado != null) {%> value="<%=clienteEncontrado.getEndereco()%>" <%}%>>
                                </div>
                            </div>
                        </div>
                        
                        <% if(clienteEncontrado == null) {%>
                            <input class="btn btn-primary pull-right" type="submit" name="adicionar" value="Adicionar">
                        <%} else {%>
                            <input type="number" name="id" value="<%=clienteEncontrado.getId()%>" hidden>
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
                            for(Cliente cliente : Cliente.listar()){
                        %>
                        <tr>
                            <td><%=cliente.getId()%></td>
                            <td><%=cliente.getNome()%></td>
                            <td><%=cliente.getRg()%></td>
                            <td><%=cliente.getCpf()%></td>
                            <td><%=cliente.getEmail()%></td>
                            <td><%=cliente.getTelefone()%></td>
                            <td><%=cliente.getEndereco()%></td>
                            <td>
                                <div class="row">
                                    <div class="col-md-6">
                                        <form action="" method="POST">
                                            <input type="number" name="id" value="<%=cliente.getId()%>" hidden>
                                            <input class="btn btn-warning btn-sm" type="submit" name="editar" value="Editar">
                                        </form>
                                    </div>
                                    <div class="col-md-6">
                                        <form action="" method="POST">
                                            <input type="number" name="id" value="<%=cliente.getId()%>" hidden>
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
