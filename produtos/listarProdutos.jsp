<%-- 
    Document   : produto
    Created on : 27/05/2022, 11:19:00
    Author     : lucas
--%>

<%@page import="java.util.stream.Stream"%>
<%@page import="br.com.model.TipoProduto"%>
<%@page import="br.com.DAO.TipoProdutoDAO"%>
<%@page import="br.com.model.Fornecedor"%>
<%@page import="br.com.DAO.FornecedorDAO"%>
<%@page import="br.com.model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprar</title>
    </head>
    <body>
        
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th>Nome</th>
                    <th>Fornecedor</th>
                    <th>Tipo</th>
                    <th>Valor</th>
                </tr>      
                        
                         <%
            try {
                ProdutoDAO produtoDAO = new ProdutoDAO();
                ArrayList<Produto> lista = produtoDAO.RecuperaProduto();
                Produto produto = new Produto();
                   for (int num = 0; num < lista.size(); num++) {
                    out.print("<tr>");  
                    out.print("<td> " + lista.get(num).getNome_produto()+ "</td>");
                    out.print("<td> " + produto.RecuperaNomeFornecedor(lista.get(num).getFk_fornecedor())+ "</td>");
                    out.print("<td> " + produto.RecuperaNomeTipo(lista.get(num).getFk_tipo_produto())+ "</td>");
                    out.print("<td> " + lista.get(num).getValor()+ "</td>");
                    out.print("</tr>");
                    }               
            } catch (Exception e) {
            }
        %>
            </table>
             
            <br><button type="submit"><a href="/ProjetoLoja/fornecedor/fornecedor.jsp">Cadastrar Fornecedor</a></button>
            <button type="submit"><a href="/ProjetoLoja/tipos/tipo.jsp">Cadastrar Novo Tipo</a></button> <br>
             <br><button type="submit"><a href="/ProjetoLoja/produtos/produto.jsp">Voltar</a></button>
            <button type="submit"><a href="/ProjetoLoja">Inicio</a></button> <br>
    </body>
</html>
