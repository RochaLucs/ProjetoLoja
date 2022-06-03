/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.model;

import br.com.DAO.ItemVendaDAO;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class ItemVenda {
    private int id;
    private int fkVenda;
    private int fkProduto;
    private ArrayList<Integer> listaIdProdutos = new ArrayList<>();
    private ArrayList<Produto> listaProdutos = new ArrayList<>();
    
    private String valorItens;

    public int getId() {
        //System.out.println(id);
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFkVenda() {
        return fkVenda;
    }

    public void setFkVenda(int fkVenda) {
        this.fkVenda = fkVenda;
    }

    public int getFkProduto() {
        return fkProduto;
    }

    public void setFkProduto(int fkProduto) {
        this.fkProduto = fkProduto;
    }

    public String getValorItens() {
        return valorItens;
    }

    public void setValorItens(String valorItens) {
        this.valorItens = valorItens;
    }

    public ArrayList<Integer> getListaIdProdutos() {
        return listaIdProdutos;
    }

    public void setListaIdProdutosa(ArrayList<Integer> listaIdProdutos) {
        this.listaIdProdutos = listaIdProdutos;
    }
    
    public void adicionaItens(int id){
        listaIdProdutos.add(id);
    }

    public ArrayList<Produto> getListaProdutos() {
        return listaProdutos;
    }

    public void setListaProdutos(ArrayList<Produto> listaProdutos) {
        this.listaProdutos = listaProdutos;
    }
    
    public void adicionaProdutos(Produto produto){
        listaProdutos.add(produto);
    }
    
    public void removeProduto(Produto produto){
        listaProdutos.remove(produto);
    }
    
}
