/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class ProdutoDAO {
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Produto> lista = new ArrayList<>();
    Produto p = new Produto();
    
    
     public void cadastrarProduto(Produto produto) throws ClassNotFoundException{
        String sql = "insert into tb_produto (no_produto, valor, fk_tipo_produto, fk_fornecedor) values (?,?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, produto.getNome_produto());
            pstm.setString(2, produto.getValor());
            pstm.setInt(3, produto.getFk_tipo_produto());
            pstm.setInt(4, produto.getFk_fornecedor());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
        }
    }
    
    
    public ArrayList<Produto> RecuperaProduto() throws ClassNotFoundException{
        String sql = "select * from tb_produto";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                Produto produto = new Produto();
                produto.setId(rs.getInt("id_produto"));
                produto.setNome_produto(rs.getString("no_produto"));
                produto.setValor(rs.getString("valor"));
                produto.setFk_tipo_produto(rs.getInt("fk_tipo_produto"));
                produto.setFk_fornecedor(rs.getInt("fk_fornecedor"));
          
                lista.add(produto);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return lista;
    }
    
    public Produto RecuperaProdutoPorID(int id) throws ClassNotFoundException{
        String sql = "select * from tb_produto where id_produto=" + id;
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                p.setId(rs.getInt("id_produto"));
                p.setNome_produto(rs.getString("no_produto"));
                p.setValor(rs.getString("valor"));
                p.setFk_tipo_produto(rs.getInt("fk_tipo_produto"));
                p.setFk_fornecedor(rs.getInt("fk_fornecedor"));
                lista.add(p);
            }
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return p;
    }
    
    
    
}
