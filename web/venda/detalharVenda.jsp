<%-- 
    Document   : detalhar venda
    Created on : 31/05/2022, 11:33:11
    Author     : lucas
--%>

<%@page import="br.com.model.TipoProduto"%>
<%@page import="br.com.DAO.TipoProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page import="br.com.model.Produto"%>
<%@page import="br.com.DAO.ItemVendaDAO"%>
<%@page import="br.com.model.ItemVenda"%>
<%@page import="br.com.model.Venda"%>
<%@page import="br.com.DAO.VendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th>Produto</th>
                    <th>Tipo</th>
                    <th>Valor</th>
                    
                </tr>      
                        
                         <%
            try {
                int id = Integer.parseInt(request.getParameter("idVenda"));
                VendaDAO vendaDAO = new VendaDAO();
                Venda venda = vendaDAO.RecuperaVendaPorID(id);
                ItemVendaDAO itemVendaDAO = new ItemVendaDAO();
                ArrayList<ItemVenda> listaItens = itemVendaDAO.RecuperaItensDaVenda(id);
                TipoProdutoDAO tipoProdutoDAO = new TipoProdutoDAO();
                ProdutoDAO produtoDAO = new ProdutoDAO();
                
                   for (int num = 0; num < listaItens.size(); num++) {
                    Produto produto = produtoDAO.RecuperaProdutoPorID(listaItens.get(num).getFkProduto());
                    TipoProduto tipoProduto= tipoProdutoDAO.RecuperaTipoPorID(produto.getFk_tipo_produto());
                    out.print("<tr>");
                    out.print("<td>" + produto.getNome_produto()+ "</td>");
                    out.print("<td> " + tipoProduto.getTipo() + "</td>");
                    out.print("<td> " + produto.getValor()+ "</td>");
                    out.print("</tr>");
                    }
                   out.print("<tr><th>ValorTotal</th>");
                   out.print("<td></td>");
                   out.print("<td>" + venda.getValor_total()+ "</td>");

            } catch (Exception e) {
            }
            
        %>
            </table>
            <br><button type="submit"><a href="vendas.jsp">Voltar</a></button> <br>
    </body>
</html>
