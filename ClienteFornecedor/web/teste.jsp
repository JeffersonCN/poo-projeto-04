<%-- 
    Document   : index
    Created on : 02/05/2017, 18:58:38
    Author     : Administrador
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.models.Cliente"%>
<%
    String nome = "";
    String cpf = "";
    String rg = "";
    String email = "";
    String telefone = "";
    String endereco = "";
    try {

        nome = request.getParameter("nome");
        cpf = request.getParameter("cpf");
        rg = request.getParameter("rg");
        email = request.getParameter("email");
        telefone = request.getParameter("telefone");
        endereco = request.getParameter("endereco");
        if (nome == null || cpf == null || rg == null || email == null || telefone == null || endereco == null) {
            nome = "erro";
        } else {
            Cliente cliente = new Cliente(nome, cpf, rg, email, telefone, endereco);
            Cliente clienteAdicionado = Cliente.clienteById(Cliente.adicionar(cliente));
        }
    } catch (Exception ex) {

    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="libs/css/bootstrap.min.css">
        <link rel="stylesheet" href="libs/css/font-awesome.min.css">
    </head>
    <body>
        <form method="POST">
            Nome: <input type="text" name="nome">
            <br>
            Email: <input type="text" name="email">
            <br>
            Telefone: <input type="text" name="telefone">
            <br>
            CPF<input type="text" name="cpf">
            <br>
            RG<input type="text" name="rg">
            <br>
            Endereço<input type="text" name="endereco">
            <input type="hidden" name="value" value="incluir">
            <input type="submit">
        </form>
        <%= nome%>
                <h1>
        <% for (Cliente cc : Cliente.listar()) {%>
        <h1><%= cc.getNome()%></h1><br>
        <h1><%= cc.getCpf()%></h1><br>
        <h1><%= cc.getRg()%></h1><br>
        <h1><%= cc.getEmail()%></h1><br>
        <h1><%= cc.getEndereco()%></h1><br>
        <h1><%= cc.getTelefone()%></h1><br>
        <h1><%= cc.getId()%></h1><br>
        <% }%>
    </h1>
        <script type="text/javascript" src="libs/js/bootstrap.min.js"/>
    </body>
</html>
