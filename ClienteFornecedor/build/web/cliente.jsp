<%-- 
    Document   : cliente
    Created on : 02/05/2017, 19:48:13
    Author     : pedro
--%>

<%@page import="br.com.fatecpg.models.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cliente</h1>
        
        <form>
            <input type="text" name="value">
            <input type="submit" value="Envasa">
        </form>
        <div>
                Novo Cliente
                <form>
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
                    <input type="hidden" name="incluir" value="incluir">
                    <input type="submit">
                </form>
            <br/>
        </div>
        <%
            try {
                if (request.getParameter("incluir") != null) {
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String rg = request.getParameter("rg");
                    String cpf = request.getParameter("cpf");
                    String endereco = request.getParameter("endereco");

                    Cliente c = new Cliente(nome, email, telefone, rg, cpf, endereco);

                    int retorno = Cliente.adicionar(c);

                    Cliente cliente = Cliente.clienteById(retorno);

                    response.sendRedirect(request.getRequestURI());
                } else if (request.getParameter("excluir") != null) {
                    String id = request.getParameter("id");
                    int i = Integer.parseInt(id);
                }
            } catch (Exception ex) {%>

        <div style='color: red;'>Error <%= ex.getMessage()%></div>
        <%
            }
        %>

        <div>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>RG</th>
                    <th>CPF</th>
                    <th>Endereço</th>
                        <% for (Cliente cliente : Cliente.listar()) { %>
                        <% Cliente c = cliente;%>
                </tr>
                <tr>
                    <%
                        try {
                    %>
                        <td><%= c.getId()%></td>
                        <td><%= c.getNome()%></td>
                        <td><%= c.getEmail()%></td>
                        <td><%= c.getTelefone()%></td>
                        <td><%= c.getRg()%></td>
                        <td><%= c.getCpf()%></td>
                        <td><%= c.getEndereco()%></td>
                    <% } catch (Exception ex) {}%>
                    <td>
                        <form>
                            <input type="hidden" name="id" value=""/>
                            <input type="submit" name="excluir" value="excluir"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
