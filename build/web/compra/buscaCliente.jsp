<%-- 
    Document   : buscaCliente
    Created on : 31/05/2022, 10:07:19
    Author     : lucas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ClienteDAO"%>
<%@page import="br.com.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="comprar.jsp" method="POST">
           <%
            try {
                if(!request.getParameter("cpfCliente").isEmpty()){
                Cliente cliente = new Cliente();
                cliente.setCpf(Integer.parseInt(request.getParameter("cpfCliente")));

                ClienteDAO clienteDAO = new ClienteDAO();
                ArrayList<Cliente> clientes = new ArrayList();
                cliente = clienteDAO.BuscaClientePorCpf(cliente);
                if(cliente.getNome_cliente() != null){
                    
                    out.print("<label>Nome:</label>");
                    out.print("<input readonly=\"" + "true\"" + "type=\"" + "text"+ "\"name=\"" +"nomeCliente\"" + "value=" + cliente.getNome_cliente() + "><br>");
                    out.print("<label>CPF:</label>");
                    out.print("<input readonly=\"" + "true\"" + "type=\"" + "text"+ "\"name=\"" +"cpfCliente\"" + "value=" + cliente.getCpf() + "><br>");
                    //out.print("Nome:" + cliente.getNome_cliente() + "<br>" + "CPF:" + cliente.getCpf());
                    //out.print("Nome:" + cliente.getNome_cliente() + "<br>" + "CPF:" + cliente.getCpf());
                    out.print("<br><button type=\"" + "submit" +"\">Prosseguir</button>");
                }
                else{
                    out.print("Cliente não encontrado ! <br><br>");
                }}
                else{
                    out.print("Nenhum cpf foi inserido ! <br><br>");
                }
                
            } catch (Exception e) {
            }
        %>

        <button type="submit"><a href="clienteCompra.jsp">Voltar</a></button> <br>
        <form/>
        
    </body>
</html>
