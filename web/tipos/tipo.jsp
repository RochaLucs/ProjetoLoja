<%-- 
    Document   : produto
    Created on : 27/05/2022, 13:12:38
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
         <form action="cadastrarTipos.jsp" method="POST">

            <label>Tipo Produto </label> 
            <input type="text" name="TipoProduto">

            <button type="submit">CADASTRAR</button> <br>             
        </form>
        <br><button type="submit"><a href="listarTipos.jsp">Listar Tipos</a></button> <br>
        <br><button type="submit"><a href="/ProjetoLoja/produtos/listarProdutos.jsp">Voltar</a></button>
        <button type="submit"><a href="/ProjetoLoja">Inicio</a></button><br>
    </body>
</html>
