<%-- 
    Document   : inserirProduto
    Created on : 27/05/2022, 13:05:02
    Author     : lucas
--%>

<%@page import="br.com.DAO.FornecedorDAO"%>
<%@page import="br.com.model.Fornecedor"%>
<%@page import="br.com.model.Produto"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Fornecedor</title>
    </head>
    <body>
        <%
            try {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setNome_fornecedor(request.getParameter("NomeFornecedor"));
                fornecedor.setCnpj(request.getParameter("Cnpj"));

                FornecedorDAO fornecedorDAO = new FornecedorDAO();
               fornecedorDAO.cadastrarFornecedor(fornecedor);
                out.print("Fornecedor Inserido!!");
            } catch (Exception e) {
            }
        %>
        <button type="submit"><a href="fornecedor.jsp">Voltar</a></button> <br>
    </body>
</html>
