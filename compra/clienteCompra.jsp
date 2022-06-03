<%-- 
    Document   : clienteCompra
    Created on : 31/05/2022, 10:04:29
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <form action="buscaCliente.jsp" method="POST">

            <label>CPF do Cliente </label> 
            <input type="text" name="cpfCliente"><br>

            <br><button type="submit">Buscar</button>
            <button type="submit"><a href="/ProjetoLoja">Voltar</a></button> <br>
        </form>
       
    </body>
</html>
