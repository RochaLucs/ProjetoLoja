<%-- 
    Document   : finalizarCompra
    Created on : 29/05/2022, 10:58:23
    Author     : lucas
--%>

<%@page import="br.com.model.Cliente"%>
<%@page import="br.com.DAO.ClienteDAO"%>
<%@page import="br.com.model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ProdutoDAO"%>
<%@page import="br.com.DAO.ItemVendaDAO"%>
<%@page import="br.com.model.ItemVenda"%>
<%@page import="br.com.model.Venda"%>
<%@page import="br.com.DAO.VendaDAO"%>
<%@page import="br.com.model.Venda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <body>
        <%
            try {
                ProdutoDAO produtoDAO = new ProdutoDAO();
                ArrayList<Produto> lista = produtoDAO.RecuperaProduto();
                ClienteDAO clienteDAO = new ClienteDAO();
                Cliente cliente = new Cliente();
                cliente.setCpf(Integer.parseInt(request.getParameter("cpfCliente")));
                cliente = clienteDAO.BuscaClientePorCpf(cliente);
                Venda venda = new Venda();
                venda.setFk_cliente(cliente.getId());
                venda.setValor_total("0");

                VendaDAO vendaDAO = new VendaDAO();
                
    
                
                ItemVenda itemVenda = new ItemVenda();
                
                for(int num = 0; num < lista.size(); num++){
                    if(request.getParameter("selected" + num) != null){
                        itemVenda.adicionaItens(Integer.parseInt(request.getParameter("selected" + num)));
                    }else{
                        lista.remove(lista.get(num));
                    }
                }
                if(lista.isEmpty() && lista == null){
                    out.print("Nenhum item foi selecionado");
                }else{
                
                for(Produto produto : lista){
                    venda.somaValorTotal(produto.getValor());
                }
                
                vendaDAO.cadastrarVenda(venda);
                venda.setId(vendaDAO.RecuperaUltimoId());
                itemVenda.setFkVenda(venda.getId());
                
                ItemVendaDAO itemvendaDAO = new ItemVendaDAO();
                for(Produto produto : lista){
                    itemVenda.setFkProduto(produto.getId());
                    itemVenda.setValorItens(produto.getValor());
                    itemvendaDAO.registrarItemVenda(itemVenda);
                }
                   
                out.print("Compra Finalizada!!");
                }
            } catch (Exception e) {
            }
        %>
        <br><button type="submit"><a href="/ProjetoLoja">Voltar</a></button> <br>
    </body>
</html>
