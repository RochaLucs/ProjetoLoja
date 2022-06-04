<%-- 
    Document   : produto
    Created on : 27/05/2022, 11:19:00
    Author     : lucas
--%>

<%@page import="br.com.model.TipoProduto"%>
<%@page import="br.com.DAO.TipoProdutoDAO"%>
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
                    <th>Tipo</th>
                </tr>      
                        
                         <%
            try {
                TipoProdutoDAO tipoProdutoDAO = new TipoProdutoDAO();
                ArrayList<TipoProduto> lista = tipoProdutoDAO.RecuperaTipo();
                   for (int num = 0; num < lista.size(); num++) {
                    out.print("<tr>");
                    out.print("<td>" + lista.get(num).getTipo()+ "</td>");
                    out.print("</tr>");
                    }               

            } catch (Exception e) {
            }
        %>
            </table>
         <%
            try {
            String voltar = request.getParameter("voltaLista");
            if(voltar!= null){
                 System.out.println(voltar);
                 out.print("<button type=\"" + "submit\"" + "><a href=\"" + "/ProjetoLoja/produtos/listarProdutos.jsp\"" + ">Voltar</a></button>");
             }else{
                 System.out.println(voltar);
                 out.print("<button type=\"" + "submit\"" + "><a href=\"" + "tipo.jsp\"" + ">Voltar</a></button>");
             }      
            } catch (Exception e) {
            }
            
            %>
    </body>
</html>
