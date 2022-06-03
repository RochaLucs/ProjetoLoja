<%-- 
    Document   : produto
    Created on : 27/05/2022, 11:19:00
    Author     : lucas
--%>

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
                    <th>CNPJ</th>
                </tr>      
                        
                         <%
            try {
                FornecedorDAO fornecedorDAO = new FornecedorDAO();
                ArrayList<Fornecedor> lista = fornecedorDAO.RecuperaFornecedor();
                   for (int num = 0; num < lista.size(); num++) {
                    out.print("<tr>");
                    out.print("<td>" + lista.get(num).getNome_fornecedor()+ "</td>");
                    out.print("<td> " + lista.get(num).getCnpj()+ "</td>");
                    out.print("</tr>");
                    }               

            } catch (Exception e) {
            }
        %>
            </table>
             <button type="submit"><a href="fornecedor.jsp">Voltar</a></button> <br>
            
    </body>
</html>
