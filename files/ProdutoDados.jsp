<%-- 
    Document   : ProdutoDados
    Created on : Apr 19, 2026, 11:12:36 PM
    Author     : Twoguini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="cadastroee.model.Produto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados Produto</title>
        <% 
            Produto product = (Produto) request.getAttribute("product");
            String action = (product == null) ? "incluir" : "alterar";
        %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <h1>Dados do Produto</h1>
        <form method="post" action="ServletProdutoFC" class="form">
            <div class="mb-3">
                <label for="name" class="form-label">Nome:</label>
                <input type="text" name="name" id="name" class="form-control" <%= (product != null)? String.format("value=\"%s\"", product.getName()) : "" %>>
            </div>
            <div class="mb-3">
                <label for="qtd" class="form-label">Quantidade:</label>
                <input type="number" name="qtd" id="qtd" min="0" class="form-control" <%= (product != null)? String.format("value=\"%d\"", product.getQtd()) : "" %>>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Preço</label>
                <input type="number" name="price" id="price" min="0.0" class="form-control" <%= (product != null)? String.format("value=\"%.2f\"", product.getPreco()) : "" %>>
            </div>
            <div hidden>
                <%if("alterar".equals(action)) {%>
                    <input name="id" id="id" value="<%= product.getId() %>">
                <%}%>
                <input name="action" id="action" value="<%= action %>">
            </div>
            <button type="submit" class="btn btn-primary"><%= (product == null)? "Adicionar Produto" : "Editar Produto" %></button>
        </form>
    </body>
</html>
