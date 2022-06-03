<%-- 
    Document   : inserirProduto
    Created on : 27/05/2022, 13:05:02
    Author     : lucas
--%>

<%@page import="br.com.model.Produto"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Produto</title>
    </head>
    <body>
        <%
            try {
                Produto produto = new Produto();
                produto.setNome_produto(request.getParameter("NomeProduto"));
                produto.setFk_tipo_produto(Integer.parseInt(request.getParameter("TipoProduto")));
                produto.setFk_fornecedor(Integer.parseInt(request.getParameter("Fornecedor")));
                produto.setValor(request.getParameter("ValorProduto"));

                ProdutoDAO produtoDAO = new ProdutoDAO();
                produtoDAO.cadastrarProduto(produto);
                out.print("Produto Inserido!!");
            } catch (Exception e) {
            }
        %>
        <button type="submit"><a href="/ProjetoLoja">Voltar</a></button> <br>
    </body>
</html>
