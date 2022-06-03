<%@page import="br.com.DAO.ClienteDAO"%>
<%@page import="br.com.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cliente</title>
    </head>
    <body>
        <%
            try {
                Cliente cliente = new Cliente();
                cliente.setCpf(Integer.parseInt(request.getParameter("cpfCliente")));
                cliente.setNome_cliente(request.getParameter("nomeCliente"));
                cliente.setTx_email(request.getParameter("emailCliente"));
                cliente.setTx_cel(request.getParameter("celularCliente"));

                ClienteDAO clienteDAO = new ClienteDAO();
                clienteDAO.cadastrarCliente(cliente);
                out.print("Cliente Inserido!!");
            } catch (Exception e) {
            }
        %>
    </body>
</html>
