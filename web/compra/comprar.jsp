<%-- 
    Document   : comprar
    Created on : 29/05/2022, 09:44:23
    Author     : lucas
--%>

<%@page import="br.com.DAO.ClienteDAO"%>
<%@page import="br.com.model.Cliente"%>
<%@page import="br.com.model.ItemVenda"%>
<%@page import="br.com.model.Produto"%>
<%@page import="java.util.ArrayList"%>
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
        <form action="finalizarCompra.jsp" method="POST">
            <%
            try {
                Cliente cliente = new Cliente();
                cliente.setNome_cliente(request.getParameter("nomeCliente"));
                cliente.setCpf(Integer.parseInt(request.getParameter("cpfCliente")));
                //ClienteDAO clienteDAO = new ClienteDAO();
                //cliente = clienteDAO.BuscaClientePorCpf(cliente);
                out.print("<label>Nome:</label>");
                out.print("<input readonly=\"" + "true\"" + "type=\"" + "text"+ "\"name=\"" +"nomeCliente\"" + "value=" + cliente.getNome_cliente() + "><br>");
                out.print("<label>CPF:</label>");
                out.print("<input readonly=\"" + "true\"" + "type=\"" + "text"+ "\"name=\"" +"cpfCliente\"" + "value=" + cliente.getCpf() + "><br><br><br>");

            } catch (Exception e) {
            }
        %>     
            
             <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th></th>
                    <th>Nome</th>
                    <th>Fornecedor</th>
                    <th>Tipo</th>
                    <th>Valor</th>
                </tr>      
                        
      <%
            try {
                ProdutoDAO produtoDAO = new ProdutoDAO();
                Produto produto = new Produto();
                ArrayList<Produto> lista = produtoDAO.RecuperaProduto();
                   for (int num = 0; num < lista.size(); num++) {
                    out.print("<tr>");
                    out.print("<td> <input type=" + "\"checkbox" + "\"" + "value=" + "\"" + lista.get(num).getId() + "\"" + "name=" + "\"selected" + num + "\"" + "></td>");
                    out.print("<td>" + lista.get(num).getNome_produto()+ "</td>");
                    out.print("<td> " + produto.RecuperaNomeFornecedor(lista.get(num).getFk_fornecedor())+ "</td>");
                    out.print("<td> " + produto.RecuperaNomeTipo(lista.get(num).getFk_tipo_produto())+ "</td>");
                    out.print("<td> " + lista.get(num).getValor()+ "</td>");
                    out.print("</tr>");
                    }               

            } catch (Exception e) {
            }
        %>            
        
        
            </table>
        <br><button type="submit">Finalizar Compra</button>      
        </form>
    </body>
</html>
