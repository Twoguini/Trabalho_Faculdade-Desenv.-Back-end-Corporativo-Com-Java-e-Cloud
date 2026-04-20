<%-- 
    Document   : ProdutoLista
    Created on : Apr 19, 2026, 9:35:44 PM
    Author     : Twoguini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <h1>Listagem Produtos</h1>
        <a href="ServletProdutoFC?action=formIncluir" class=" btn btn-primary m-2">Novo Produto</a>
        <%@ page import="java.util.List" %>
        <%@ page import="cadastroee.model.Produto" %>

        <%
            List<Produto> lista = (List<Produto>) request.getAttribute("list");
        %>
        
        <table class="table table-striped">
            <tr class="table-dark">
                <th>ID</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
            <%
                if (lista != null) {
                    for (Produto p : lista) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td><%= p.getQtd() %></td>
                <td><%= p.getPreco() %></td>
                <td>
                    <a href="ServletProdutoFC?action=formAlterar&id=<%= p.getId() %>" class="btn btn-primary btn-sm">
                        Alterar
                    </a>

                    |

                    <a href="ServletProdutoFC?action=excluir&id=<%= p.getId() %>" class="btn btn-danger btn-sm">
                        Excluir
                    </a>
                </td>
            </tr>

            <%
                    }
                }
            %>
        </table>
    </body>
</html>
