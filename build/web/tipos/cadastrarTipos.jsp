<%-- 
    Document   : inserirProduto
    Created on : 27/05/2022, 13:05:02
    Author     : lucas
--%>

<%@page import="br.com.DAO.TipoProdutoDAO"%>
<%@page import="br.com.model.TipoProduto"%>
<%@page import="br.com.model.Produto"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo Produto</title>
    </head>
    <body>
        <%
            try {
                TipoProduto tipoProduto = new TipoProduto();
                tipoProduto.setTipo(request.getParameter("TipoProduto"));


                TipoProdutoDAO tipoProdutoDAO = new TipoProdutoDAO();
                tipoProdutoDAO.cadastraTipoProduto(tipoProduto);
                out.print("Tipo Inserido!!");
            } catch (Exception e) {
            }
        %>
         <button type="submit"><a href="tipo.jsp">Voltar</a></button> <br>
    </body>
</html>
