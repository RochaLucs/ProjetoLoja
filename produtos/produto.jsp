<%-- 
    Document   : produto
    Created on : 27/05/2022, 13:12:38
    Author     : lucas
--%>

<%@page import="br.com.model.Fornecedor"%>
<%@page import="br.com.DAO.FornecedorDAO"%>
<%@page import="br.com.model.TipoProduto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.TipoProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Produto</title>
    </head>
    <body>
         <form action="inserirProduto.jsp" method="POST">

            <label>Nome Produto </label> 
            <input type="text" name="NomeProduto"><br>
            <label>Tipo </label>  
            <select name="TipoProduto"><br>
                    <%
                    try {
                        TipoProdutoDAO tipoProdutoDAO = new TipoProdutoDAO();
                        ArrayList<TipoProduto> lista = tipoProdutoDAO.RecuperaTipo();

                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<option value="+ lista.get(num).getId() +">"+ lista.get(num).getTipo() +"</option>");

                            }

                    } catch (Exception e) {
                    }
                %>  
            </select><br>
            <label>Fornecedor </label>  
            <select name="Fornecedor"><br>
                    <%
                    try {
                        FornecedorDAO fornecedorDAO = new FornecedorDAO();
                        ArrayList<Fornecedor> lista = fornecedorDAO.RecuperaFornecedor();

                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<option value="+ lista.get(num).getId() +">"+ lista.get(num).getNome_fornecedor()+"</option>");

                            }

                    } catch (Exception e) {
                    }
                %>  
            </select><br>
            <label>Valor </label> 
            <input type="text" name="ValorProduto"><br> 


            <br><button type="submit">CADASTRAR</button>
            <button type="submit"><a href="listarProdutos.jsp">Listar Produtos</a></button>
        </form>
            
        <br><button type="submit"><a href="/ProjetoLoja">Voltar</a></button> <br>
    </body>
</html>
