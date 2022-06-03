<%@page import="br.com.model.Cliente"%>
<%@page import="br.com.DAO.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Clientes</title>
    </head>
    <body>
        
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Email</th>
                    <th>Celular</th>
                </tr>      
                        
                         <%
            try {
                 ClienteDAO clienteDAO = new ClienteDAO();
                ArrayList<Cliente> lista = clienteDAO.pesquisarCliente();
                   for (int num = 0; num < lista.size(); num++) {
                    out.print("<tr>");
                    out.print("<td>" +lista.get(num).getNome_cliente()+ "</td>");
                    out.print("<td> " + lista.get(num).getCpf()+ "</td>");
                    out.print("<td> " + lista.get(num).getTx_email()+ "</td>");
                    out.print("<td> " + lista.get(num).getTx_cel()+ "</td>");
                    out.print("</tr>");
                    }               

            } catch (Exception e) {
            }
        %>
            </table>

         <button type="submit"><a href="cliente.jsp">Voltar</a></button> <br>
    </body>
</html>
