<%-- 
    Document   : produto
    Created on : 27/05/2022, 11:19:00
    Author     : lucas
--%>

<%@page import="br.com.DAO.ClienteDAO"%>
<%@page import="br.com.model.Cliente"%>
<%@page import="br.com.model.Venda"%>
<%@page import="br.com.DAO.VendaDAO"%>
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
                    <th>Cliente</th>
                    <th>Data</th>
                    <th>Valor Total</th>
                    <th>Visualizar</th>
                    
                </tr>      
                        
                         <%
            try {
                VendaDAO vendaDAO = new VendaDAO();
                ArrayList<Venda> listaVendas = vendaDAO.RecuperaVendas();
                Cliente cliente = new Cliente();
                ClienteDAO clienteDAO = new ClienteDAO();
                   for (int num = 0; num < listaVendas.size(); num++) {
                    cliente = clienteDAO.RecuperaClientePorId(listaVendas.get(num).getFk_cliente());
                    out.print("<tr>");
                    out.print("<td>" + cliente.getNome_cliente()+ "</td>");
                    out.print("<td> " + listaVendas.get(num).fomataData()+ "</td>");
                    out.print("<td> " + listaVendas.get(num).getValor_total()+ "</td>");
                    out.print("<td> <a href=\"" + "detalharVenda.jsp?idVenda=" + listaVendas.get(num).getId() + "\">Detalhar</a></td>");
                    out.print("</tr>");
                    }               

            } catch (Exception e) {
            }
        %>
            </table>
      
            <button type="submit"><a href="/ProjetoLoja" >Voltar</a></button> <br>
    </body>
</html>
