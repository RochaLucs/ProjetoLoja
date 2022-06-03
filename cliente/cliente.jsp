<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cliente</title>
    </head>
    <body>
        <form action="inserirCliente.jsp" method="POST">

            <label>CPF do Cliente </label> 
            <input type="text" name="cpfCliente" maxlength="11"><br>
            <label>Nome do Cliente </label>  
            <input type="text" name="nomeCliente"><br>
            <label>Email do Cliente </label>  
            <input type="text" name="emailCliente"><br> 
            <label>Celular do Cliente </label> 
            <input type="text" name="celularCliente"><br> 


            <button type="submit">CADASTRAR</button>             
        </form>
        <button type="submit"><a href="listarCliente.jsp">Listar Clientes</a></button> <br>
        <button type="submit"><a href="/ProjetoLoja">Voltar</a></button> <br>

    </body>
</html>
