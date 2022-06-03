/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.model;


import br.com.DAO.FornecedorDAO;
import br.com.DAO.TipoProdutoDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.stream.Collectors;

/**
 *
 * @author lucas
 */
public class Produto {
    
    private int id;
    private String nome_produto;
    private String valor;
    private int fk_tipo_produto;
    private int fk_fornecedor;
    private TipoProduto fk_tpProduto;
    private ArrayList<Fornecedor> fornecedor;
    private ArrayList<Produto> listaProdutos;
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public int getFk_tipo_produto() {
        return fk_tipo_produto;
    }

    public void setFk_tipo_produto(int fk_tipo_produto) {
        this.fk_tipo_produto = fk_tipo_produto;
    }

    public int getFk_fornecedor() {
        return fk_fornecedor;
    }

    public void setFk_fornecedor(int fk_fornecedor) {
        this.fk_fornecedor = fk_fornecedor;
    }

    public ArrayList<Produto> getListaProdutos() {
        return listaProdutos;
    }

    public void setListaProdutos(ArrayList<Produto> listaProdutos) throws ClassNotFoundException {
        this.listaProdutos = listaProdutos;
    }

    public ArrayList<Fornecedor> getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(ArrayList<Fornecedor> fornecedor) {
        this.fornecedor = fornecedor;
    }
    
    public String RecuperaNomeFornecedor(int id) throws ClassNotFoundException, SQLException{
        FornecedorDAO fornecedorDAO = new FornecedorDAO();
        ArrayList<Fornecedor> listaFornecedor = fornecedorDAO.RecuperaFornecedor();
        String forneced = listaFornecedor.stream().filter(f -> f.getId() == id).map(Fornecedor::getNome_fornecedor).collect(Collectors.joining(", "));
        return forneced;
    }
    
     public String RecuperaNomeTipo(int id) throws ClassNotFoundException, SQLException{
        TipoProdutoDAO tipoProdutoDAO = new TipoProdutoDAO();
        ArrayList<TipoProduto> listaTipos = tipoProdutoDAO.RecuperaTipo();
        String tipo = listaTipos.stream().filter(f -> f.getId() == id).map(TipoProduto::getTipo).collect(Collectors.joining(", "));
        return tipo;
    }
    
    
    
    
    
}
