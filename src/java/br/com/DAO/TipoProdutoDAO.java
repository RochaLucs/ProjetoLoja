/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;


import br.com.model.TipoProduto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class TipoProdutoDAO {
        
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<TipoProduto> lista = new ArrayList<>();
    TipoProduto tp = new TipoProduto();
    
    
    public void cadastraTipoProduto(TipoProduto tipoProduto) throws ClassNotFoundException{
        String sql = "insert into tb_tipo_produto (no_tipo) values (?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, tipoProduto.getTipo());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<TipoProduto> RecuperaTipo() throws ClassNotFoundException{
        String sql = "select * from tb_tipo_produto";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                TipoProduto tipoProduto = new TipoProduto();
                tipoProduto.setId(rs.getInt("id_tipo_produto"));
                tipoProduto.setTipo(rs.getString("no_tipo"));
          
                lista.add(tipoProduto);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return lista;
    }
    
     public TipoProduto RecuperaTipoPorID(int id) throws ClassNotFoundException{
        String sql = "select * from tb_tipo_produto where id_tipo_produto = " + id;
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                tp.setId(rs.getInt("id_tipo_produto"));
                tp.setTipo(rs.getString("no_tipo"));
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return tp;
    }
    
    
}
